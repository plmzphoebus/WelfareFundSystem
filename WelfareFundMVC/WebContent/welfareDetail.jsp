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
											{{welfare.welfareName}}
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">รายละเอียด</label>
										<div class="col-lg-10">
											{{welfare.description}}
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
												<td>{{condition.conditionDetail}}</td>
												<td>{{condition.welfareMoney}}</td>
												<td>{{condition.amountofDate}}</td>
											</tr>
											</tbody>
										</table>
									</div>
                                    
                                    
								</fieldset>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>				
		</div>
		 
	</jsp:attribute>
</welfare:staffTemplate>