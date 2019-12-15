/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nhapmoncnpm.controller.web;

import com.google.gson.Gson;
import com.nhapmoncnpm.model.CartModel;
import com.nhapmoncnpm.model.CategoryModel;
import com.nhapmoncnpm.model.ProductModel;
import com.nhapmoncnpm.model.UserModel;
import com.nhapmoncnpm.service.ICartService;
import com.nhapmoncnpm.service.ICategoryService;
import com.nhapmoncnpm.service.IProductService;
import com.nhapmoncnpm.service.IUserService;
import com.nhapmoncnpm.utils.FormUtil;
import com.nhapmoncnpm.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;

/**
 * s
 *
 * @author HDN
 */
@WebServlet(urlPatterns = {"/trang-chu", "/dang-nhap", "/thoat", "/san-pham", "/dang-ky", "/lien-he"})
public class HomeController extends HttpServlet {

    private Gson gson = new Gson();
    private static final long serialVersionUID = 1L;
    @Inject
    private ICategoryService categoryService;
    @Inject
    private IProductService productService;
    @Inject
    private IUserService userService;
    @Inject
    private ICartService cartService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String contact = request.getParameter("contact");
        String search = request.getParameter("search");
        String profile = request.getParameter("profile");
        String shopCart = request.getParameter("cart");
        UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
        if (action != null && action.equals("login") && model == null) {
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            if (message != null && alert != null) {
                String messageAttribute = null;
                switch (message) {
                    case "not_permission":
                        messageAttribute = "Not permission";
                        break;
                    case "username_password_invalid":
                        messageAttribute = "Username or Password invalid";
                        break;
                    case "not_login":
                        messageAttribute = "Not login";
                        break;
                    case "admin_block":
                        messageAttribute = "The administrator has blocked you, please contact the administrator to recover";
                }
                request.setAttribute("message", messageAttribute);
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("views/web/login.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("signup") && model == null) {
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");
            if (message != null && alert != null) {
                String messageAttribute = null;
                switch (message) {
                    case "exist_email":
                        messageAttribute = "Existed email";
                        break;
                    case "not_full_fillout":
                        messageAttribute = "Fill out fully for fields";
                        break;
                }
                request.setAttribute("message", messageAttribute);
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("views/web/signup.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/trang-chu");
            return;
        } else if (action != null && model != null) {
            response.sendRedirect(request.getContextPath() + "/trang-chu");
            return;
        }
        CategoryModel categoryModel = new CategoryModel();
        categoryModel.setListResult(categoryService.findAll());
        ProductModel products = new ProductModel();
        String idProduct = request.getParameter("idproduct");
        String idCategory = request.getParameter("idcategory");
        String view = "";
        List<ProductModel> listRandomProducts = getRandomProducts(productService.findAll(), 2);
        if (idProduct != null) {
            products = productService.findOne(Long.parseLong(idProduct));
            products.setListResult(productService.findByCategoryId(products.getCategoryId()));
            categoryModel.setName(categoryService.findOne(products.getCategoryId()).getName());
            view = "./views/web/detailProduct.jsp";
        } else if (idProduct == null && idCategory == null) {
            listRandomProducts = getRandomProducts(productService.findAll(), 12);
            view = "./views/web/home.jsp";
        } else if (idProduct == null && idCategory != null) {
            categoryModel.setId(Long.parseLong(idCategory));
            categoryModel.setName(categoryService.findOne(Long.parseLong(idCategory)).getName());
            products.setListResult(productService.findByCategoryId(Long.parseLong(idCategory)));
            request.setAttribute("count", productService.count(categoryModel.getId()));
            view = "./views/web/productsOfCategory.jsp";
        }
        if(search != null) {
            products.setListResult(productService.search(search));
            request.setAttribute("search", search);
            view = "./views/web/search.jsp";
        }
        // đưa giỏ hàng và số loại trong giỏ ra view
        UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL"); // kiểm tra xem còn tài khoản không
        CartModel cart = (CartModel) SessionUtil.getInstance().getValue(request, "CARTMODEL");
        List<ProductModel> listProductOfCart = new ArrayList<>();
        CartModel cartModel;
        Long totalPrice = 0L;
        if (user != null) {
            if (cart != null) { // vừa đnhập vào
                List<CartModel> IList = cartService.findAllByUserId(user.getId());
                if (IList != null) {
                    IList.stream().map((i) -> new long[]{i.getId()}).forEach((IIdCart) -> {
                        cartService.delete(IIdCart);
                    });
                }
                for (CartModel i : cart.getListResult()) {
                    cartService.save(new CartModel(user.getId(), i.getProductId(), i.getAmount()));
                }
                SessionUtil.getInstance().removeValue(request, "CARTMODEL");
            }
            cart = new CartModel();
            cart.setListResult(cartService.findAllByUserId(user.getId()));
            for (CartModel iCart : cart.getListResult()) {
                ProductModel iProduct = productService.findOne(iCart.getProductId());
                totalPrice += (long) (iCart.getAmount() * iProduct.getPrice());
                iProduct.setAmount(iCart.getAmount());
                listProductOfCart.add(iProduct);
            }
        } else if (user == null) {
            if (cart != null) {
                for (CartModel iCart : cart.getListResult()) {
                    ProductModel iProduct = productService.findOne(iCart.getProductId());
                    totalPrice += (long) (iCart.getAmount() * iProduct.getPrice());
                    iProduct.setAmount(iCart.getAmount());
                    listProductOfCart.add(iProduct);
                }
            }
        }
        if(contact != null && contact.equals("contact")) {
            view = "./views/web/contact.jsp";
        }
        if(StringUtils.isNotBlank(profile) && profile.equals("profile")) {
            view = "./views/web/profile.jsp";
        }
        if(StringUtils.isNotBlank(shopCart) && shopCart.equals("cart")) {
            view = "./views/web/cart.jsp";
        }
        ProductModel productsOfCart = new ProductModel();
        productsOfCart.setListResult(listProductOfCart);
        request.setAttribute("listRandomProducts", listRandomProducts);
        request.setAttribute("products", products);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("productsOfCart", productsOfCart);
        request.setAttribute("categories", categoryModel);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action != null && action.equals("login")) {
            UserModel model = FormUtil.toModel(UserModel.class, request);
            model = userService.findByUserNameAndPasswordAndStatus(model.getEmailAddress(), model.getPassword(), 1);
            if (model != null && model.getAccess() == 1) {
                SessionUtil.getInstance().putValue(request, "USERMODEL", model);
                UserModel user = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
                switch (model.getRoleModel().getCode()) {
                    case "USER":
                        response.sendRedirect(request.getContextPath() + "/trang-chu");
                        break;
                    case "ADMIN":
                        response.sendRedirect(request.getContextPath() + "/admin-home");
                        break;
                }
            } else if(model != null && model.getAccess() == 0) {
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=admin_block&alert=danger");
            } else {
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
            }
        } else if (action != null && action.equals("signup")) {
            UserModel model = FormUtil.toModel(UserModel.class, request);
            UserModel modelFind = userService.findByEmailAddressAndStatus(model.getEmailAddress(), 1);
            if (modelFind != null) {
                response.sendRedirect(request.getContextPath() + "/dang-ky?action=signup&message=exist_email&alert=danger");
            } else if (modelFind == null) {
                if (StringUtils.isNotBlank(model.getEmailAddress()) && StringUtils.isNotBlank(model.getFirstName())
                        && StringUtils.isNotBlank(model.getLastName()) && StringUtils.isNotBlank(model.getPassword())
                        && StringUtils.isNotBlank(request.getParameter("confirmPassword"))
                        && request.getParameter("confirmPassword").equals(model.getPassword())) {
                    model = userService.save(model);
                    SessionUtil.getInstance().putValue(request, "USERMODEL", model);
                    model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
                    response.sendRedirect(request.getContextPath() + "/trang-chu");
                } else {
                    response.sendRedirect(request.getContextPath() + "/dang-nhap?action=signup&message=not_full_fillout&alert=danger");
                }
            }
        }
        String isPurchase = request.getParameter("isPurchase");
        if (isPurchase != null) {
            Long productIdPurchase = request.getParameter("productId") != null ? Long.parseLong(request.getParameter("productId")) : null;
            Long userIdPurchase = request.getParameter("userId") != null ? Long.parseLong(request.getParameter("userId")) : null;
            ProductModel productPurchase = productService.findOne(productIdPurchase);
            List<CartModel> listProductPurchase = new ArrayList<>();
            response.setContentType("application/json");
            JSONObject obj = new JSONObject();
            if (userIdPurchase == null) {
                CartModel cart = FormUtil.toModel(CartModel.class, request);
                cart = (CartModel) SessionUtil.getInstance().getValue(request, "CARTMODEL");
                if (cart == null) { // tao moi session la PRODUCTMODEL
                    listProductPurchase.add(new CartModel(null, productPurchase.getId(), 1));
                    CartModel cartSession = new CartModel();
                    cartSession.setListResult(listProductPurchase);
                    SessionUtil.getInstance().putValue(request, "CARTMODEL", cartSession);
                    productPurchase.setAmount(productPurchase.getAmount() > 0 ? (productPurchase.getAmount() - 1) : 0);
                    productService.update(productPurchase);
                } else {
                    listProductPurchase = cart.getListResult();
                    switch (isPurchase) {
                        case "plus":
                            boolean isExist = false;
                            for (int i = 0; i < listProductPurchase.size(); i++) {
                                if (Objects.equals(listProductPurchase.get(i).getProductId(), productPurchase.getId())) {
                                    isExist = true;
                                    listProductPurchase.set(i, new CartModel(null, listProductPurchase.get(i).getProductId(), listProductPurchase.get(i).getAmount() + 1));
                                    break;
                                }
                            }   if (isExist == false) {
                                listProductPurchase.add(new CartModel(null, productPurchase.getId(), 1));
                            }   productPurchase.setAmount(productPurchase.getAmount() > 0 ? (productPurchase.getAmount() - 1) : 0);
                            productService.update(productPurchase);
                            break;
                        case "minus":
                            for (int i = 0; i < listProductPurchase.size(); i++) {
                                if (Objects.equals(listProductPurchase.get(i).getProductId(), productPurchase.getId())) {
                                    if (listProductPurchase.get(i).getAmount() > 1) {
                                        listProductPurchase.set(i, new CartModel(null, productPurchase.getId(), listProductPurchase.get(i).getAmount() - 1));
                                    } else if (listProductPurchase.get(i).getAmount() == 1) {
                                        listProductPurchase.remove(i);
                                    }
                                }
                            }   productPurchase.setAmount(productPurchase.getAmount() + 1);
                            productService.update(productPurchase);
                            break;
                        case "remove":
                            for (int i = 0; i < listProductPurchase.size(); i++) {
                                if (Objects.equals(listProductPurchase.get(i).getProductId(), productPurchase.getId())) {
                                    listProductPurchase.remove(i);
                            }
                            }   productPurchase.setAmount(productPurchase.getAmount() + (request.getParameter("amountRemove") != null ? Integer.parseInt(request.getParameter("amountRemove")) : 0));
                            productService.update(productPurchase);
                            break;
                    }

                    cart.setListResult(listProductPurchase);
                    if (listProductPurchase.isEmpty()) {
                        SessionUtil.getInstance().removeValue(request, "CARTMODEL");
                    } else {
                        SessionUtil.getInstance().putValue(request, "CARTMODEL", cart);
                    }
                }

                obj.put("amountKindOfCart", listProductPurchase.size());
            } else {
                CartModel cartModel = cartService.findOneByUserIdAndProductId(userIdPurchase, productIdPurchase);
                if (cartModel == null) {
                    cartModel = new CartModel();
                    cartModel.setUserId(userIdPurchase);
                    cartModel.setProductId(productIdPurchase);
                    cartModel.setAmount(1);
                    cartService.save(cartModel);
                    productPurchase.setAmount(productPurchase.getAmount() > 0 ? (productPurchase.getAmount() - 1) : 0);
                } else {
                    switch (isPurchase) {
                        case "plus":
                            cartModel.setAmount(cartModel.getAmount() + 1);
                            cartService.update(cartModel);
                            productPurchase.setAmount(productPurchase.getAmount() > 0 ? (productPurchase.getAmount() - 1) : 0);
                            break;
                        case "minus":
                            if (cartModel.getAmount() == 1) {
                                long[] ids = new long[]{cartModel.getId()};
                                cartService.delete(ids);
                            } else if (cartModel.getAmount() > 1) {
                                cartModel.setAmount(cartModel.getAmount() > 0 ? (cartModel.getAmount() - 1) : 0);
                                cartService.update(cartModel);
                            }   productPurchase.setAmount(productPurchase.getAmount() + 1);
                            break;
                        case "remove":
                            long[] ids = new long[]{cartModel.getId()};
                            cartService.delete(ids);
                            productPurchase.setAmount(productPurchase.getAmount() + (request.getParameter("amountRemove") != null ? Integer.parseInt(request.getParameter("amountRemove")) : 0));
                            break;
                    }
                }
                productService.update(productPurchase);
                obj.put("amountKindOfCart", cartService.countByUserId(userIdPurchase));
            }
//            String productPurchaseString = this.gson.toJson(productPurchase);
//            PrintWriter out = response.getWriter();
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
//            out.print(productPurchaseString);
//            out.flush();

            obj.put("amountOfProduct", productPurchase.getAmount());
            PrintWriter out = response.getWriter();
            out.print(obj);
            out.flush();

        }
    }

    public List<Long> getRandomElement(List<Long> list, int totalItems) {
        Random rand = new Random();
        List<Long> newList = new ArrayList<>();
        for (int i = 0; i < totalItems; i++) {
            int randomIndex = rand.nextInt(list.size());
            newList.add(list.get(randomIndex));
            list.remove(randomIndex);
        }
        return newList;
    }

    public List<ProductModel> getRandomProducts(List<ProductModel> listProducts, int totalItem) {
        List<Long> listAllId = new ArrayList<>();
        listProducts.stream().forEach((product) -> {
            listAllId.add(product.getId());
        });
        List<Long> listRandomId = getRandomElement(listAllId, totalItem);
        List<ProductModel> listRandomProducts = new ArrayList<>();
        listRandomId.stream().map((id) -> productService.findOne(id)).forEach((productModel) -> {
            listRandomProducts.add(productModel);
        });
        return listRandomProducts;
    }

    public void updateAmountOfProduct() {

    }

}
