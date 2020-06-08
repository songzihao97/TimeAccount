package com.szh.service.impl;

import com.szh.dao.AmuAccountDao;
import com.szh.dao.AmuTypeDao;
import com.szh.domain.AmuAccount;
import com.szh.domain.AmuType;
import com.szh.domain.Total;
import com.szh.service.AmuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("amuService")
public class AmuServiceImpl implements AmuService {

    @Autowired
    private AmuTypeDao amuTypeDao;

    @Autowired
    private AmuAccountDao amuAccountDao;

    @Override
    public List<AmuType> findAllAmuType() {
        return amuTypeDao.findAllAmuType();
    }

    @Override
    public List<AmuAccount> findAllAmuAccount() {
        return amuAccountDao.findContainTN();
    }

    @Override
    public List<AmuAccount> findAllAmuAccountById(Integer userId) {
        return amuAccountDao.findContainTNById(userId);
    }

    @Override
    public void addAmu(AmuAccount amuAccount) {
        amuAccountDao.addAmu(amuAccount);
    }

    @Override
    public void updateAmu(AmuAccount amuAccount) {
        amuAccountDao.updateAmu(amuAccount);
    }

    @Override
    public void delAmu(Integer amuId) {
        amuAccountDao.delAmu(amuId);
    }

    @Override
    public AmuAccount findAmuByLId(Integer amuId) {
        AmuAccount amuAccount=amuAccountDao.findById(amuId);
        return amuAccount;
    }

    @Override
    public List<Total> total(int id) {
        List<Total> total = amuAccountDao.total(id);
        return total;
    }

    @Override
    public List<Total> totalWeeK(int id) {
        List<Total> totals = amuAccountDao.totalForWeek(id);
        return totals;
    }

    @Override
    public List<Total> totalMonth(int id) {
        List<Total> totals = amuAccountDao.totalForMonth(id);
        return totals;
    }

    @Override
    public Total totalAll(Integer id) {
        Total total = amuAccountDao.totalAll(id);
        return total;
    }

    @Override
    public Total totalAllWeek(Integer id) {
        Total total = amuAccountDao.totalAllWeek(id);
        return total;
    }

    @Override
    public Total totalAllMonth(Integer id) {
        Total total = amuAccountDao.totalAllMonth(id);
        return total;
    }

    @Override
    public List<AmuAccount> fuzzySelect(AmuAccount amuAccount) {
        return amuAccountDao.fuzzySelect(amuAccount);
    }
}
