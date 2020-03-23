package cn.gson.oasys.model.dao.mealdao;

import cn.gson.oasys.model.entity.meal.MealItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface MealItemDao extends JpaRepository<MealItem, Long> {
    List<MealItem> findByMealNameLike(String name);

    MealItem findByMealName(String name);

    @Query("update MealItem meal set meal.delete=1 where meal.mealId= :mealId")
    @Modifying
    int deleteThis(@Param("mealId") Long mealId);

}
