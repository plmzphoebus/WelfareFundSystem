<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Member Detail">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp"
			ng-controller="memberDetailCtrl">
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i> Member Detail</h5>
				<br>
                                
							<div class="heading-elements">
				                <button class="btn btn-primary" data-toggle="modal"
						data-target="#newSaving">New saving</button>
                                <button class="btn btn-success"
						data-toggle="modal" data-target="#receiveWelfare">Receive Welfare</button>
                                <button class="btn btn-danger"
						data-toggle="modal" data-target="#editinformation">Edit Member's information</button>
		                	</div>
						</div>
                        
                        <!-- Colored tabs -->
                    <div class="panel-body">    
					   <div class="row">
						  <div class="col-md-12">
								<ul class="nav nav-tabs bg-teal-400 nav-justified">								    
								    <li class="active"><a href="#tab1" data-toggle="tab">Savings</a></li>
                                    <li><a href="#tab2"
								data-toggle="tab">Welfares</a></li>
                                    <li><a href="#tab3"
								data-toggle="tab">Member Detail</a></li>
								</ul>
                            </div>
                        </div>
                        <div class="tab-content">
                                <div class="tab-pane" id="tab1">
                                    
                                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Date</th>
                                                <th class="text-center">Peroid</th>
                                                <th class="text-center">Amount</th>                                    
                                                <th class="text-center">Balance</th>
                                                <th class="text-center">Recipient</th>
                                                <th class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody ng-init="totalBalance = 0">
                                            <tr ng-repeat="trans in transactions" >
                                                <td>{{trans.date | date:"dd-MM-yyyy"}}</td>
                                                <td>{{trans.startDate | date:"MMMM"}} - {{trans.endDate | date:"MMMM"}}</td>
                                                <td class="text-center">{{trans.amount}}</td>
                                                <td class="text-center">{{totalBalance + (trans.amount*($index+1))}}</td>
                                                <td class="text-center">รัตนา</td>
                                                <td class="text-center"><button
											class="btn btn-primary">Print Receipt</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

				                <div class="tab-pane" id="tab2">
                                    <center>
							<b>Born Balance:</b> 1500 Baht <b>Injury Balance:</b> 2000 Baht <b>Die Balance:</b> 3500 Baht</center>
				                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Welfare Type</th>
                                                <th>Amount</th>                                    
                                                <th class="text-center">Remark</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>15/10/2016</td>
                                                <td>Born</td>
                                                <td>200</td>                                    
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>15/10/2016</td>
                                                <td>Born</td>
                                                <td>200</td>                                    
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <td>15/10/2016</td>
                                                <td>Born</td>
                                                <td>200</td>                                    
                                                <td>-</td>
                                            </tr>
                                        </tbody>
                                    </table>
				                </div>
                                
                                    <div class="tab-pane active"
						id="tab3">
                                        <div class="row">
                                            <div
								class="col-md-6 col-md-offset-3">
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Member No.</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.memberId}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Member Name</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.firstName}} {{member.lastName}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Address</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.address}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Telephone Number</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.telephoneNumber}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Entrance Date</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.entranceDate | date:"dd-MM-yyyy"}}</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label
										class="control-label col-lg-4 text-bold">Payment Type</label>
                                                    <div
										class="col-lg-8">
                                                         <label
											class="control-label">{{member.preferPayment.preferPaymentName}}</label>
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
                <h4 class="modal-title">Saving Fund</h4>
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
                <h4 class="modal-title">New Saving</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <div class="form-group">
                            <label class="control-label col-lg-2">Date</label>
                                <div class="col-lg-10">
                                    <input type="date"
										class="form-control" ng-model="receive.date">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">Welfare Type</label>
                                <div class="col-lg-10">
                                    <select class="form-control" ng-model="receive.welfare.welfareId" >
                                        <option ng-repeat="welfare in welfares" value="{{welfare.welfareID}}">{{welfare.welfareName}}</option>
                                    </select>
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">Amount</label>
                                <div class="col-lg-10">
                                    <input type="number"
										class="form-control" ng-model="receive.amount">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">Remark</label>
                                <div class="col-lg-10">
                                    <input type="text"
										class="form-control" ng-model="receive.remark">
										<input type="hidden"
										class="form-control" ng-model="receive.member.memberId" ng-init="receive.member.memberId = memberId">
                                </div>
                      </div>
                      <div class="form-group">
                            <label class="control-label col-lg-2">&nbsp;</label>
                                <div class="col-lg-10">
                                    <button type="button"
										class="btn btn-success" ng-click="receiveWelfare()">Save</button> 
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
                <h4 class="modal-title">Edit member's information</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <form class="form-horizontal" action="#">
								<fieldset class="content-group">
									<legend class="text-bold">Edit member : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Entrance Date</label>
										<div class="col-lg-10">
											<input type="date" class="form-control" ng-model="member.entranceDate">
										</div>
									</div>
                                    <div class="form-group">
										
                                        <label
											class="control-label col-lg-2">Payment Type</label>
										<div class="col-lg-10">
											<select class="form-control">
                                                <option selected>Month</option>
                                                <option>Half Year</option>
                                                <option>Year</option>
                                            </select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-lg-2">Firstname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Lastname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Age</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="member.age">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-2">Address</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
												placeholder="Default textarea" ng-model="member.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number(Mobile)</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Occupation</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Revenue/Month</label>
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
										<label class="control-label col-lg-2">Firstname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.firstName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Lastname</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.lastName">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Age</label>
										<div class="col-lg-10">
											<input type="number" class="form-control" ng-model="member.beneficiary.age">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-lg-2">Address</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
												placeholder="Default textarea" ng-model="member.beneficiary.address"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number</label>
										<div class="col-md-10">
											<input class="form-control" type="text" ng-model="member.beneficiary.telephoneNumber">
										</div>
									</div>
                                    
									<div class="form-group">
										<label class="control-label col-md-2">Telephone Number(Mobile)</label>
										<div class="col-md-10">
											<input class="form-control" type="tel" ng-model="member.beneficiary.mobileTel">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Occupation</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.occupation">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Revenue/Month</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.revenue">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Relationship</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="member.beneficiary.relationship">
										</div>
									</div>
								</fieldset>

								<div class="text-right">
									<button type="submit" class="btn btn-primary">Update <i
											class="icon-arrow-right14 position-right"></i>
									</button>
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
					</div>
					
	</jsp:attribute>

</welfare:staffTemplate>