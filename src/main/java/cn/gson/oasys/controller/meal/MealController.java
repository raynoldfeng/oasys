package cn.gson.oasys.controller.meal;

import cn.gson.oasys.model.entity.system.SystemTypeList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class MealController {

    Logger log = LoggerFactory.getLogger(getClass());

    /**
     * 进入菜品管理表格界面
     *
     * @param req
     * @return
     */
    @RequestMapping("mealedit")
    public String mealItems(HttpServletRequest req) {
        return "mealManage/mealedit";
    }
}