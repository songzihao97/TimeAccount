package com.szh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.szh.domain.*;
import com.szh.service.AmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/amu")
public class AmuController {

    @Autowired
    private AmuService amuService;

    /**
     *返回所有日程类
     */
    @RequestMapping("/getAll")
    @ResponseBody
    public Msg getAllAmuType(Model model){
        List<AmuType> amuTypes = amuService.findAllAmuType();
        return Msg.success().add("amuTypes",amuTypes);
    }

    //根据用户id分页查询学习日程
    @RequestMapping("/amuList")
    public String getAmuList(@RequestParam(value = "pn",defaultValue = "1") Integer pn,AmuAccount account, Model model, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        account.setUid(user.getUserId());
        model.addAttribute("account",account);
        //调用分页插件
        PageHelper.startPage(pn,10);
        List<AmuAccount> amuAccounts = amuService.fuzzySelect(account);
        //List<AmuAccount> amuAccounts = amuService.findAllAmuAccountById(user.getUserId());
        //用PageInfo对结果进行包装,包括数据，以及每次显示几页
        PageInfo page = new PageInfo(amuAccounts,5);
        model.addAttribute("AmuPageInfo",page);
        return "AmuList";
    }

    //添加学习日程
    @RequestMapping("/addAmu")
    public String addAmu(AmuAccount amuAccount,Model model,HttpSession session){
        amuService.addAmu(amuAccount);
        User user = (User)session.getAttribute("loginUser");
        Integer userId = user.getUserId();
        return "redirect:/amu/amuList?pn=1";
    }

    //根据id查询日程信息
    @RequestMapping("/getAmuById")
    @ResponseBody
    public Msg getAmuById(Integer id){
        AmuAccount amuaccount = amuService.findAmuByLId(id);
        return Msg.success().add("amuAccount",amuaccount);
    }

    //根据id更新
    @RequestMapping("/updateAmu")
    public String updateAmu(AmuAccount amuAccount,Integer pn){
        amuService.updateAmu(amuAccount);
        return "redirect:/amu/amuList?pn="+pn;
    }

    //根据id删除
    @RequestMapping("/delAmu")
    public String delAmu(Integer id,Integer pn){
        amuService.delAmu(id);
        return "redirect:/amu/amuList?pn="+pn;
    }

    //按类别统计数据
    @RequestMapping("/total")
    public String total(HttpSession session,Model model){
        User user = (User)session.getAttribute("loginUser");
        Integer id = user.getUserId();
        List<Total> totalAll = amuService.total(id);
        model.addAttribute("totalAll",totalAll);
        List<Total> totalWeeK = amuService.totalWeeK(id);
        model.addAttribute("totalWeek",totalWeeK);
        List<Total> totalMonth = amuService.totalMonth(id);
        model.addAttribute("totalMonth",totalMonth);
        model.addAttribute("type","娱乐");
        return "totalChart";
    }
}
