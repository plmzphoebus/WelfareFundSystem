<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Member Detail">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp"
			ng-controller="memberDetailCtrl" ng-init="loadData()">
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i>รายละเอียดสมาชิก : {{member.firstName}} {{member.lastName}} ระยะเวลาที่เป็นสมาชิก {{peroidOfMembership}} วัน</h5>
				<br>
                                
							<div class="heading-elements">
				                <button id="addSavingFund" class="btn btn-primary" data-toggle="modal"
						data-target="#newSaving">เพิ่มการออมใหม่</button>
                                <button id="receiveWelfarebtn" class="btn btn-success"
						data-toggle="modal" data-target="#receiveWelfare"
						ng-if="peroidOfMembership < 180" disabled>รับสวัสดิการ</button>
								<button id="receiveWelfarebtn" class="btn btn-success" data-toggle="modal"
						data-target="#receiveWelfare" ng-if="peroidOfMembership >= 180">รับสวัสดิการ</button>
                                <button id="editMemberDetail" class="btn btn-danger"
						data-toggle="modal" data-target="#editinformation">แก้ไขข้อมูลสมาชิก</button>
		                	</div>
						</div>
                        
                        <!-- Colored tabs -->
                    <div class="panel-body">    
					   <div class="row">
						  <div class="col-md-12">
								<ul class="nav nav-tabs bg-teal-400 nav-justified">								    
								    <li id="savingTab" class="active"><a href="#tab1" data-toggle="tab">การออม</a></li>
                                    <li id="receivedWelfareTab"><a href="#tab2"
								data-toggle="tab">การรับสวัสดิการ</a></li>
									<li id="beneficiariesTab"><a href="#tab3"
								data-toggle="tab">ผู้รับผลประโยชน์</a></li>
                                    <li id="memberDetailTab"><a href="#tab4"
								data-toggle="tab">ข้อมูลสมาชิก</a></li>
								</ul>
                            </div>
                        </div>
                        <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    
                                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">วันที่</th>
                                                <th class="text-center">เดือน</th>
                                                <th class="text-center">จำนวนเงิน</th>
                                                <th class="text-center">ผู้รับเงิน</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr
									ng-repeat="trans in transactions">
                                                <td>{{trans.date | date:"dd-MM-yyyy"}}</td>
                                                <td>{{trans.startDate | date:"MMMM"}} - {{trans.endDate | date:"MMMM"}}</td>
                                                <td class="text-center">{{trans.amount}}</td>
                                                <td class="text-center">รัตนา</td>
                                                <td class="text-center"><a id="printTransaction{{tran.transactionId}}"
										class="btn btn-primary"
										href="printReceipt.jsp?id={{memberId}}&transactionid={{trans.transactionId}}">Print Receipt</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

				                <div class="tab-pane" id="tab2">
				                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">วันที่</th>
                                                <th class="text-center">ประเภทสวัสดิการ</th>
                                                <th class="text-center">จำนวนเงิน</th>                                    
                                                <th class="text-center">หมายเหตุ</th>
                                                <th class="text-center">พิมพ์ใบเสร็จ</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr
									ng-repeat="receivewelfare in receivewelfares">
                                                <td>{{receivewelfare.date | date:'dd/MM/yyyy'}}</td>
                                                <td>{{receivewelfare.welfare.welfareName}}</td>
                                                <td>{{receivewelfare.amount}}</td>                                    
                                                <td>{{receivewelfare.remark}}</td>
                                                <td><a id="printReceive{{receiveWelfare.receiveWelfareId}}"
										class="btn btn-primary"
										href="receiveWelfarePrint.jsp?id={{member.memberId}}&receiveWelfareId={{receivewelfare.receiveWelfareId}}">Print Receipt</a></td>
                                            </tr>
                                            
                                        </tbody>                                          
                                    </table>
				                </div>
                                	<div class="tab-pane" id="tab3">
                                    <button class="btn btn-primary pull-right" style="margin-bottom:5px;" data-toggle="modal" data-target="#addNewBeneficiary">เพิ่มผู้รับผลประโยชน์</button>
                                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">ลำดับที่</th>
                                                <th class="text-center">ชื่อ - นามสกุล</th>
                                                <th class="text-center">อายุ</th>
                                                <th class="text-center">ความสัมพันธ์</th>
                                                <th class="text-center">เบอร์โทรศัพท์</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="beneficiary in beneficiaries">
                                                <td class="text-center">{{$index+1}}</td>
                                                <td class="text-center">{{beneficiary.firstName}} {{beneficiary.lastName}}</td>
                                                <td class="text-center">{{calAge(beneficiary.birthDate)}}</td>
                                                <td class="text-center">{{beneficiary.relationship}}</td>
                                                <td class="text-center">{{beneficiary.telephoneNumber}}<br>{{beneficiary.mobileTel}}</td>
                                                <td class="text-center"><a href="#" ng-click="editBeneficiary(beneficiary.beneficiaryId)">แก้ไข</a> <a href="#" ng-click="deleteBeneficiary(beneficiary.beneficiaryId)" class="text-danger">ลบ</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                    <div class="tab-pane" id="tab4">
                                        <div class="row">
                                            <div
								class="col-md-6 col-md-offset-3">
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">ชื่อสมาชิก</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.firstName}} {{member.lastName}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">อายุ</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{age}} ปี</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">ที่อยู่</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.address}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">เบอร์โทรศัพท์บ้าน</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.telephoneNumber}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">เบอร์โทรศัพท์มือถือ</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.mobileTel}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">วันที่เข้าเป็นสมาชิก</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.entranceDate | date:"dd-MM-yyyy"}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">ประเภทการชำระเงิน</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.preferPayment}}</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>

				            </div>
                        </div>
                         <!-- Modal -->
        <div id="newSaving" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">การออมเงิน</h4>
              </div>
              <div class="modal-body">
                  <div class="row">                                    
                                    <p>
									<b>รายฝากเงิน{{member.preferPayment}}</b>
								</p>
                                     <div class="col-md-12">
                                    <p class="text-center"
										id="showMonthOfPeriod"
										ng-if="member.preferPayment=='รายเดือน'">{{lastTransaction.nextPayment|date:"MMMM yyyy"}}</p>
                                    <p class="text-center"
										id="showMonthOfPeriod"
										ng-if="member.preferPayment=='รายครึ่งปี' || member.preferPayment=='รายปี'">{{startDate|date:"MMMM yyyy"}} - {{endDate|date:"MMMM yyyy"}}</p>
                                    
                                    <p class="text-center"
										ng-if="member.preferPayment=='รายเดือน'">จำนวนเงินที่ฝาก <span
											id="amountOfSaving">{{getAllDateOfMonth(nextPaymentYear, nextPaymentMonth)}}</span> บาท</p>
                                    <p class="text-center"
										ng-if="member.preferPayment=='รายครึ่งปี'">จำนวนเงินที่ฝาก <span
											id="amountOfSaving">{{getAmountOfPeriod(nextPaymentYear, nextPaymentMonth,6)}}</span> บาท</p>
                                    <p class="text-center"
										ng-if="member.preferPayment=='รายปี'">จำนวนเงินที่ฝาก <span
											id="amountOfSaving">{{getAmountOfPeriod(nextPaymentYear, nextPaymentMonth,12)}}</span> บาท</p>
                                    </div>
                                   
                                    <div class="col-md-12">
                                        
                                    <center>
                                         <br>
                                          <button type="button" id="savingFund"
											class="btn btn-success text-center" ng-click="savingFund()">บันทึกการออม</button>
                                    </center>
                                    </div>
                                </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>
        
        
         <!-- Modal -->
        <div id="receiveWelfare" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">รับสวัสดิการ</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                  <form name="receiveWelfareForm">
                      <div class="form-group">
                            <label  class="control-label col-lg-3">วันที่</label>
                                <div class="col-lg-9">
                                    <input type="date" id="receiveWelfareDate"
											class="form-control" ng-model="receive.date">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">ประเภทสวัสดิการ</label>
                                <div class="col-lg-9">
                                    <select id="welfareType" class="form-control"  
											ng-model="receive.welfare.welfareID"
											ng-change="selectedWelfare()" required>
                                        <option
												ng-repeat="welfare in welfares"
												value="{{welfare.welfareID}}">{{welfare.welfareName}}</option>
                                    </select>
                                </div>
                      </div>
                      <div class="form-group">
                            <label  class="control-label col-lg-3">จำนวนเงิน</label>
                                <div class="col-lg-9">
                                    <select id="amountOfMoney" class="form-control"
											ng-model="receive.amount" required>
                                    	<option
												ng-repeat="condition in listConditions"
												value="{{condition.welfareMoney}}">{{condition.conditionDetail}} {{condition.welfareMoney}} บาท</option>
                                    </select>
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">หมายเหตุ</label>
                                <div class="col-lg-9">
                                    <input type="text"
											id="remark" class="form-control" ng-model="receive.remark" required>
										<input type="hidden" class="form-control"
											ng-model="receive.member.memberId"
											ng-init="receive.member.memberId = memberId" required>
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">&nbsp;</label>
                                <div class="col-lg-9">
                                    <button type="button" id="saveReceiveWelfare" ng-disabled="receiveWelfareForm.$invalid"
											class="btn btn-success" ng-click="receiveWelfare()">บันทึก</button> 
                                </div>
                      </div>
                      </form>
                  </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
              </div>
            </div>

          </div>
        </div>
        
        <!-- Modal -->
        <div id="editinformation" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">แก้ไขข้อมูลสมาชิก</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <form class="form-horizontal" action="#">
								<fieldset class="content-group">
									<legend class="text-bold">แก้ไขข้อมูลสมาชิก : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>
                                    <div class="form-group">
										<label class="control-label col-lg-3">วันเข้าเป็นสมาชิก</label>
										<div class="col-lg-9">
											<input type="date" id="editEntranceDate" class="form-control"
													ng-model="entranceDate">
										</div>
									</div>
                                    <div class="form-group">
										
                                        <label
												class="control-label col-lg-3">ประเภทการชำระเงิน</label>
										<div class="col-lg-9">
											<select id="editPreferPayment" class="form-control" ng-model="member.preferPayment">
                                                <option value="รายเดือน"
														ng-selected="{{member.preferPayment == paymentType}}">รายเดือน</option>
                                                <option
														value="รายครึ่งปี"
														ng-selected="{{member.preferPayment == paymentType}}">รายครึ่งปี</option>
                                                <option value="รายปี"
														ng-selected="{{member.preferPayment == paymentType}}">รายปี</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-3">ชื่อ</label>
										<div class="col-lg-9">
											<input type="text" id="editFirstname" class="form-control"
													ng-model="member.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">นามสกุล</label>
										<div class="col-lg-9">
											<input type="text" id="editLastname" class="form-control"
													ng-model="member.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">วัน/เดือน/ปี เกิด</label>
										<div class="col-lg-9">
											<input type="date" id="editbirthDate" class="form-control"
													ng-model="birthDate">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-3">ที่อยู่</label>
										<div class="col-lg-9">
											<textarea rows="5" cols="5" id="editAddress" class="form-control"
													placeholder="Default textarea" ng-model="member.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-9">
											<input id="editTelephoneNumber" class="form-control" type="tel"
													ng-model="member.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-9">
											<input id="editMobileTel" class="form-control" type="tel"
													ng-model="member.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">อาชีพ</label>
										<div class="col-lg-9">
											<input type="text" id="editOccupation" class="form-control"
													ng-model="member.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">เงินเดือน</label>
										<div class="col-lg-9">
											<input type="text" id="editRevenue" class="form-control"
													ng-model="member.revenue">
										</div>
									</div>
								</fieldset>

								<div class="text-right">
								<input type="hidden" ng-model="member.memberId">
									<button type="button" class="btn btn-primary" id="updateMember"
											ng-click="saveMember()">บันทึก <i
												class="icon-arrow-right14 position-right"></i>
									</button>
								</div>
							</form>
                  </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
								data-dismiss="modal">ปิด</button>
              </div>
            </div>

          </div>
        </div>
        
        <!-- Add new Beneficiary -->				
        <!-- Modal -->
        <div id="addNewBeneficiary" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">เพิ่มผู้รับผลประโยชน์</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <form name="addBeneficiaryForm" class="form-horizontal" action="#">
								<fieldset class="content-group">
                                    <legend class="text-bold">ผู้รับผลประโยชน์</legend>

									<div class="form-group">
										<label class="control-label col-lg-3">ชื่อ</label>
										<div class="col-lg-9">
											<input type="text" id="FirstnameOfBeneficiary" class="form-control"
													ng-model="beneficiary.firstName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">นามสกุล</label>
										<div class="col-lg-9">
											<input type="text" id="LastnameOfBeneficiary" class="form-control"
													ng-model="beneficiary.lastName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">วัน/เดือน/ปี เกิด</label>
										<div class="col-lg-9">
											<input type="date" id="BirthDateOfBeneficiary"  class="form-control"
													ng-model="beneficiary.birthDate" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-3">รหัสบัตรประชาชน</label>
										<div class="col-lg-9">
											<input type="text" id="citizenIdOfBeneficiary" class="form-control" ng-model="beneficiary.citizenId" maxlength="13" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-3">ที่อยู่</label>
										<div class="col-lg-9">
											<textarea rows="5" cols="5" id="AddressOfBeneficiary" class="form-control"
													placeholder="Default textarea"
													ng-model="beneficiary.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-9">
											<input id="TelephoneNumberOfBeneficiary" class="form-control" type="text"
													ng-model="beneficiary.telephoneNumber" maxlength="9" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-9">
											<input id="MobileTelOfBeneficiary" class="form-control" type="tel"
													ng-model="beneficiary.mobileTel" maxlength="10" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">อาชีพ</label>
										<div class="col-lg-9">
											<input type="text" id="OccupationOfBeneficiary" class="form-control"
													ng-model="beneficiary.occupation" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">เงินเดือน</label>
										<div class="col-lg-9">
											<input type="text" id="RevenueOfBeneficiary" class="form-control"
													ng-model="beneficiary.revenue"  onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">ความสัมพันธ์</label>
										<div class="col-lg-9">
											<input type="text" id="Relationship" class="form-control"
													ng-model="beneficiary.relationship" required>
										</div>
									</div>
								</fieldset>

								<div class="text-right">
								<input type="hidden" ng-model="memberId">
									<button type="button" class="btn btn-primary" id="updateMember"
											ng-click="saveBeneficiary()" ng-disabled="addBeneficiaryForm.$invalid">บันทึก <i
												class="icon-arrow-right14 position-right"></i>
									</button>
								</div>
							</form>
                  </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
								data-dismiss="modal">ปิด</button>
              </div>
            </div>

          </div>
        </div>		
        
        <!-- Edit Beneficiary Information -->
        <div id="editNewBeneficiaryModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">แก้ไขข้อมูลผู้รับผลประโยชน์</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <form name="editBeneficiaryForm" class="form-horizontal" action="#">
								<fieldset class="content-group">
                                    <legend class="text-bold">ผู้รับผลประโยชน์</legend>

									<div class="form-group">
										<label class="control-label col-lg-3">ชื่อ</label>
										<div class="col-lg-9">
											<input type="text" id="editFirstnameOfBeneficiary" class="form-control"
													ng-model="editbeneficiary.firstName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">นามสกุล</label>
										<div class="col-lg-9">
											<input type="text" id="editLastnameOfBeneficiary" class="form-control"
													ng-model="editbeneficiary.lastName" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">วัน/เดือน/ปี เกิด</label>
										<div class="col-lg-9">
											<input type="date" id="editBirthDateOfBeneficiary"  class="form-control"
													ng-model="editBeneficiaryBirthDate" required>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-3">รหัสบัตรประชาชน</label>
										<div class="col-lg-9">
											<input type="text" id="editcitizenIdOfBeneficiary" class="form-control" ng-model="editbeneficiary.citizenId" maxlength="13" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-3">ที่อยู่</label>
										<div class="col-lg-9">
											<textarea rows="5" cols="5" id="editAddressOfBeneficiary" class="form-control"
													placeholder="Default textarea"
													ng-model="editbeneficiary.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-9">
											<input id="editTelephoneNumberOfBeneficiary" class="form-control" type="text"
													ng-model="editbeneficiary.telephoneNumber" maxlength="9" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-3">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-9">
											<input id="editMobileTelOfBeneficiary" class="form-control" type="tel"
													ng-model="editbeneficiary.mobileTel" maxlength="10" onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">อาชีพ</label>
										<div class="col-lg-9">
											<input type="text" id="editOccupationOfBeneficiary" class="form-control"
													ng-model="editbeneficiary.occupation" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">เงินเดือน</label>
										<div class="col-lg-9">
											<input type="text" id="editRevenueOfBeneficiary" class="form-control"
													ng-model="editbeneficiary.revenue"  onkeypress="return isNumberKey(event)" required>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-3">ความสัมพันธ์</label>
										<div class="col-lg-9">
											<input type="text" id="editRelationship" class="form-control"
													ng-model="editbeneficiary.relationship" required>
										</div>
									</div>
								</fieldset>

								<div class="text-right">
								<input type="hidden" ng-model="memberId">
									<button type="button" class="btn btn-primary" id="updateMember"
											ng-click="updateBeneficiary()">บันทึก <i
												class="icon-arrow-right14 position-right"></i>
									</button>
								</div>
							</form>
                  </div>
                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default"
								data-dismiss="modal">ปิด</button>
              </div>
            </div>

          </div>
        </div>
        
					</div>
		<script type="text/javascript">
		function isNumberKey(evt){
    	    var charCode = (evt.which) ? evt.which : event.keyCode
    	    if (charCode > 31 && (charCode < 48 || charCode > 57))
    	        return false;
    	    return true;
    	}
		</script>			
	</jsp:attribute>

</welfare:staffTemplate>