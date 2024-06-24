package com.controller;

import com.mapper.CommodityMapper;
import com.mapper.OrderMapper;
import com.mapper.UserMapper;
import com.pojo.Commodity;
import com.pojo.Favorite;
import com.pojo.OrderDealing;
import com.pojo.User;
import com.service.CommodityService;
import com.service.OrderService;
import com.service.UserService;
import com.utils.MailUtils;
import com.utils.UserUtil;
import com.utils.UuidUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {

    //注入所需对象
    @Autowired
    private UserService userService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CommodityMapper commodityMapper;
    @Autowired
    private CommodityService commodityService;

    @Autowired
    private OrderMapper orderMapper;
    /**
     * 去注册页面
     * @param session 销毁session
     * @return 注册页面
     */
    @RequestMapping("/toRegister")
    public String toRegister(HttpSession session){
        //销毁session 防止Msg显示错误
        session.invalidate();
        return"redirect:/register.jsp";
    }
    @PostMapping("/processRecharge")
    public String processRecharge(@RequestParam("amount") double amount,
                                  HttpSession session,
                                  Model model) {
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","用户获取失败");
            return"redirect:/login.jsp";
        }
        if (user != null && amount > 0) {
            userService.updateMoney(amount,user.getId());
            session.setAttribute("user", user); // 更新 session 中的用户信息
            model.addAttribute("amount",amount);
            model.addAttribute("addRes", "充值成功！");
        } else {
            model.addAttribute("addRes", "充值失败，请重试！");
        }

        return "Top_up_success";
    }

    @PostMapping("adviceSubmit")
    public String processRecharge() {
        return "submit_success";
    }
    @RequestMapping("/doRegister")
    public String doRegister(User user,HttpSession session){
        String uuid = UuidUtil.getUuid();
        user.setCode(uuid);
        userMapper.addUser(user);
        String email = user.getEmail();
        System.out.println(uuid);
        String title="激活账号";
        String content="您正在进行Electro商城的注册,下一步:<a href='http://localhost:8086/user/setStatus?code="+uuid+"'>点我激活</a>";
        MailUtils.sendMail(email,content,title);
        session.setAttribute("msg","账户已经注册,下一步请前往填写邮箱激活账号");
        return"redirect:/login.jsp";
    }

    @RequestMapping("/setStatus")
    public String setStatus(String code,HttpSession session){
        Integer uid = userMapper.selectUidByCode(code);
        Integer res = userMapper.setStatus(uid);
        if (res!=0){
            session.setAttribute("msg","激活成功,您可随时登陆");
        }else {
            session.setAttribute("msg","激活失败");

        }
        System.out.println("开始验证真人用户code = " + code);
        return "redirect:/login.jsp";
    }

    /**
     * 去登陆页面
     * @param session 销毁session
     * @return 登陆页面
     */
    @RequestMapping("/toLogin")
    public String toLogin(HttpSession session){
        //销毁session 防止Msg显示错误
        session.invalidate();
        return"redirect:/login.jsp";
    }

    /**
     * 登陆
     * @param email 用户邮箱
     * @param password 用户密码
     * @param model 使用model传数据
     * @param session 使用session保存用户信息
     * @return 商城主页
     */
    @RequestMapping("/login")
    public String login(String email,String password, Model model, HttpSession session,HttpServletRequest request){

        System.out.println("login方法进入了");
        if (email.isEmpty()||password.isEmpty()){
            //说明没查到,跳转登陆页面,携带错误信息,用户名或密码错误
            session.setAttribute("msg","邮箱或密码为空");
            return "redirect:/login.jsp";
        }
        User user = userService.login(email,password);
        System.out.println("login的user= "+user);
        if (user == null){
            //说明没查到,跳转登陆页面,携带错误信息,用户名或密码错误
            session.setAttribute("msg","邮箱或密码错误");
            return "redirect:/login.jsp";//redirect:/pages_login.jsp
        }
        //不为空
        // 1.判断用户身份 和 状态
        if (user.getStatus()==0){
            session.setAttribute("msg","您的账户未激活,请前往邮箱确认或联系平台解封");
            return "redirect:/login.jsp";
        }
        // 2 登陆成功：1.将用户信息存入session
        // 3.跳转到信息列表展示页面
        //修改最后一次登陆时间
        System.out.println("user = " + user);
        session.setAttribute("user",user);
        //判断身份
        if (user.getRole()==0){//先判断是不是用户
            return "redirect:/initShopping";
        }else if (user.getRole()==5){//再判断是不是商家
            return "redirect:"+request.getContextPath()+"/admin/toAdminIndex";
        }
        return "redirect:/login.jsp";
    }

    @RequestMapping("/checkUser")
    public String checkUser(HttpSession session,Model model){
        //4.需要,判断session中有无用户数据
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请登陆后浏览,获得更多权限");
            return"redirect:/login.jsp";
        }
        //根据uid去数据库把address查出来
        model.addAttribute("addressList",userMapper.findMyAddress(user.getId()));
        return"user_info";
    }

    @RequestMapping("/addMyFavorite")
    public String addMyFavorite(HttpSession session, Integer cid, HttpServletRequest request, Model model){
        //先判断用户是否存在
        //4.需要,判断session中有无用户数据
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请先登陆,再查看您心仪的商品");
            return"redirect:/login.jsp";
        }

        Integer uid = user.getId();
        Integer i = userService.addMyFavorite(uid, cid);
        if (i==0){
            session.setAttribute("addRes","您已收藏该商品,无须重复添加");
        }else {
            session.setAttribute("addRes","收藏成功！");
        }
        return "redirect:"+request.getContextPath()+"/initShopping";
    }

    @RequestMapping("/toMyFavoriteList")
    public String toMyFavoriteList(HttpSession session,Model model){
        //先判断用户是否存在
        User user = (User) session.getAttribute("user");

        if (user==null){
            session.setAttribute("msg","请先登陆,再查看您心仪的商品");
            return "redirect:/login.jsp";
        }

        Integer id = user.getId();
        LinkedList<Favorite> favoriteList = userService.selectFavoriteByUid(id);
        System.out.println("favoriteList = " + favoriteList);
        model.addAttribute("favoriteList",favoriteList);
        return "my_like_list";
    }

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "redirect:/index.jsp";
    }

    /**
     * 根据fid删除收藏的商品
     * @param id 收藏表的字段
     * @return 收藏列表
     */
    @RequestMapping("/delMyFavoriteByFid")
    public String delMyFavoriteByFidIndex(Integer id){
        userService.delMyFavoriteByFid(id);

        return "redirect:/user/toMyFavoriteList";
    }

    /**
     * 根据cid添加到user的购物车
     * @param cid 商品Id
     * @return 主页
     */
    @RequestMapping("/addMyCart")
    public String addMyCart(Integer cid,Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请登陆后浏览,获得更多权限");
            return"redirect:/login.jsp";
        }
        Integer res = userService.addMyCart(user.getId(),cid);
        if (res!=0){
           session.setAttribute("addRes","添加购物车成功!");
        }else {
            session.setAttribute("addRes","添加失败,请稍后再试");
        }
        return "redirect:/initShopping";
    }
    @RequestMapping("/delMyShoppingCartByCid")
    public String delMyShoppingCartByCid(Integer cid,HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer res = userService.delMyShoppingCartByCid(user.getId(),cid);
        if (res!=0){
            session.setAttribute("addRes","从购物车删除了一类商品!");
        }else {
            session.setAttribute("addRes","删除失败,请稍后再试");
        }

        return "redirect:/initShopping";
    }

    @RequestMapping("/clearMyShoppingCartByUid")
    public String clearMyShoppingCartByUid(HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user==null){
            session.setAttribute("msg","请登陆后浏览,获得更多权限");
            return"redirect:/login.jsp";
        }
        Integer res = userService.clearMyShoppingCartByUid(user.getId());
        if (res!=0){
            session.setAttribute("addRes","您已清空购物车");
            user.setShoppingCids("cidList=0");
        }else {
            session.setAttribute("addRes","购物车空空如也");
        }

        return "redirect:/initShopping";
    }
    @RequestMapping("/toWithAdmin")
    public String toWithAdmin(HttpSession session){
        User user = (User)session.getAttribute("user");

        if (user == null)
        {
            session.setAttribute("msg","您还未登录，请先登录后再联系我们");
            return "redirect:/login.jsp";
        }

        return "redirect:/blank.jsp";
    }

    @RequestMapping("/findOrderByOid")
    public String findOrderByOid(Integer oid,Model model){
        List<OrderDealing> orderByOid = orderService.findOrderByOid(oid);
        model.addAttribute("orderByOid",orderByOid);
        return "orderDealing";
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(Integer oid,Integer cid,Integer status,Model model){
        //用户已经确认修改状态
        System.out.println("用户开始修改订单状态");
        System.out.println("oid = " + oid);
        System.out.println("cid = " + cid);
        System.out.println("status = " + status);
        //判断参数status
        if (status==6){
            //用户申请撤销退货
            //先去判断该订单的快递单是否填写
            List<String>  tracking = orderMapper.selectTrackingIsNull(cid,oid);
            Boolean stock=true;
            for (String track : tracking) {
                if (track==null||track.length()==0) stock=false;
            }
            if (stock){
                //如果填写就设置为5
                status=5;
                orderMapper.updateOrderStatus(cid,oid,status);
                return "redirect:/user/findOrderByOid?oid="+oid;

            }else {
                //如果未填写就将status设为0
                status=0;
                orderMapper.updateOrderStatus(cid,oid,status);
                return "redirect:/user/findOrderByOid?oid="+oid;
            }
        }
        orderMapper.updateOrderStatus(cid,oid,status);

        if (status==9||status==10){
            //那么就去判断该订单的其他详情的status是否都为9或10
            boolean flag=true;
            List<Integer> resList=orderMapper.selectStatusByOid(oid);
            for (Integer res : resList) {
                if (res!=9&&res!=10){
                    //说明订单仍然存在未完成 不给予修改完成状态
                    flag=false;
                    break;
                }
            }
            //看是否通过效验
            if (flag){
                //修改订单最终状态
                orderMapper.updateOrderFinalStatus(oid);
            }
        }

        return "redirect:/user/findOrderByOid?oid="+oid;
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        //退出登陆
        session.invalidate();
        return "redirect:/initShopping";
    }

    @RequestMapping("toPagesLogin")
    public String toPagesLogin(HttpSession session){
        session.invalidate();
        return "redirect:/initShopping";
    }

    @RequestMapping("addMyMoney")
    public String addMyMoney(HttpSession session)
    {
        User user = (User)session.getAttribute("user");
        if (user == null)
        {
            session.setAttribute("msg","您还未登录,请登录后再进行充值");
            return "redirect:/login.jsp";
        }
        return"redirect:/addmoney.jsp";
    }
}
