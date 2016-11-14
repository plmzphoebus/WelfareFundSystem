<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Welfare">
	<jsp:attribute name="newWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" >
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
									<legend class="text-bold">New Welfare Form : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">Welfare Name</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="welfarename" placeholder="Welfare Name">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Description</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control" placeholder="Welfare Description"></textarea>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Condition</label>
										<div class="col-lg-3">
											<input type="number" class="form-control" placeholder="Amount of Day" min="180" value="180">
										</div>
                                        <div class="col-lg-2">
											<select class="form-control">
                                            <option selected>Days</option>
                                            <option>Years</option>
                                            </select>
										</div>
											
										
                                        <div class="col-lg-3">
											<input type="number" class="form-control" placeholder="Amount of Money">
										</div>
                                         <label class="control-label col-lg-1">Baht</label>
                                        <div class="col-lg-1">
											<button type="button" class="btn btn-success btn-circle" onclick="addCondition()"><i class="icon  icon-plus3"></i></button>
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
                            </div>
                            
                        </div>		
		</div>
	</jsp:attribute>
</welfare:staffTemplate>