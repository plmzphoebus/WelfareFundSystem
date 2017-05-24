<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Edit Community's Information">
	<jsp:attribute name="allCommunity">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="editCommunityCtrl">
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
                                        
                                        <form class="form-horizontal" name="myForm">
								<fieldset class="content-group">
									<legend class="text-bold">แก้ไขข้อมูลชุมชน : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-3">ชื่อชุมชน</label>
										<div class="col-lg-8">
										<input type="hidden" ng-model="community.communityId" required>
											<input type="text" class="form-control" ng-model="community.communityName" placeholder="ชื่อชุมชน" required>
										</div>
									</div>                         
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="button" class="btn btn-primary" ng-disabled="myForm.$invalid" ng-click="saveCommunity()">บันทึก <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
	</jsp:attribute>
</welfare:staffTemplate>