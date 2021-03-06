<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Members">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="allMemberCtrl" >
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i> สมาชิกทั้งหมด</h5>
							<div class="heading-elements">
								<a class="btn btn-primary" href="getMemberExcelFile.do" target="blank">ส่งออกไฟล์ Excel </a>
								<button class="btn btn-success" ng-click="toggleShow()">นำเข้าไฟล์ Excel </button>
		                	</div>
						</div>

						<div class="row" ng-show="showUploadFile">
							<div class="col-md-6 col-md-offset-3">
								<div class="form-group">
							<label class="control-label col-lg-2"></label>
							<div class="col-lg-10">
								<input type = "file" file-model="myFile" id="fileUpload" onchange="checkFile()" class="form-control">
								<span class="text-danger" id="warningText" style="display:none;">กรุณาเลือกไฟล์นามสกุล xls หรือ xlsx เท่านั้น</span>
							</div>
						</div>
						<div class="form-group">
						
							<div class="col-lg-10 col-md-offset-2">
								<button type="button" class="btn btn-primary  pull-right" id="uploadfileBTN" disabled ng-click="uploadFile()">
							อัพโหลด<i class="icon-arrow-right14 position-right"></i>
							</button>
							</div>
							
						</div>
							</div>
						</div>
						<table class="table datatable table-hover table-bordered">
							<thead>
								<tr>
                                    <th width="12.5%">ลำดับที่</th>
									<th width="12.5%">ชื่อ - นามสกุล</th>
                                    <th width="11%">ชุมชน</th>
									<th width="12.5%">เบอร์โทรศัพท์</th>
									<th width="14%">วันที่สมัคร</th>
                                    <th width="15%">ประเภทการชำระเงิน</th>
									<th width="10%" class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="member in members" on-finish-render="ngRepeatFinished">
                                    <td>{{$index+1}}</td>
									<td><a href="memberDetail.jsp?id={{member.memberId}}&acid={{member.account.accountId}}" id="viewMember{{member.memberId}}">{{member.firstName}} {{member.lastName}}</a></td>
                                    <td>{{member.community.communityName}}</td>
									<td>{{member.mobileTel}}</td>									
									<td>{{member.entranceDate | date:"dd-MM-yyyy"}}</td>
                                    <td>{{member.preferPayment}}</td>
									<td class="text-center">
										<ul class="icons-list">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													<i class="icon-menu9"></i>
												</a>

												<ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a
											href="memberDetail.jsp?id={{member.memberId}}&acid={{member.account.accountId}}">View</a></li>
													<li><a href="#">Delete</a></li>													
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						
					<script>

			        function checkFile(){
			        	var file = $('#fileUpload').get(0).files[0];
			        	console.log(file);
			        	if(file.type == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" || file.type == "application/vnd.ms-excel"){
			        		$("#warningText").hide();
			        		$("#uploadfileBTN").prop('disabled', false);
			        	}else{
			        		$("#warningText").show();
			        		$("#uploadfileBTN").prop('disabled', true);			        		
			        	}
			        }
					</script>
					</div>
        
					 
	</jsp:attribute>
</welfare:staffTemplate>