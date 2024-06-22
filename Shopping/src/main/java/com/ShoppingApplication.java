package com;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.CommodityMapper;
import com.mapper.UserMapper;
import com.pojo.Commodity;
import com.pojo.ShoppingCart;
import com.pojo.User;
import com.service.CommodityService;
import com.service.UserService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 页面商城初始化
 */
@Controller
public class ShoppingApplication {

    //注入所需对象
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private CommodityService commodityService;

    @RequestMapping("/initShopping")
    public String initShopping(HttpServletRequest request, Model model, HttpSession session){

        List<Commodity> newCommoditiesList =commodityService.findNewCommodities();//最新上市的产品 10个
        List<Commodity> topCommoditiesList =commodityService.findTopCommodities();//销售量最大的商品 10个
        List<List<Commodity>> popularCommoditiesList =commodityService.findPopularCommodities();//最受欢迎找6个 后台处理一下换成前3后3
        List<List<Commodity>>  manPopCommoditiesList =commodityService.findManPopCommodities();//电子科技和男士服装找6个 后台处理一下换成前3后3
        List<List<Commodity>>  womanPopCommoditiesList =commodityService.findWomanPopCommodities();//化妆品和女士服装找6个 后台处理一下换成前3后3
        Map<Integer,String> categoryMap = commodityService.findAllParentCategory();

        User user = (User) session.getAttribute("user");

        if (user!=null) {
            //赋值收藏个数
            user.setFavoriteCount(userService.findFavoriteByUid(user.getId()));
            //给用户购物车个数赋值
            user.setCartCount(userService.findCartByUid(user.getId()));
            //先判断用户购物车是否有内容
            if (userService.isEmptyOfCartByUid(user.getId())) {
                user.setShoppingCarts(userService.viewShoppingCartsByUid(user.getId()));//给用户购物车内容赋值
                //就算用户购物车的商品总个数并赋值，计算用户购物车总价并赋值
                int cartCommodityCount=0;
                double cartPrice=0;
                String shoppingCids="cidList=";
                List<ShoppingCart> shoppingCarts = user.getShoppingCarts();
                for (ShoppingCart shoppingCart : shoppingCarts) {
                    cartCommodityCount+=shoppingCart.getCommodityCount();
                    for (Integer integer = 0; integer < shoppingCart.getCommodityCount(); integer++) {
                        shoppingCids+=(""+shoppingCart.getCommodity().getId()+"&cidList=");
                    }
                    cartPrice+=(shoppingCart.getCommodityCount()*(shoppingCart.getCommodity().getPrice()*shoppingCart.getCommodity().getDiscount()));

                }
                String rightCids = shoppingCids.substring(0,shoppingCids.length()-9);
                user.setCartCommodityCount(cartCommodityCount);
                user.setCartPrice(cartPrice);
                user.setShoppingCids(rightCids);
            }else {
                user.setShoppingCarts(null);
                user.setCartCommodityCount(0);
                user.setCartPrice(0.0);
            }
            session.setAttribute("user",user);//更新数据
        }

        System.out.println("womanPopCommoditiesList = " + womanPopCommoditiesList);
        System.out.println("manPopCommoditiesList = " + manPopCommoditiesList);

        //添加数据 携带到主页
        model.addAttribute("categoryMap",categoryMap);
        model.addAttribute("addRes",request.getSession().getAttribute("addRes"));
        model.addAttribute("newCommoditiesList",newCommoditiesList);
        model.addAttribute("topCommoditiesList",topCommoditiesList);
        model.addAttribute("popularCommoditiesList",popularCommoditiesList);
        model.addAttribute("manPopCommoditiesList",manPopCommoditiesList);
        model.addAttribute("womanPopCommoditiesList",womanPopCommoditiesList);

        return "forward:"+request.getContextPath()+"/index.jsp";
    }

    @RequestMapping("/viewStoreByCategory")
    public String viewStore(Model model,String cname,Integer categoryId,Integer pageNum,Integer pageSize){
        System.out.println("开始去商城");
        //校验参数,因为有可能传过来的参数可能是为null
        if (pageNum==null||pageNum<1){
            pageNum=1;
        }
        if (pageSize==null||pageSize<1){
            pageSize=9;
        }
        List<Commodity> topCommoditiesList =commodityService.findTopCommodities();//销售量最大的商品 10个

        Map<Integer,String> categoryMap = commodityService.findAllParentCategory();//查询种类

        //保存条件,用于展示在页面上,进行回显
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("cname",cname);
        hashMap.put("categoryId",categoryId);
        PageHelper.startPage(pageNum,pageSize);
        List<Commodity> condition = commodityService.viewCommoditiesByPage(categoryId,cname);

        PageInfo<Commodity> commodityPageInfo = new PageInfo<>(condition);
        System.out.println("commodityPageInfo = " + commodityPageInfo);


        model.addAttribute("topCommoditiesList",topCommoditiesList);
        model.addAttribute("categoryMap",categoryMap);
        model.addAttribute("map",hashMap);//用于回显数据
        model.addAttribute("pageInfo",commodityPageInfo);
        return "forward:/store.jsp";
    }
}
