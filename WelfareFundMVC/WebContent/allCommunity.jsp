<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Community">
	<jsp:attribute name="allCommunity">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp">						

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
				                
				                    <table class="table datatable-basic table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Community Id</th>
                                                <th>Community Name</th>
                                                <th>Action</th>        
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>C1001</td>
                                                <td>Taddum</td>                             
                                                <td class="text-center">
                                                    <ul class="icons-list">
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                                <i class="icon-menu9"></i>
                                                            </a>

                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a data-toggle="modal" data-target="#editCommunity">Edit</a></li>
                                                                <li><a href="#">Delete</a></li>													
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>C1002</td>
                                                <td>Taddum2</td>                               
                                                <td class="text-center">
                                                    <ul class="icons-list">
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                                <i class="icon-menu9"></i>
                                                            </a>

                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a data-toggle="modal" data-target="#editCommunity">Edit</a></li>
                                                                <li><a href="#">Delete</a></li>													
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>C1003</td>
                                                <td>Taddum3</td>                            
                                                <td class="text-center">
                                                    <ul class="icons-list">
                                                        <li class="dropdown">
                                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                                <i class="icon-menu9"></i>
                                                            </a>

                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a data-toggle="modal" data-target="#editCommunity">Edit</a></li>
                                                                <li><a href="#">Delete</a></li>													
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
						<!-- Modal content-->
					            <div class="modal-content">
					              <div class="modal-header bg-teal-600">
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					                <h4 class="modal-title">Edit Welfare's information</h4>
					              </div>
					              <div class="modal-body">
					                  <div class="row">
					                      <form class="form-horizontal" action="#">
													<fieldset class="content-group">
														<div class="form-group">
															<label class="control-label col-lg-2">Community Name</label>
															<div class="col-lg-10">
																<input type="text" class="form-control" name="welfarename" placeholder="Welfare Name">
															</div>
														</div>                                    
					                                    <div id="MoreCondition"></div>
					                                    
					                                    
													</fieldset>
					
													<div class="text-right">
														<button type="submit" class="btn btn-primary">Submit <i class="icon-arrow-right14 position-right"></i></button>
													</div>
												</form>
					                  </div>
					                    
					              </div>
					              <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					              </div>
					            </div>

          </div>
        </div>
					</div>
	</jsp:attribute>
</welfare:staffTemplate>