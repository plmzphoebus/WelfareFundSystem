<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Welfare">
	<jsp:attribute name="newWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="newWelfareCtrl">
				<div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <div class="panel panel-flat">
						          <div class="panel-heading">
							         <div class="heading-elements">
								        <ul class="icons-list">
			                	        </ul>
		                	         </div>
						          </div>
                                    <div class="panel-body">
                                        
                                        <form class="form-horizontal" action="#">
								<fieldset class="content-group">
									<legend class="text-bold">เพิ่มสวัสดิการใหม่ : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">ชื่อสวัสดิการ</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.welfareName" placeholder="ชื่อสวัสดิการ">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">รายละเอียด</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control" ng-model="data.description" placeholder="รายละเอียด"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-4"><b>เงื่อนไขการรับสวัสดิการ</b></label>
									</div>
									<div class="form-group">
										<table class="table">
											<tr>
												<th width="40%">รายละเอียดเงื่อนไข</th>
												<th>จำนวนเงินที่ได้รับ (บาท)</th>
												<th>จำนวนวันขั้นต่ำที่เป็นสมาชิก</th>
												<th></th>
											</tr>
											<tbody id="moreCondition">
											<tr>
												<td><input type="text" name="conditionDetail[]" placeholder="รายละเอียดเงื่อนไข" class="form-control"></td>
												<td><input type="number" name="welfareMoney[]" placeholder="จำนวนเงิน" class="form-control"></td>
												<td><input type="number" name="amountofDate[]" placeholder="จำนวนวันขั้นต่ำ" class="form-control"></td>
												<td>
													<button type="button" class="btn btn-success btn-circle" onclick="addCondition()"><i class="icon  icon-plus3"></i></button>
												</td>
											</tr>
											</tbody>
										</table>
									</div>
                                   
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="button" class="btn btn-primary" ng-click="saveWelfare()">บันทึก <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
		 <script>
            
            function deleteCondition(id){
                $("#condition"+id).remove();
            }
            function addCondition(){
            	var id = Math.floor((Math.random() * 10000) + 1);
            	var str = "";
            	str += "<tr id=\"condition"+id+"\">";
				str += "<td><input type=\"text\" name=\"conditionDetail[]\" placeholder=\"รายละเอียดเงื่อนไข\" class=\"form-control\"></td>";
				str += "<td><input type=\"number\" name=\"welfareMoney[]\" placeholder=\"จำนวนเงิน\" class=\"form-control\"></td>";
				str += "<td><input type=\"number\" name=\"amountofDate[]\" placeholder=\"จำนวนวันขั้นต่ำ\" class=\"form-control\"></td>";
				str += "<td>";
				str += "<button type=\"button\" class=\"btn btn-danger btn-circle\" onclick=\"deleteCondition("+id+")\"><i class=\"icon  icon-minus3\"></i></button>";
				str += "</td>";
				str += "</tr>";
            	 $("#moreCondition").append(str);
            }
        </script>
	</jsp:attribute>
</welfare:staffTemplate>