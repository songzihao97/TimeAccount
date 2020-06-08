package com.szh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.szh.domain.*;
import com.szh.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    private WorkService workService;

    /**
     *返回所有学习日程类
     */
    @RequestMapping("/getAll")
    @ResponseBody
    public Msg getAllWorkType(Model model){
        List<WorkType> workTypes = workService.findAllWorkType();
        return Msg.success().add("workTypes",workTypes);
    }

    //根据用户id分页查询学习日程
    @RequestMapping("/workList")
    public String getWorkList(@RequestParam(value = "pn",defaultValue = "1") Integer pn,WorkAccount account, Model model, HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        account.setUid(user.getUserId());
        model.addAttribute("account",account);
        //调用分页插件
        PageHelper.startPage(pn,10);
        List<WorkAccount> workAccounts = workService.fuzzySelect(account);
        //List<WorkAccount> workAccounts = workService.findAllWorkAccountById(user.getUserId());
        //用PageInfo对结果进行包装,包括数据，以及每次显示几页
        PageInfo page = new PageInfo(workAccounts,5);
        model.addAttribute("WorkPageInfo",page);
        return "WorkList";
    }

    //添加学习日程
    @RequestMapping("/addWork")
    public String addWork(WorkAccount workAccount,Model model,HttpSession session){
        workService.addWork(workAccount);
        User user = (User)session.getAttribute("loginUser");
        Integer userId = user.getUserId();
        return "redirect:/work/workList?pn=1";
    }

    //根据id查询日程信息
    @RequestMapping("/getWorkById")
    @ResponseBody
    public Msg getWorkById(Integer id){
        WorkAccount workaccount = workService.findWorkByLId(id);
        return Msg.success().add("workAccount",workaccount);
    }

    //根据id更新
    @RequestMapping("/updateWork")
    public String updateWork(WorkAccount workAccount,Integer pn){
        workService.updateWork(workAccount);
        return "redirect:/work/workList?pn="+pn;
    }

    //根据id删除
    @RequestMapping("/delWork")
    public String delWork(Integer id,Integer pn){
        workService.delWork(id);
        return "redirect:/work/workList?pn="+pn;
    }

    @RequestMapping("/total")
    public String total(HttpSession session,Model model){
        User user = (User)session.getAttribute("loginUser");
        Integer id = user.getUserId();
        List<Total> totalAll = workService.total(id);
        model.addAttribute("totalAll",totalAll);
        List<Total> totalWeeK = workService.totalWeeK(id);
        model.addAttribute("totalWeek",totalWeeK);
        List<Total> totalMonth = workService.totalMonth(id);
        model.addAttribute("totalMonth",totalMonth);
        model.addAttribute("type","工作");
        return "totalChart";
    }
}


