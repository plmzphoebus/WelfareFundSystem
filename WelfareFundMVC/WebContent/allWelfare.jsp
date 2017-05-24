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
	
	
							<table class="table datatable table-hover table-bordered">
								<thead>
									<tr>
	                                    <th width="12%">ลำดับที่</th>
										<th width="15%">ชื่อสวัสดิการ</th>
										<th width="55%">รายละเอียด</th>                                    
										<th class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="welfare in welfares" on-finish-render="ngRepeatFinished">
	                                    <td>{{$index+1}}</td>
										<td><a href="welfareDetail.jsp?welfareId={{welfare.welfareID}}">{{welfare.welfareName}}</a></td>
										<td>{{welfare.description}}</td>                                    
										<td class="text-center">
											<a href="editWelfare.jsp?welfareId={{welfare.welfareID}}">แก้ไข</a> 
											<a href="#" ng-click="deleteWelfare(welfare.welfareID)" class="text-danger">ลบ</a>
										</td>
									</tr>		
								</tbody>
							</table>
						</div>
						
					</div>
	</jsp:attribute>
</welfare:staffTemplate>