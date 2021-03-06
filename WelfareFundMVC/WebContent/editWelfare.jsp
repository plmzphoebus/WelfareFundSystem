<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Edit Welfare's Information">
	<jsp:attribute name="allWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="editWelfareCtrl">
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
                                        
                                        <form class="form-horizontal">
								<fieldset class="content-group">
									<legend class="text-bold">แก้ไขข้อมูลสวัสดิการ : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">ชื่อสวัสดิการ</label>
										<div class="col-lg-10">
										<input type="hidden" ng-model="welfare.welfareID">
											<input type="text" class="form-control" ng-model="welfare.welfareName" placeholder="ชื่อสวัสดิการ">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">รายละเอียด</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control" ng-model="welfare.description" placeholder="รายละเอียดสวัสดิการ"></textarea>
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
											<tr ng-repeat="condition in welfare.conditionals">
												<td><a href="#" class="conditionDetail" data-type="text" data-pk="{{condition.conditionID}}" data-url="editConditionDetail.do" data-title="แก้ไขรายละเอียดเงื่อนไข">{{condition.conditionDetail}}</a></td>
												<td><a href="#" class="welfareMoney" data-type="text" data-pk="{{condition.conditionID}}" data-url="editWelfareMoney.do" data-title="แก้ไขจำนวนเงิน">{{condition.welfareMoney}}</a></td>
												<td><a href="#" class="amountofDate" data-type="text" data-pk="{{condition.conditionID}}" data-url="editAmountofDate.do" data-title="แก้ไขจำนวนวัน">{{condition.amountofDate}}</a></td>
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
		 	$(document).ready(function(){
		 		 $('.conditionDetail').editable();
		 		 $('.welfareMoney').editable();
		 		 $('.amountofDate').editable();
		 		setTimeout(function(){
		 			$('.conditionDetail').editable();
			 		 $('.welfareMoney').editable();
			 		 $('.amountofDate').editable();
		 			}, 2000);
		 	});
		 </script>
	</jsp:attribute>
</welfare:staffTemplate>