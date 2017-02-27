<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Member Detail">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp"
			ng-controller="memberDetailCtrl">
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i>รายละเอียดสมาชิก : {{member.firstName}} {{member.lastName}} ระยะเวลาที่เป็นสมาชิก {{peroidOfMembership}} วัน</h5>
				<br>
                                
							<div class="heading-elements">
				                <button class="btn btn-primary" data-toggle="modal"
						data-target="#newSaving">เพิ่มการออมใหม่</button>
                                <button class="btn btn-success"
						data-toggle="modal" data-target="#receiveWelfare" ng-if="peroidOfMembership < 180" disabled>รับสวัสดิการ</button>
						<button class="btn btn-success"
						data-toggle="modal" data-target="#receiveWelfare" ng-if="peroidOfMembership >= 180">รับสวัสดิการ</button>
                                <button class="btn btn-danger"
						data-toggle="modal" data-target="#editinformation">แก้ไขข้อมูลสมาชิก</button>
		                	</div>
						</div>
                        
                        <!-- Colored tabs -->
                    <div class="panel-body">    
					   <div class="row">
						  <div class="col-md-12">
								<ul class="nav nav-tabs bg-teal-400 nav-justified">								    
								    <li class="active"><a href="#tab1" data-toggle="tab">การออม</a></li>
                                    <li><a href="#tab2"
								data-toggle="tab">การรับสวัสดิการ</a></li>
                                    <li><a href="#tab3"
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
                                            <tr ng-repeat="trans in transactions" >
                                                <td>{{trans.date | date:"dd-MM-yyyy"}}</td>
                                                <td>{{trans.startDate | date:"MMMM"}} - {{trans.endDate | date:"MMMM"}}</td>
                                                <td class="text-center">{{trans.amount}}</td>
                                                <td class="text-center">รัตนา</td>
                                                <td class="text-center"><a
											class="btn btn-primary" href="printReceipt.jsp?id={{memberId}}&transactionid={{trans.transactionId}}">Print Receipt</a></td>
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

                                            <tr ng-repeat="receivewelfare in receivewelfares">
                                                <td>{{receivewelfare.date | date:'dd/MM/yyyy'}}</td>
                                                <td>{{receivewelfare.welfare.welfareName}}</td>
                                                <td>{{receivewelfare.amount}}</td>                                    
                                                <td>{{receivewelfare.remark}}</td>
                                                <td><a
											class="btn btn-primary" href="receiveWelfarePrint.jsp?id={{member.memberId}}&receiveWelfareId={{receivewelfare.receiveWelfareId}}">Print Receipt</a></td>
                                            </tr>
                                            
                                        </tbody>                                          
                                    </table>
				                </div>
                                
                                    <div class="tab-pane"
						id="tab3">
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
        <div id="newSaving" class="modal fade" role="dialog" >
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">การออมเงิน</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <div class="form-group">
                            <label class="control-label col-lg-2">Start Date</label>
                                <div class="col-lg-10">
                                    <input type="date"
										class="form-control" ng-model="saving.startDate">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">End Date</label>
                                <div class="col-lg-10">
                                    <input type="date"
										class="form-control" ng-model="saving.endDate">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">Amount</label>
                                <div class="col-lg-10">
                                    <input type="number"
										class="form-control" ng-model="saving.amount">
									<input type="hidden"
										class="form-control" ng-model="saving.account.accountId" ng-init="saving.account.accountId = accountId">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">&nbsp;</label>
                                <div class="col-lg-10">
                                    <button type="button" ng-click="savingFund()" class="btn btn-success" >Save</button>
                                </div>
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
                      <div class="form-group">
                            <label class="control-label col-lg-3">วันที่</label>
                                <div class="col-lg-9">
                                    <input type="date"
										class="form-control" ng-model="receive.date">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">ประเภทสวัสดิการ</label>
                                <div class="col-lg-9">
                                    <select class="form-control" ng-model="receive.welfare.welfareID" ng-change="selectedWelfare()">
                                        <option ng-repeat="welfare in welfares" value="{{welfare.welfareID}}">{{welfare.welfareName}}</option>
                                    </select>
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">จำนวนเงิน</label>
                                <div class="col-lg-9">
                                    <select class="form-control" ng-model="receive.amount">
                                    	<option ng-repeat="condition in listConditions" value="{{condition.welfareMoney}}">{{condition.conditionDetail}} {{condition.welfareMoney}} บาท</option>
                                    </select>
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">หมายเหตุ</label>
                                <div class="col-lg-9">
                                    <input type="text"
										class="form-control" ng-model="receive.remark">
										<input type="hidden"
										class="form-control" ng-model="receive.member.memberId" ng-init="receive.member.memberId = memberId">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-3">&nbsp;</label>
                                <div class="col-lg-9">
                                    <button type="button"
										class="btn btn-success" ng-click="receiveWelfare()">บันทึก</button> 
                                </div>
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
										<label class="control-label col-lg-2">วันเข้าเป็นสมาชิก</label>
										<div class="col-lg-10">
											<input type="date" class="form-control" ng-model="entranceDate">
										</div>
									</div>
                                    <div class="form-group">
										
                                        <label
											class="control-label col-lg-2">ประเภทการชำระเงิน</label>
										<div class="col-lg-10">
											<select class="form-control" ng-model="member.preferPayment">
                                                <option value="รายเดือน" ng-selected="{{member.preferPayment == paymentType}}">รายเดือน</option>
                                                <option value="รายครึ่งปี" ng-selected="{{member.preferPayment == paymentType}}">รายครึ่งปี</option>
                                                <option value="รายปี" ng-selected="{{member.preferPayment == paymentType}}">รายปี</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">ชื่อ</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">นามสกุล</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">อายุ</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="member.age">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-2">ที่อยู่</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
												placeholder="Default textarea" ng-model="member.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">อาชีพ</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">เงินเดือน</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.revenue">
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
										<label class="control-label col-lg-2">ชื่อ</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">นามสกุล</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">อายุ</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="member.beneficiary.age">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-2">ที่อยู่</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
												placeholder="Default textarea" ng-model="member.beneficiary.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์บ้าน</label>
										<div class="col-md-10">
											<input class="form-control" type="text" ng-model="member.beneficiary.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">เบอร์โทรศัพท์มือถือ</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.beneficiary.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">อาชีพ</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">เงินเดือน</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.revenue">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">ความสัมพันธ์</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.relationship">
										</div>
									</div>
								</fieldset>

								<div class="text-right">
								<input type="hidden" ng-model="member.memberId">
									<button type="button" class="btn btn-primary" ng-click="saveMember()">บันทึก <i
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
					
	</jsp:attribute>

</welfare:staffTemplate>