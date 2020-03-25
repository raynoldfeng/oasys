package cn.gson.oasys.controller.meal;

import cn.gson.oasys.common.formValid.BindingResultVOUtil;
import cn.gson.oasys.common.formValid.MapToList;
import cn.gson.oasys.common.formValid.ResultEnum;
import cn.gson.oasys.common.formValid.ResultVO;
import cn.gson.oasys.model.dao.mealdao.MealItemDao;
import cn.gson.oasys.model.entity.meal.MealItem;
import cn.gson.oasys.services.meal.MealServices;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/")
public class MealController {

    Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private MealItemDao mealItemDao;

    @Autowired
    private MealServices mealServices;

    /**
     * 进入菜品管理表格界面
     *
     * @param req
     * @return
     */
    @RequestMapping("mealmanage")
    public String mealItems(HttpServletRequest req) {
        if (!StringUtils.isEmpty(req.getParameter("name"))) {
            req.setAttribute("MealItems", mealItemDao.findByMealName("%" + req.getParameter("name") + "%"));
        } else {
            mealServices.findAll(req);
        }
        return "meal/mealmanage";
    }

    /**
     * 进入菜品管理表格界面
     *
     * @param req
     * @return
     */
    @RequestMapping("mealorder")
    public String mealOrder(HttpServletRequest req) {
        mealServices.findAll(req);
        return "meal/mealorder";
    }

    /**
     * 菜品表单验证
     * @param req
     * @param meal
     * @param br
     * 后台校验表单数据，不通过则回填数据，显示错误信息；通过则直接执行业务，例如新增、编辑等；
     * @return
     */
    @RequestMapping("updateMealItem")
    public String testMess(HttpServletRequest req, @Valid MealItem meal, BindingResult br) {
        HttpSession session = req.getSession();
        Long mealId = null;
        req.setAttribute("mealObject", meal);
        // 这里返回ResultVO对象，如果校验通过，ResultEnum.SUCCESS.getCode()返回的值为200；否则就是没有通过；
        ResultVO res = BindingResultVOUtil.hasErrors(br);
        // 校验失败
        if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
            List<Object> list = new MapToList<>().mapToList(res.getData());
            req.setAttribute("errormess", list.get(0).toString());
            // 代码调试阶段，下面是错误的相关信息；
            System.out.println("list错误的实体类信息：" + meal);
            System.out.println("list错误详情:" + list);
            System.out.println("list错误第一条:" + list.get(0));
            System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
            // 下面的info信息是打印出详细的信息
            log.info("getData:{}", res.getData());
            log.info("getCode:{}", res.getCode());
            log.info("getMsg:{}", res.getMsg());
        }
        // 校验通过，下面写自己的逻辑业务
        else {
            mealItemDao.save(meal);
         }
            //执行业务代码

        System.out.println("此操作是正确的");
        req.setAttribute("success", "后台验证成功");

        return "forward:/mealedit";
    }
    /**
     * 菜品管理的编辑界面
     * @param req
     * @return
     */
    @RequestMapping("mealedit")
    public String newpage(HttpServletRequest req) {
        if(!StringUtils.isEmpty(req.getAttribute("errormess"))){
            req.setAttribute("errormess", req.getAttribute("errormess"));
        }
        if(!StringUtils.isEmpty(req.getAttribute("success"))){
            req.setAttribute("success", req.getAttribute("success"));
        }

        HttpSession session = req.getSession();
        session.removeAttribute("getId");
        if (!StringUtils.isEmpty(req.getParameter("id"))) {
            Long getId = Long.parseLong(req.getParameter("id"));
            MealItem mealObject = mealItemDao.findOne(getId);
            if (!StringUtils.isEmpty(req.getParameter("add"))) {
                Long getAdd = mealObject.getMealId();
                String getName=mealObject.getMealName();
                req.setAttribute("getAdd", getAdd);
                req.setAttribute("getName", getName);
                log.info("getAdd:{}", getAdd);
            } else {
                session.setAttribute("getId", getId);
                log.info("getId:{}", getId);
                req.setAttribute("mealObject", mealObject);
            }
        }
        return "meal/mealedit";
    }

    /**
     * 菜单管理的删除
     * @return
     */
    @RequestMapping("deletemeal")
    public String delete(HttpServletRequest req){
        Long menuId=Long.parseLong(req.getParameter("id"));
        int i=mealServices.deleteThis(menuId);
        log.info("{}:i=",i);
        return "forward:/mealmanage";
    }

    /**
     * 菜单管理的删除
     * @return
     */
    @RequestMapping(value="/makeorder", method = RequestMethod.POST)
    @ResponseBody
    public String order(HttpServletRequest req,@RequestBody JSONObject objects){
        HttpSession session = req.getSession();
        JSONArray array = objects.getJSONArray("items");
        long mealId = 0;
        int mealCount = 0;
        for(int i=0;i<array.size();i++) {
            mealId = Long.parseLong(array.getJSONObject(i).get("mealId").toString());
            mealCount = Integer.parseInt(array.getJSONObject(i).get("mealCount").toString());
        }
        System.out.println("此操作是正确的");
        req.setAttribute("success", "后台验证成功");

        return "forward:/makeorder";
    }
}