package com.szh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.szh.domain.Msg;
import com.szh.domain.Total;
import com.szh.domain.User;
import com.szh.service.AmuService;
import com.szh.service.LeaService;
import com.szh.service.UserService;
import com.szh.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
@SessionAttributes(value = {"loginUser"},types = {User.class})
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LeaService leaService;

    @Autowired
    private WorkService workService;

    @Autowired
    private AmuService amuService;

    //用户登录
    @RequestMapping("/login")
    public String login(String username, String password, Model model) {
        //调用service方法查询数据库
        User loginUser = userService.loginService(username, password);
        if (loginUser!=null){
            model.addAttribute("loginUser",loginUser);
            return "redirect:/calendar.jsp";
        }else {
            model.addAttribute("msg","用户名或密码错误");
            return "forward:/index.jsp";
        }
    }

    //管理员登录
    @RequestMapping("/adminLogin")
    public String adminLogin(String username, String password, Model model) {
        //调用service方法查询数据库
        User loginUser = userService.loginService(username, password);
        if (loginUser!=null&&loginUser.getUserId()==1){
            model.addAttribute("loginUser",loginUser);
            return "redirect:/user/userList";
        }else if(loginUser!=null&&loginUser.getUserId()!=1){
            model.addAttribute("msg","您不是管理员");
            return "forward:/adminLogin.jsp";
        }else {
            model.addAttribute("msg","用户名或密码错误");
            return "forward:/adminLogin.jsp";
        }
    }

    //用户注册
    @RequestMapping("/register")
    public String register(User user,Model model){
        //调用service方法保存用户信息
        userService.registerService(user);
        login(user.getUsername(),user.getPassword(),model);
        return "redirect:/UserInfo.jsp";
    }

    //检测用户名是否重复
    @RequestMapping("/checkUsername")
    @ResponseBody
    public Msg checkUsername(String username){

        boolean flag=true;

        List<User> users = userService.findAllUser();
        for (User user : users) {
            if (username.equals(user.getUsername())){
                flag=false;
            }
        }
        if (flag){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    //用户信息修改
    @RequestMapping("/updateUser")
    public String updateUser(User loginUser, Model model){
        userService.updateUser(loginUser);
        System.out.println(loginUser);
        User user=userService.findUserById(loginUser.getUserId());
        System.out.println(user);
        model.addAttribute("loginUser",user);
        return "forward:/UserInfo.jsp";
    }

    //分页查询用户信息
    @RequestMapping("/userList")
    public String getUserList(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model){
        //调用分页插件
        PageHelper.startPage(pn,10);
        List<User> users = userService.findAllUser();
        //用PageInfo对结果进行包装,包括数据，以及每次显示几页
        PageInfo page = new PageInfo(users,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }

    //根据id删除用户信息
    @RequestMapping("/delUser")
    public String delUser(Integer pn,Integer userId){
        userService.delete(userId);
        return "redirect:/user/userList?pn="+pn;
    }

    //根据id删除多个用户信息
    @RequestMapping("/delSelected")
    public String delSelected(Integer pn,Integer[] userId){
        //userService.delete(userId);
        for (Integer uid : userId) {
           userService.delete(uid);
        }
        return "redirect:/user/userList?pn="+pn;
    }

    //查询用户三种分类总记录并显示
    @RequestMapping("/total")
    public String total(HttpSession session, Model model){
        User user = (User)session.getAttribute("loginUser");
        Integer id = user.getUserId();
        List<Total> totalAll=new ArrayList<>();
        totalAll.add( leaService.totalAll(id));
        totalAll.add( workService.totalAll(id));
        totalAll.add( amuService.totalAll(id));
        List<Total> totalWeek=new ArrayList<>();
        totalWeek.add( leaService.totalAllWeek(id));
        totalWeek.add( workService.totalAllWeek(id));
        totalWeek.add( amuService.totalAllWeek(id));
        List<Total> totalMonth=new ArrayList<>();
        totalMonth.add( leaService.totalAllMonth(id));
        totalMonth.add( workService.totalAllMonth(id));
        totalMonth.add( amuService.totalAllMonth(id));
        model.addAttribute("totalAll",totalAll);
        model.addAttribute("totalWeek",totalWeek);
        model.addAttribute("totalMonth",totalMonth);
        model.addAttribute("type","所有");
        return "totalChart";
    }

}
