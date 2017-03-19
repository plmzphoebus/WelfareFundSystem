<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Members">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" >
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i> All Members</h5>
							<div class="heading-elements">
								<a class="btn btn-primary" href="getMemberExcelFile.do" target="blank">ส่งออกไฟล์ Excel </a>
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
							<tbody ng-controller="allMemberCtrl">
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
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>													
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
	</jsp:attribute>
</welfare:staffTemplate>