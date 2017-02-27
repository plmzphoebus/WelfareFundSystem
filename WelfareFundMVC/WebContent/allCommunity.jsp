<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Community">
	<jsp:attribute name="allCommunity">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="allCommunityCtrl">						

						<!-- Basic datatable -->
					<div class="panel panel-flat">                        
                        <!-- Colored tabs -->
                    <div class="panel-body">    
					   <div class="row">
						  <div class="col-md-12">
								<h4>จัดการชุมชน</h4>
                            </div>
                        </div>
                        <div class="tab-content">                               
				                
				                    <table
							class="table datatable table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ลำดับที่</th>
                                                <th>ชื่อชุมชน</th>
                                                <th>Action</th>        
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="community in communities" on-finish-render="ngRepeatFinished">
                                                <td>{{$index+1}}</td>
                                                <td>{{community.communityName}}</td>                             
                                                <td class="text-center">
                                                    <a href="editCommunity.jsp?communityId={{community.communityId}}">แก้ไข</a> 
                                                    <a href="#" ng-click="deleteCommunity(community.communityId)" class="text-danger">ลบ</a>
                                                    
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