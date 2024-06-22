package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mapper.OrderMapper;
import com.mapper.UserMapper;
import com.pojo.*;
import com.service.CommodityService;
import com.service.DealingService;
import com.service.OrderService;
import com.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
@RequestMapping( "admin")
public class AdminController {
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private DealingService dealingService;

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private OrderMapper orderMapper;
    @RequestMapping(value = "/toAdminIndex")
    public String addCommodity(Model model, Integer pageNum, Integer pageSize, Integer categoryId, String cname, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //校验参数,因为有可能传过来的参数可能是为null
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 5;
        }
        System.out.println("categoryId = " + categoryId);
        Map<Integer, String> categoryMap = commodityService.findAllParentCategory();//查询种类
        //保存条件,用于展示在页面上,进行回显
        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("cname", cname);

        System.out.println("cname = " + cname);
        if (categoryId==null) categoryId = null;
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Commodity> condition = commodityService.viewCommoditiesByPage(categoryId, cname);//先进行模糊查询 把查询出来的结果交给PageInfo进行分页处理
        PageInfo<Commodity> pageInfo = new PageInfo<>(condition);
        System.out.println("管理商品信息");
        for (Commodity commodity : pageInfo.getList()) {
            System.out.println("commodity = " + commodity);
        }
        model.addAttribute("categoryMap", categoryMap);
        model.addAttribute("pageInfo", pageInfo);
        return "admin_index";
    }

    @RequestMapping("/findCommodityByCid")
    public String findCommodityByCid(Integer cid, Model model) {
        //找到商品信息返回给前端
        Commodity commodity = commodityService.viewCommodityByCid(cid);
        model.addAttribute("commodity", commodity);
        return "admin_updateCommodity";
    }

    @RequestMapping("/toAddPageForCommodity")
    public String toAddPageForCommodity(Model model) {

        //保存条件,用于展示在页面上,进行回显
        Map<Integer, String> categoryMap = commodityService.findAllParentCategory();//查询种类
        model.addAttribute("categoryMap", categoryMap);
        return "admin_addCommodity";
    }


    @RequestMapping("/addCommodity")
    public String toAddPageForCommodity(
            String name, Integer categoryId,
            Double price, Integer inventory,
            Double discount, String description,
            String details,
            MultipartFile photo, HttpSession session,
            Model model, HttpServletRequest request) throws IOException {

        String finalPath = uploadTest(photo, session);
        Commodity commodity = new Commodity();
        //将最终路径赋值给news

        commodity.setName(name);
        commodity.setCategoryId(categoryId);
        commodity.setPrice(price);
        commodity.setInventory(inventory);
        commodity.setDiscount(discount);
        commodity.setDescription(description);
        commodity.setDetails(details);
        commodity.setPhotoUrl(finalPath);
        System.out.println(commodity);
        Integer flag = commodityService.addCommodity(commodity);
        if (flag == 1) {
            model.addAttribute("flag", "添加成功");
        } else if (flag == 0) {
            model.addAttribute("flag", "商品名称未填写");
        } else if (flag == 6) {
            model.addAttribute("flag", "商品描述过短（至少三十字）");
        } else if (flag == 3) {
            model.addAttribute("flag", "商品价格未填写");
        }
        return "admin_addCommodity";
    }

    public String uploadTest(MultipartFile photo, HttpSession session) throws IOException {
        //获取上传的文件的文件名
        String filename = photo.getOriginalFilename();
        System.out.println("filename = " + filename);
        //获取上传文件的后缀名
        //substring(beginIndex,endIndex) 截取参数范围的字符 截头不截尾 只有一个参数就从beginIndex开始截取结束
        //lastIndexOf(str)找出这个str出现的最后的一次索引
        String hzName = filename.substring(filename.lastIndexOf("."));
        //获得uuid
        String uuid = UUID.randomUUID().toString();
        //拼接一个新的文件名
        filename = uuid + hzName;
        //------------------------以上是防止重名-------------------------------
        //获取ServletContext对象
        ServletContext servletContext = session.getServletContext();
        //获取当前工程下photo目录的真实路径
        String imgPath = servletContext.getRealPath("img");
        //创建imgPath所对应的file对象
        File file = new File(imgPath);
        //判断file所对应的目录是否存在
        if (!file.exists()) {
            file.mkdirs();
        }
        //拼接最终上传路径
        String finalPath = imgPath + File.separator + filename;
        //上传文件
        photo.transferTo(new File(finalPath));
        finalPath = "/img/" + filename;
        return finalPath;
    }

    /**
     * 删除选中
     *
     * @param nid
     * @return
     */
    @RequestMapping("/deleteCounts")
    public String deleteCounts(String[] nid) {

        System.out.println(nid);
        if (nid == null || nid.length == 0) return "redirect:/admin/toAdminIndex"; //防止未选中
        for (String id : nid) {
            commodityService.deleteById(Integer.parseInt(id));
        }
        return "redirect:/admin/toAdminIndex";
    }

    @RequestMapping("/changeStateById")
    public String changeStateById(Commodity commodity) {
        System.out.println("controller修改新闻状态方法执行了");
        commodityService.changeStateById(commodity);
        return "redirect:/admin/toAdminIndex";
    }


    @RequestMapping("/updateCommodity")
    public String updateCommodity(Commodity commodity, Model model) {
        Integer i = commodityService.updateCommodityByCid(commodity);
        if (i != 0) {
            model.addAttribute("flag", "修改成功！");
        } else {
            model.addAttribute("flag", "修改失败！");
        }
        return "redirect:/admin/findCommodityByCid?cid=" + commodity.getId();
    }

    @RequestMapping("/toAddPageForCategory")
    public String toAddPageForCategory(Model model) {
        Map<Integer, String> categoryMap = commodityService.findAllParentCategory();//查询种类
        model.addAttribute("categoryMap", categoryMap);
        return "admin_addCategory";
    }

    @RequestMapping("/addCategory")
    public String addCategory(Model model, String name, Integer parentId) {
        Integer i = commodityService.addCategory(name,parentId);
        Map<Integer, String> categoryMap = commodityService.findAllParentCategory();//查询种类
        model.addAttribute("categoryMap", categoryMap);
        if (i != 0) {
            model.addAttribute("flag", "添加成功！");
        } else {
            model.addAttribute("flag", "添加失败！");
        }
        return "admin_addCategory";
    }

    @RequestMapping("/toAdminOrderList")
    public String toAdminOrderList(Model model,Integer state, Integer pageNum, Integer pageSize) {
        //校验参数,因为有可能传过来的参数可能是为null
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 5;
        }

        List<OrderGoods> orderList = orderService.viewOrderByState(state);
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        PageInfo<OrderGoods> pageInfo = new PageInfo<>(orderList);

        model.addAttribute("pageInfo", pageInfo);
        return "admin_orderList";
    }

    @RequestMapping("/findOrderByOid")
    public String findOrderByOid(Integer oid, Model model,HttpSession session) {

        List<OrderDealing> dealingList = orderService.findOrderByOid(oid);
        model.addAttribute("orderUUid",dealingList.get(0).getOrderUUid());
        model.addAttribute("createTime",dealingList.get(0).getCreateTime());

        model.addAttribute("dealingList",dealingList);
        return "admin_updateOrder";
    }

    @RequestMapping("/updateOrder")
    public String toUpdateOrder(String[] tracking, Integer oid, Integer[] cid) {
        //将传过来的数据封装成map
        for (String s : tracking) {
            System.out.println("s = " + s);
        }
        HashMap<Integer,String> map = new HashMap<>();
        for (int i = 0; i < cid.length; i++) {
            map.put(cid[i],tracking[i]);
        }
        //将map里面的数据传入service里面对详情快递单修改参数 并修改详情订单状态
        Integer integer = orderService.updateOrderStatus(map, oid);
        System.out.println("integer = " + integer);
        return "redirect:/admin/findOrderByOid?oid="+oid;
    }

    @RequestMapping("/ok")
    public String ok( Integer oid, Integer cid,Integer status) {
        //没加锁 没时间了
        //改状态为10 然后把钱退给用户
        //先通过oid和cid把具体商单的总价算出来
        Double price=0.0;
        List<Double> priceOrder = orderMapper.findOrderPriceByOid(cid,oid);
        for (Double aDouble : priceOrder) {
            price+=aDouble;
        }

        Integer uid = orderMapper.findUidByOid(oid);
        Integer res = userMapper.updateMoney(price,uid);
        //将库存补回去
        /*
        * ..........
        * */
        if (res==1){
            //修改状态
            status=10;

            orderMapper.updateOrderStatus(cid,oid,status);
            //修改完成后去判断该订单是否全部为9 10
            boolean flag=true;
            List<Integer> resList=orderMapper.selectStatusByOid(oid);
            for (Integer re : resList) {
                if (re!=9&&re!=10){
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
        return "redirect:/admin/findOrderByOid?oid="+oid;
    }

    @RequestMapping("/no")
    public String no( Integer oid, Integer cid,Integer status) {
        //不同意退款
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
                return "redirect:/admin/findOrderByOid?oid="+oid;

            }else {
                //如果未填写就将status设为0
                status=0;
                orderMapper.updateOrderStatus(cid,oid,status);
                return "redirect:/admin/findOrderByOid?oid="+oid;
            }
        }
        orderMapper.updateOrderStatus(cid,oid,status);
        return "redirect:/admin/findOrderByOid?oid="+oid;
    }


    @RequestMapping("/toManageUsers")
    public String toManageUsers(Model model,Integer state, Integer pageNum, Integer pageSize) {
        //校验参数,因为有可能传过来的参数可能是为null
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 5;
        }

        List<User> userList = userMapper.viewUsers();
        //分页查询
        PageHelper.startPage(pageNum, pageSize);
        PageInfo<User> pageInfo = new PageInfo<>(userList);

        model.addAttribute("pageInfo", pageInfo);
        return "admin_userList";
    }

    @RequestMapping("/updateUser")
    public String updateUser(Integer uid,Integer status){
        if (status==1){
            status=0;
        }
        userMapper.updateStatus(uid,status);
        return "redirect:/admin/toManageUsers";
    }


}

