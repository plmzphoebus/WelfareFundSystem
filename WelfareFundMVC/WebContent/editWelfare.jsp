<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Edit Welfare's Information">
	<jsp:attribute name="allWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="editWelfareCtrl">
					<div class="row">
                            <div class="col-lg-6 col-lg-offset-3">
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
                                    <div class="form-group" ng-repeat="condition in welfare.conditionals">
										<label class="control-label col-lg-2">เงื่อนไข</label>

										<div class="col-lg-3">
											<input type="number" class="form-control" name="amountofDate[]" min="180" value="{{condition.amountofDate}}">
										</div>
                                        <div>
											<label class="control-label col-lg-2">Day</label>
										</div>
                                        <div class="col-lg-3">
											<input type="number" class="form-control" name="welfareMoney[]" value="{{condition.welfareMoney}}">
										</div>
                                         	<label class="control-label col-lg-1">Baht</label>
                                        <div class="col-lg-1">
											&nbsp;
										</div>
									</div>
                                    <div id="MoreCondition"></div>
                                    
                                    
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
		 
	</jsp:attribute>
</welfare:staffTemplate>