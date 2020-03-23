package cn.gson.oasys.model.entity.meal;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Entity
@Table(name = "aoa_meal_item")
public class MealItem {
    @Id
    @Column(name = "meal_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long mealId;

    @Column(name = "meal_name")
    @NotEmpty(message="菜品名字不能为空")
    private String mealName;

    @Column(name = "meal_desc")
    private String mealDesc;

    @Column(name = "meal_image")
    private String mealImage;

    @Column(name = "meal_price")
    private Integer mealPrice=0;

    @Column(name = "sort_id")
    private Integer sortId=999; // 菜单排序id

    @Column(name = "is_show")
    private Boolean show=false; // 菜单是否显示

    public Boolean getShow() {
        return show;
    }

    public Integer getMealPrice() {
        return mealPrice;
    }

    public Integer getSortId() {
        return sortId;
    }

    public Long getMealId() {
        return mealId;
    }

    public String getMealDesc() {
        return mealDesc;
    }

    public String getMealImage() {
        return mealImage;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealDesc(String mealDesc) {
        this.mealDesc = mealDesc;
    }

    public void setMealId(Long mealId) {
        this.mealId = mealId;
    }

    public void setMealImage(String mealImage) {
        this.mealImage = mealImage;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }

    public void setMealPrice(Integer mealPrice) {
        this.mealPrice = mealPrice;
    }

    public void setShow(Boolean show) {
        this.show = show;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

}
