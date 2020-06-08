package com.szh.service.impl;

import com.szh.dao.WorkAccountDao;
import com.szh.dao.WorkTypeDao;
import com.szh.domain.Total;
import com.szh.domain.WorkAccount;
import com.szh.domain.WorkType;
import com.szh.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("workService")
public class WorkServiceImpl implements WorkService {

    @Autowired
    private WorkTypeDao workTypeDao;

    @Autowired
    private WorkAccountDao workAccountDao;

    @Override
    public List<WorkType> findAllWorkType() {
        return workTypeDao.findAllWorkType();
    }

    @Override
    public List<WorkAccount> findAllWorkAccount() {
        return workAccountDao.findContainTN();
    }

    @Override
    public List<WorkAccount> findAllWorkAccountById(Integer userId) {
        return workAccountDao.findContainTNById(userId);
    }

    @Override
    public void addWork(WorkAccount workAccount) {
        workAccountDao.addWork(workAccount);
    }

    @Override
    public void updateWork(WorkAccount workAccount) {
        workAccountDao.updateWork(workAccount);
    }

    @Override
    public void delWork(Integer workId) {
        workAccountDao.delWork(workId);
    }

    @Override
    public WorkAccount findWorkByLId(Integer workId) {
        WorkAccount workAccount=workAccountDao.findById(workId);
        return workAccount;
    }

    @Override
    public List<Total> total(int id) {
        List<Total> total = workAccountDao.total(id);
        return total;
    }

    @Override
    public List<Total> totalWeeK(int id) {
        List<Total> totals = workAccountDao.totalForWeek(id);
        return totals;
    }

    @Override
    public List<Total> totalMonth(int id) {
        List<Total> totals = workAccountDao.totalForMonth(id);
        return totals;
    }

    @Override
    public Total totalAll(Integer id) {
        Total total = workAccountDao.totalAll(id);
        return total;
    }

    @Override
    public Total totalAllWeek(Integer id) {
        Total total = workAccountDao.totalAllWeek(id);
        return total;
    }

    @Override
    public Total totalAllMonth(Integer id) {
        Total total = workAccountDao.totalAllMonth(id);
        return total;
    }

    @Override
    public List<WorkAccount> fuzzySelect(WorkAccount workAccount) {
        return workAccountDao.fuzzySelect(workAccount);
    }
}
