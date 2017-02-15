<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Welfares">
	<jsp:attribute name="allWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="allWelfareCtrl">						

						<div class="panel panel-flat">
							<div class="panel-heading">
								<h5 class="panel-title"> <i class="icon-users2"></i> จัดการข้อมูลสวัสดิการ</h5>
					<br>
	                                
								<div class="heading-elements">
									<ul class="icons-list">
				                		
				                		<li><a data-action="reload"></a></li>
				                		
				                	</ul>
			                	</div>
							</div>
	
	
							<table class="table datatable-basic table-hover table-bordered">
								<thead>
									<tr>
	                                    <th width="12%">ลำดับที่</th>
										<th width="15%">ชื่อสวัสดิการ</th>
										<th width="65%">รายละเอียด</th>                                    
										<th width="8%" class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="welfare in welfares">
	                                    <td>{{$index+1}}</td>
										<td>{{welfare.welfareName}}</td>
										<td>{{welfare.description}}</td>                                    
										<td class="text-center">
											<ul class="icons-list">
												<li class="dropdown">
													<a href="#" class="dropdown-toggle" data-toggle="dropdown">
														<i class="icon-menu9"></i>
													</a>
	
													<ul class="dropdown-menu dropdown-menu-right">
														<li><a href="editWelfare.jsp?welfareId={{welfare.welfareID}}">Edit</a></li>
														<li><center><i class="icon-trash" style="color:red;cursor:pointer;" ng-click="deleteWelfare(welfare.welfareID)"></i></center></li>																									
													</ul>
												</li>
											</ul>
										</td>
									</tr>		
								</tbody>
							</table>
						</div>
						
					</div>
	</jsp:attribute>
</welfare:staffTemplate>