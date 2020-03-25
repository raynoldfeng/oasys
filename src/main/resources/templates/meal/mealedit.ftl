<#include "/common/commoncss.ftl">
<style type="text/css">

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
.red{
	color:#d9534f;
	font-weight:100;
	font-size:1px;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">菜单管理</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">菜品管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->

		<div class="bgc-w box">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default"
						style="padding: 5px;"> <i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
				</h3>
			</div>
			<form action="updateMealItem" method="post" id="thisForm" onsubmit="return check();">
				<!--盒子身体-->
				<div class="box-body no-padding">
					<div class="box-body">
						<div class="alert alert-danger alert-dismissable" role="alert"
							style="display: none;">
							错误信息:<button class="close" type="button">&times;</button>
							<span class="error-mess"></span>
						</div>

						<div class="row">
							<div class="col-md-6 form-group">
							    <input class="form-control" value="${(mealObject.mealId)!''}" name="mealId"/>
							    <div class="row">
								    <label class="control-label"><span>名称</span></label>
								    <input class="form-control" value="${(mealObject.mealName)!''}" name="mealName"/>
								</div>

								<div class="row">
								    <label class="control-label"><span>介绍</span></label>
                                    <input	class="form-control" value="${(mealObject.mealDesc)!''}" name="mealDesc"/>
								</div>

                                <div class="row">
							        <label class="control-label">
							            <span>图片</span> <a title="图标参考">
							        </label>
							    </div>
							    <div class="row">
							        <img src="img/1.jpg" class="img-rect" style="width: 128px; height: 128px;" />
							    </div>
							    <div class="row">
                                   	<a href="##">上传</a>
                                </div>
							    <div class="row">
                                    <input type="hidden" class="form-control" value="${(mealObject.mealImage)!''}"  name="mealImage"/>
								</div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label class="control-label"><span>价格</span></label>
                                <input type="text" onkeyup="clearNoNum(this)" class="num form-control" value="${(mealObject.mealPrice/100)!''}">
                                <input type="hidden" id="hidden-price" class="form-control" name="mealPrice" value=0>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="control-label"><span>排序</span></label>
                                 <input type="number" min="0" class="form-control" value="${(mealObject.sortId)!'0'}" name="sortId"/>
                            </div>

                            <div class="col-md-6 form-group">
                                <label class="control-label"><span>显示</span></label><br>
                                <#if mealObject??>
                                    <#if mealObject.show==true>
                                        <span class="labels"><label><input name="show" type="checkbox" checked><i>✓</i></label></span>
                                        <#else>
                                        <span class="labels"><label><input name="show" type="checkbox"><i>✓</i></label></span>
                                    </#if>
                                <#else>
                                        <span class="labels"><label><input name="show" type="checkbox"><i>✓</i></label></span>
                                </#if>
                            </div>
                        </div>
			        </div>
				</div>

				<!--盒子尾-->
				<div class="box-footer">
					<input class="btn btn-primary" id="save" type="submit" value="保存" />
					<input class="btn btn-default" id="cancel" type="button" value="取消"
						onclick="window.history.back();" />
				</div>
			</form>
		</div>

	</div>
</div>

<#include "/common/modalTip.ftl"/>
<script type="text/javascript">

$('.successToUrl').on('click',function(){
	window.location.href='/mealmanage';
});
//控制只能输入小数点后2位
function clearNoNum(obj) {
    obj.value = obj.value.replace(/[^\d.]/g, ""); //清除“数字”和“.”以外的字符
    obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
    obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3'); //只能输入两个小数
    if (obj.value.indexOf(".") < 0 && obj.value != "") { //以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
        obj.value = parseFloat(obj.value);
    }
    $("#hidden-price").val(Number(obj.value) * 100)
}

function check() {
	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	var isRight = 1;
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			// 排除哪些字段是可以为空的，在这里排除
			if (index == 3 || index == 4) {
				return true;
			}
			if(index == 3){

			}
			// 获取到input框的兄弟的文本信息，并对应提醒；
			var brother = $(this).siblings('.control-label').text();
			var errorMess = "[" + brother + "输入框信息不能为空]";
			// 对齐设置错误信息提醒；红色边框
			$(this).parent().addClass("has-error has-feedback");
			$('.alert-danger').css('display', 'block');
			// 提示框的错误信息显示
			$('.error-mess').text(errorMess);
			// 模态框的错误信息显示
			$('.modal-error-mess').text(errorMess);
			isRight = 0;
			return false;
		} else {
			// 在这个里面进行其他的判断；不为空的错误信息提醒
			return true;
		}
	});
	if (isRight == 0) {
		//modalShow(0);
		 return false;
	} else if (isRight == 1) {
		//modalShow(1);
		 return true;
	}
//	return false;
}
</script>
