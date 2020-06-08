package com.szh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.szh.domain.*;
import com.szh.service.LeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/lea")
public class leaController {

    @Autowired
    private LeaService leaService;

    /**
     *返回所有学习日程类
     */
    @RequestMapping("/getAll")
    @ResponseBody
    public Msg getAllLeaType(Model model){
        List<LearnType> leaTypes = leaService.findAllLearnType();
        return Msg.success().add("leaTypes",leaTypes);
    }

    //根据用户id分页查询学习日程
    @RequestMapping("/leaList")
    public String getLeaList(@RequestParam(value = "pn",defaultValue = "1") Integer pn,LeaAccount account, Model model, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        account.setUid(user.getUserId());
        model.addAttribute("account",account);
        //调用分页插件
        PageHelper.startPage(pn,10);
        List<LeaAccount> leaAccounts = leaService.fuzzySelect(account);
        //List<LeaAccount> leaAccounts = leaService.findAllLeaAccountById(user.getUserId());
        //用PageInfo对结果进行包装,包括数据，以及每次显示几页
        PageInfo page = new PageInfo(leaAccounts,5);
        model.addAttribute("LeaPageInfo",page);
        return "LeaList";
    }

    //添加学习日程
    @RequestMapping("/addLea")
    public String addLea(LeaAccount leaAccount,Model model,HttpSession session){
        leaService.addLea(leaAccount);
        User user = (User)session.getAttribute("loginUser");
        Integer userId = user.getUserId();
        return "redirect:/lea/leaList?pn=1";
    }

    //根据id查询日程信息
    @RequestMapping("/getLeaById")
    @ResponseBody
    public Msg getLeaById(Integer id){
        LeaAccount leaaccount = leaService.findLeaByLId(id);
        return Msg.success().add("leaAccount",leaaccount);
    }

    //根据id更新
    @RequestMapping("/updateLea")
    public String updateLea(LeaAccount leaAccount,Integer pn){
        leaService.updateLea(leaAccount);
        return "redirect:/lea/leaList?pn="+pn;
    }

    //根据id删除
    @RequestMapping("/delLea")
    public String delLea(Integer id,Integer pn){
        leaService.delLea(id);
        return "redirect:/lea/leaList?pn="+pn;
    }

    //按类别统计数据
    @RequestMapping("/total")
    public String total(HttpSession session,Model model){
        User user = (User)session.getAttribute("loginUser");
        Integer id = user.getUserId();
        List<Total> totalAll = leaService.total(id);
        model.addAttribute("totalAll",totalAll);
        List<Total> totalWeeK = leaService.totalWeeK(id);
        model.addAttribute("totalWeek",totalWeeK);
        List<Total> totalMonth = leaService.totalMonth(id);
        model.addAttribute("totalMonth",totalMonth);
        model.addAttribute("type","学习");
        return "totalChart";
    }

}
