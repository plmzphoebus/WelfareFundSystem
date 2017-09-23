<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Staff">
	<jsp:attribute name="allStaff">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="allStaffCtrl">						

						<!-- Basic datatable -->
					<div class="panel panel-flat">                        
                        <!-- Colored tabs -->
                    <div class="panel-body">    
					   <div class="row">
						  <div class="col-md-12">
								<h4>จัดการพนักงาน</h4>
                            </div>
                        </div>
                        <div class="tab-content">                               
				                
				                    <table
							class="table datatable table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ลำดับที่</th>
                                                <th>อีเมล</th>
                                                <th>ชื่อ - นามสกุล</th>
                                                <th>ชื่อผู้ใช้</th>
                                                <th>Action</th>        
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="staff in staffs" on-finish-render="ngRepeatFinished">
                                                <td>{{$index+1}}</td>
                                                <td>{{staff.email}}</td>
                                                <td>{{staff.firstName}} {{staff.lastName}} </td>
                                                <td>{{staff.userName}}</td>                             
                                                <td class="text-center">
                                                    <a href="editStaff.jsp?staffId={{staff.user}}">แก้ไข</a> 
                                                    <a href="#" ng-click="deleteStaff(staff.user)" class="text-danger">ลบ</a>
                                                    <br>
                                                    <a ng-if="staff.user == ${sessionScope.userLogin.user }" href="changePasswordStaff.jsp?staffId={{staff.user}}">เปลี่ยนรหัสผ่าน</a> 
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

				            </div>
                        </div>						
					</div>
						

          </div>
       
	</jsp:attribute>
</welfare:staffTemplate>