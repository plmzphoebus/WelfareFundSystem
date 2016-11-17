<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Community">
	<jsp:attribute name="newCommunity">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="newCommunityCtrl">
					<div class="row">
                            <div class="col-lg-6 col-lg-offset-3">
                                <div class="panel panel-flat">
						          <div class="panel-heading">
							         <div class="heading-elements">
								        <ul class="icons-list">
			                	        </ul>
		                	         </div>
						          </div>
                                    <div class="panel-body">
                                        
                                        <form class="form-horizontal" action="#">
								<fieldset class="content-group">
									<legend class="text-bold">New Community : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">Community Name</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" ng-model="data.communityName" placeholder="Community Name">
										</div>
									</div>                         
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="submit" class="btn btn-primary" ng-click="saveCommunity()">Save <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
	</jsp:attribute>
</welfare:staffTemplate>