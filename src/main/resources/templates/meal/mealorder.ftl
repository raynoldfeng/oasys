<style type="text/css">
.v-middle {
    display:table-cell; vertical-align:middle !important
}
</style>
<#include "/common/commoncss.ftl">
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
.table>tbody>tr>td{
    border-top: 1px solid rgba(245, 245, 220, 0.29);
    }

</style>

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">菜品管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">菜品管理</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a id='make_order' class="label label-success" style="padding: 5px;margin-left:5px;">
                		<span class="glyphicon glyphicon-plus"></span> 下單
                	</a>
					<a href="" class="label label-success" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
				</h3>
				<div class="box-tools">
					<div class="input-group" style="width: 150px;">
						<input type="text" class="form-control input-sm baseKey"
							placeholder="按名称查找" />
						<div class="input-group-btn">
							<a class="btn btn-sm btn-default baseKeySubmit"><span
								class="glyphicon glyphicon-search"></span></a>
						</div>
					</div>
				</div>
			</div>
			<!--盒子身体-->
			<div class="box-body no-padding thistable">
				<table class="table table-hover">
                		<tr>
                			<th scope="col">名称</th>
                			<th scope="col">圖片</th>
                			<th scope="col">介紹</th>
                			<th scope="col">價格</th>
                			<th scope="col">數量</th>
                		</tr>

                		<#if MealItems??>
                            <#list MealItems as one>
                                <tr class="item" style="background:rgba(255, 235, 59, 0.19);">
                                    <#if one.show==true>
                                        <td style="display:none;" class="v-middle">${(one.mealId)}</td>
                                        <td class="v-middle">${(one.mealName)!''}</td>
                                        <td class="v-middle"><img  height="64" width="64" src="${(one.mealImage)!''}"></img></div></td>
                                        <td class="v-middle"><span>${(one.mealDesc)!''}</span></td>
                                        <td class="v-middle"><span>${(one.mealPrice/100)!''}</span></td>
                                        <td class="v-middle">
                                            <input style="width:6em" type="number" min="0" max="99" class="form-control"/>
                                        </td>
                                    </#if>
                                </tr>
                            </#list>
                        </#if>
                	</table>
			</div>
			<!--盒子尾-->
		</div>
	</div>

</div>

<script>
$('#make_order').on('click',function(){
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
    var items = new Array();
    $(".item").each(function(){
        var mealId =$(this)[0].cells[0].innerHTML;
        var mealCount =$(this)[0].cells[5].children[0].value
        items.push({"mealId": mealId, "mealCount":mealCount});
    });

    $.ajax({
    　　type : "POST",
    　　url : "/makeorder",
    　　data : JSON.stringify({"items": items}),
    　　contentType:"application/json;charset=utf-8",
    　　dataType : "json",
    　　success : function(data) {
            if(data.status){
            }else{
            }
    　　}
    });
    console.log(items);
});
</script>