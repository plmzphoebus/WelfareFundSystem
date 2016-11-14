<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Member">
	<jsp:attribute name="newMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="col-lg-6 col-lg-offset-3" ng-app="myApp" ng-controller="newMemberCtrl">
                                <div class="panel panel-flat">
						          <div class="panel-heading">
							         <h5 class="panel-title">New Member</h5>
							         <div class="heading-elements">
								        <ul class="icons-list">
			                	        </ul>
		                	         </div>
						          </div>
                                    <div class="panel-body">
                                        
                                        <form class="form-horizontal"
						action="#">
								<fieldset class="content-group">
									<legend class="text-bold">Register Form : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Entrance Date</label>
										<div class="col-lg-10">
											<input type="date" class="form-control" ng-model="data.entranceDate">
										</div>
									</div>
									<div class="form-group">
										
                                        <label
									class="control-label col-lg-2">Community</label>
										<div class="col-lg-10">
											<select class="form-control" ng-model="data.community.communityId" ng-init="communities[0].communityId">
                                                <option ng-repeat="community in communities" value="{{community.communityId}}">{{community.communityName}}</option>
                                            </select>
										</div>
									</div>
                                    <div class="form-group">
										
                                        <label
									class="control-label col-lg-2">Payment Type</label>
										<div class="col-lg-10">
											<select class="form-control" ng-model="data.preferPayment.preferPaymentId" ng-init="preferPayments[0].preferPaymentId">
                                                <option ng-repeat="preferpayment in preferPayments" value="{{preferpayment.preferPaymentId}}">{{preferpayment.preferPaymentName}}</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										
                                        <label
									class="control-label col-lg-2">Member Type</label>
										<div class="col-lg-10">
											<select class="form-control" ng-model="data.memberType.memberTypeId" ng-init="memberTypes[0].memberTypetId">
                                                <option ng-repeat="memberType in memberTypes" value="{{memberType.memberTypeId}}">{{memberType.memberTypeName}}</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Firstname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Lastname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Age</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="data.age">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Citizen ID</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.citizen">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Address</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
										placeholder="Default textarea" ng-model="data.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="data.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number(Mobile)</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="data.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Occupation</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Revenue/Month</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.revenue">
										</div>
									</div>
                                    <h4>เงื่อนไขการเป็นสมาชิก</h4>
                                    <p class="content-group-lg">
                                        ข้อ 1 ข้าพเจ้าสมัครใจทำสัญญาด้วยตนเอง กับคณะกรรมการกองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม เพื่อร่วมทำสวัสดิการชุน และจะประพฤติตามข้อบังคับของกองทุนฯ ทุกประการ <br>
                                    
                                        ข้อ 2 ข้าพเจ้ามีคุณสมบัติครบถ้วนตามข้อบังคับของกองทุนฯ กำหนดทุกประการ<br>
                                    
                                        ข้อ 2 เมื่่อข้าพเจ้าถึงแก่กรรม ข้าพเจ้ามีความประสงค์ให้กองทุนฯ พิจารณาจ่ายเงินในส่วนที่เป็นประโยชน์ของข้าพเจ้าให้แก่ผู้มีรายชื่อดังนี้<br>
                                    </p>
									<legend class="text-bold">ผู้รับผลประโยชน์</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">Firstname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Lastname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Age</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="data.beneficiary.age">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Citizen ID</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.citizenId">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Address</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
										placeholder="Default textarea" ng-model="data.beneficiary.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="data.beneficiary.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number(Mobile)</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="data.beneficiary.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Occupation</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Revenue/Month</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.revenue">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Relationship</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.beneficiary.relationship">
										</div>
									</div>
								</fieldset>

								<div class="text-right">
									<button type="button" class="btn btn-primary" ng-click="newMember()">Submit <i
									class="icon-arrow-right14 position-right"></i>
							</button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
	</jsp:attribute>

</welfare:staffTemplate>