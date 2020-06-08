package com.szh.service.impl;

import com.szh.dao.LeaAccountDao;
import com.szh.dao.LearnTypeDao;
import com.szh.domain.LeaAccount;
import com.szh.domain.LearnType;
import com.szh.domain.Total;
import com.szh.service.LeaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("leaService")
public class LeaServiceImpl implements LeaService {

    @Autowired
    private LearnTypeDao learnTypeDao;

    @Autowired
    private LeaAccountDao leaAccountDao;

    @Override
    public List<LearnType> findAllLearnType() {
        return learnTypeDao.findAllLearnType();
    }

    @Override
    public List<LeaAccount> findAllLeaAccount() {
        return leaAccountDao.findContainTN();
    }

    @Override
    public List<LeaAccount> findAllLeaAccountById(Integer userId) {
        return leaAccountDao.findContainTNById(userId);
    }

    @Override
    public void addLea(LeaAccount leaAccount) {
        leaAccountDao.addLea(leaAccount);
    }

    @Override
    public void updateLea(LeaAccount leaAccount) {
        leaAccountDao.updateLea(leaAccount);
    }

    @Override
    public void delLea(Integer leaId) {
        leaAccountDao.delLea(leaId);
    }

    @Override
    public LeaAccount findLeaByLId(Integer leaId) {
        LeaAccount leaAccount=leaAccountDao.findById(leaId);
        return leaAccount;
    }

    @Override
    public List<Total> total(int id) {
        List<Total> total = leaAccountDao.total(id);
        return total;
    }

    @Override
    public List<Total> totalWeeK(int id) {
        List<Total> totals = leaAccountDao.totalForWeek(id);
        return totals;
    }

    @Override
    public List<Total> totalMonth(int id) {
        List<Total> totals = leaAccountDao.totalForMonth(id);
        return totals;
    }

    @Override
    public Total totalAll(Integer id) {
        Total total = leaAccountDao.totalAll(id);
        return total;
    }

    @Override
    public Total totalAllWeek(Integer id) {
        Total total = leaAccountDao.totalAllWeek(id);
        return total;
    }

    @Override
    public Total totalAllMonth(Integer id) {
        Total total = leaAccountDao.totalAllMonth(id);
        return total;
    }

    @Override
    public List<LeaAccount> fuzzySelect(LeaAccount leaAccount) {
        return leaAccountDao.fuzzySelect(leaAccount);
    }
}
