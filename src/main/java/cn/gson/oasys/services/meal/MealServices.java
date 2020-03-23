package cn.gson.oasys.services.meal;

import cn.gson.oasys.model.dao.mealdao.MealItemDao;
import cn.gson.oasys.model.entity.meal.MealItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class MealServices {
    @Autowired
    private MealItemDao mealItemDao;

    public void findAll(HttpServletRequest req){

        List<MealItem> mealItems =mealItemDao.findAll();

        req.setAttribute("MealItems", mealItems);

    }

    public int deleteThis(Long mealId){
        return mealItemDao.deleteThis(mealId);
    }

}
