<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Member">
	<jsp:attribute name="newMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="col-lg-8 col-lg-offset-2" ng-app="myApp" ng-controller="newMemberCtrl">
                                <div class="panel panel-flat">
						          <div class="panel-heading">
							         <h5 class="panel-title">เพิ่มสมาชิกใหม่</h5>
							         <div class="heading-elements">
								        <ul class="icons-list">
			                	        </ul>
		                	         </div>
						          </div>
                                    <div class="panel-body">
                                        
                                        <form name="myForm" class="form-horizontal"
						action="#">
								<fieldset class="content-group">
									<legend class="text-bold">ฟอร์มสมัครสมาชิก : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>
                                    <div class="form-group">
										<label class="control-label col-lg-2">วันสมัคร</label>
										<div class="col-lg-10">
											<input type="date" id="entranceDate" class="form-control" ng-model="data.entranceDate" required>
										</div>
									</div>
									<div class="form-group">
										
                                        <label
									class="control-label col-lg-2">ชุมชน</label>
										<div class="col-lg-10">
											<select id="selectCommunity" class="form-control" ng-model="data.community.communityId" ng-init="" required>
                                                <option ng-repeat="community in communities" ng-selected="{{data.community.communityId == data.firstCommunity}}" value="{{community.communityId}}">{{community.communityName}}</option>
                                            </select>
										</div>
									</div>
                                    <div class="form-group">
										
                                        <label
									class="control-label col-lg-2">ประเภทการชำระเงิน</label>
										<div class="col-lg-10">
											<select id="selectPreferPayment" class="form-control" ng-model="data.preferPayment" ng-init="data.preferPayment = 'รายเดือน'" required>
                                                <option value="รายเดือน">รายเดือน</option>
                                                <option value="รายครึ่งปี">รายครึ่งปี</option>
                                                <option value="รายปี">รายปี</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">ชื่อ</label>
										<div class="col-lg-10">
											<input type="text" id="firstName" class="form-control" ng-model="data.firstName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">นามสกุล</label>
										<div class="col-lg-10">
											<input type="text" id="lastName" class="form-control" ng-model="data.lastName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">วัน/เดือน/ปี เกิด</label>
										<div class="col-lg-10">
											<input type="date" id="birthDate" class="form-control" ng-model="data.birthDate"  required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">รหัสบัตรประชาชน</label>
										<div class="col-lg-10">
											<input type="text" id="citizenId" class="form-control" ng-model="data.citizen" maxlength="13" onblur="checkCitizenId()" onkeypress="return isNumberKey(event)" required>
											<span id="alertCitizenId" class="text-danger"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">ที่อยู่</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" id="address" class="form-control"
										placeholder="ที่อยู่" ng-model="data.address" required></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-10">
											<input id="telephoneNumber" class="form-control" type="tel" ng-model="data.telephoneNumber" maxlength="9" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-10">
											<input id="mobileTel" class="form-control" type="tel" ng-model="data.mobileTel" maxlength="10" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">อาชีพ</label>
										<div class="col-lg-10">
											<input type="text" id="occupation" class="form-control" ng-model="data.occupation" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">รายได้ต่อเดือน</label>
										<div class="col-lg-10">
											<input type="text" id="revenue" class="form-control" ng-model="data.revenue" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
								</fieldset>

								<div class="text-right">
									<button type="button" id="saveMember" ng-disabled="myForm.$invalid" class="btn btn-primary" ng-click="newMember()">สมัครสมาชิก <i
									class="icon-arrow-right14 position-right"></i>
							</button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            <script>
                            	function checkCitizenId(){
                            		var citizenId = $("#citizenId").val();
                            		$.get("login/"+citizenId+".do").then(function(response){
                            			$("#alertCitizenId").html("รหัสบัตรประชาชนนี้ถูกใช้ไปแล้ว กรุณากรอกใหม่อีกครั้ง");
                            			 $("#citizenId").focus();
                            			console.log(response.data);
                            		},function(err){
                            			$("#alertCitizenId").html("");
                            		});
                            	}
                            	function isNumberKey(evt){
                            	    var charCode = (evt.which) ? evt.which : event.keyCode
                            	    if (charCode > 31 && (charCode < 48 || charCode > 57))
                            	        return false;
                            	    return true;
                            	}
                            </script>
	</jsp:attribute>

</welfare:staffTemplate>