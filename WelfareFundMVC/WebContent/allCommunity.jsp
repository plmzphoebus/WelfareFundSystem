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
                                                                <li><a
														data-toggle="modal" data-target="#editCommunity{{coomunity.communityId}}">Edit</a></li>
                                                                <li><center><i class="icon-trash" style="color:red;cursor:pointer;" ng-click="deleteCommunity(community.communityId)"></i></center></li>													
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </td>
                                                <!-- Modal content-->
       <div id="editCommunity{{coomunity.communityId}}" class="modal fade" role="dialog">
          <div class="modal-dialog">
					            <div class="modal-content">
					              <div class="modal-header bg-teal-600">
					                <button type="button" class="close"
							data-dismiss="modal">&times;</button>
					                <h4 class="modal-title">Edit Welfare's information</h4>
					              </div>
					              <div class="modal-body">
					                  <div class="row">
					                      <form class="form-horizontal" action="#">
					                      	
													<fieldset class="content-group">
														<div class="form-group">
															<label class="control-label col-lg-3">Community Name</label>
															<div class="col-lg-9">
															<input type="hidden" value="{{community.communityId}}" ng-init="community.communityId" ng-model="data.communityId">
																<input type="text" class="form-control"
												 ng-init="community.communityName" ng-model="data.communityName" placeholder="Community Name">
															</div>
														</div>
					                                    
					                                    <div class="form-group">
                            <label class="control-label col-lg-3">&nbsp;</label>
                                <div class="col-lg-9">
                                    <input type="button"
										class="btn btn-success" value="Save">
                                </div>
                      </div>
													</fieldset>
											
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
                                            </tr>
                                        </tbody>
                                    </table>

				            </div>
                        </div>						
					</div>
						

          </div>
       
	</jsp:attribute>
</welfare:staffTemplate>