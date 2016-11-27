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
								<h4>All Community</h4>
                            </div>
                        </div>
                        <div class="tab-content">                               
				                
				                    <table
							class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Community Id</th>
                                                <th>Community Name</th>
                                                <th>Action</th>        
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="community in communities">
                                                <td>{{community.communityId}}</td>
                                                <td>{{community.communityName}}</td>                             
                                                <td class="text-center">
                                                    <ul
											class="icons-list">
                                                        <li
												class="dropdown">
                                                            <a href="#"
												class="dropdown-toggle" data-toggle="dropdown">
                                                                <i
													class="icon-menu9"></i>
                                                            </a>

                                                            <ul
													class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="editCommunity.jsp?communityId={{community.communityId}}">Edit</a></li>                                                                
                                                                <li><center><i class="icon-trash" style="color:red;cursor:pointer;" ng-click="deleteCommunity(community.communityId)"></i></center></li>													
                                                            </ul>
                                                        </li>
                                                    </ul>
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