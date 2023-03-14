package com.case_study.casemd3.service.merchant;

import com.case_study.casemd3.model.Merchant;
import com.case_study.casemd3.service.IGeneric;

import java.util.List;

public interface IMerchant extends IGeneric<Merchant> {
    @Override
    List<Merchant> findAll();

    @Override
    void save(Merchant merchant);

    @Override
    Merchant findById(int id);

    @Override
    boolean update(int id, Merchant merchant);

    @Override
    boolean remove(int id);
}
