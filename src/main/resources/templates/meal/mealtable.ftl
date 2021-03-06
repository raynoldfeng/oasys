<style type="text/css">
.v-middle {
    display:table-cell; vertical-align:middle !important
}
</style>
<div class="table-responsive">
	<table class="table table-hover">
		<tr>
			<th scope="col">名称</th>
			<th scope="col">圖片</th>
			<th scope="col">介紹</th>
			<th scope="col">價格</th>
			<th scope="col">排序</th>
			<th scope="col">显示</th>
			<th scope="col">操作</th>
		</tr>
		<#if MealItems??>
            <#list MealItems as one>
                <tr style="background:rgba(255, 235, 59, 0.19);">
                    <td class="v-middle">${(one.mealName)!''}</td>
                    <td class="v-middle"><img height="64" width="64" src="${(one.mealImage)!''}"></img></div></td>
                    <td class="v-middle"><span>${(one.mealDesc)!''}</span></td>
                    <td class="v-middle"><span>${(one.mealPrice/100)!''}</span></td>
                    <td class="v-middle"><span>${(one.sortId)!''}</span></td>
                    <#if one.show==true>
                        <td class="v-middle"><span class="labels"><label><input type="checkbox" checked disabled><i>✓</i></label></span></td>
                    <#else>
                        <td class="v-middle"><span class="labels"><label><input type="checkbox" disabled><i>✓</i></label></span></td>
                    </#if>
                    <td class="v-middle">
                        <a href="changeSortId?sortid=${one.sortId}&mealid=${one.mealId}&num=1" class="label sheding"><span class="glyphicon glyphicon-arrow-up"></span> 上移</a>
                        <a href="changeSortId?sortid=${one.sortId}&mealid=${one.mealId}&num=-1" class="label sheding"><span class="glyphicon glyphicon-arrow-down"></span> 下移</a>
                        <a href="mealedit?id=${one.mealId}" class="label xiugai"><span class="glyphicon glyphicon-edit"></span> 修改</a>
                        <a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};" href="deletemeal?id=${one.mealId}" class="label shanchu">
                            <span	class="glyphicon glyphicon-remove"></span> 删除
                        </a>
                        <a href="mealedit?id=${one.mealId}&add=this" class="label xinzeng"><span class="glyphicon glyphicon-plus"></span> 新增</a>
                    </td>
                </tr>
            </#list>
        </#if>
	</table>
</div>