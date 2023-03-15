package com.case_study.casemd3.service.food;

import com.case_study.casemd3.model.Food;
import com.case_study.casemd3.service.IGeneric;

import java.util.List;

public interface IFood extends IGeneric<Food> {
    List<Food> searchFood(String food_name);
}
