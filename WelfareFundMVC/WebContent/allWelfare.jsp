<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Welfares">
	<jsp:attribute name="allWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="allWelfareCtrl">						

						<div class="panel panel-flat">
							<div class="panel-heading">
								<h5 class="panel-title"> <i class="icon-users2"></i> All Welfares</h5>
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
	                                    <th width="12%">Welfare Id</th>
										<th width="15%">Welfare Name</th>
										<th width="65%">Description</th>                                    
										<th width="8%" class="text-center">Actions</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="welfare in welfares">
	                                    <td>{{welfare.welfareId}}</td>
										<td>{{welfare.welfareName}}</td>
										<td>{{welfare.description}}</td>                                    
										<td class="text-center">
											<ul class="icons-list">
												<li class="dropdown">
													<a href="#" class="dropdown-toggle" data-toggle="dropdown">
														<i class="icon-menu9"></i>
													</a>
	
													<ul class="dropdown-menu dropdown-menu-right">
														<li><a data-toggle="modal" data-target="#editWelfare">Edit</a></li>
														<li><a href="#">Delete</a></li>													
													</ul>
												</li>
											</ul>
										</td>
									</tr>		
								</tbody>
							</table>
						</div>
						<!-- Modal content-->
						<div id="editWelfare" class="modal fade" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-teal-600">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Edit Welfare's information</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                      <form class="form-horizontal" action="#">
								<fieldset class="content-group">
									<legend class="text-bold">Edit Welfare Form : กองทุนสวัสดิการชุมชนตำบลธาตุเชิงชุม</legend>

									<div class="form-group">
										<label class="control-label col-lg-2">Welfare Name</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" name="welfarename"
											placeholder="Welfare Name">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Description</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control"
											placeholder="Welfare Description"></textarea>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Condition</label>
										<div class="col-lg-3">
											<input type="number" class="form-control"
											placeholder="Amount of Day" min="180" value="180">
										</div>
                                        <div class="col-lg-2">
											<select class="form-control">
                                            <option selected>Days</option>
                                            <option>Years</option>
                                            </select>
										</div>
											
										
                                        <div class="col-lg-3">
											<input type="number" class="form-control"
											placeholder="Amount of Money">
										</div>
                                         <label
										class="control-label col-lg-1">Baht</label>
                                        <div class="col-lg-1">
											<button type="button" class="btn btn-success btn-circle"
											ng-click="addCondition()">
											<i class="icon  icon-plus3"></i>
										</button>
										</div>
                                       
									</div>
                                    <div id="MoreCondition"></div>
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="submit" class="btn btn-primary">Update <i
										class="icon-arrow-right14 position-right"></i>
								</button>
								</div>
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
					</div>
		 <script>
            function addCondition(){
                var id = Math.floor((Math.random() * 10000) + 1);
                var str = "<div id=\"con"+id+"\" class=\"form-group\"><label class=\"control-label col-lg-2\">&nbsp;</label><div class=\"col-lg-3\"><input type=\"number\" class=\"form-control\" placeholder=\"Amount of Day\" min=\"180\"></div><div class=\"col-lg-2\"><select class=\"form-control\"><option selected>Days</option><option>Years</option></select></div><div class=\"col-lg-3\"><input type=\"number\" class=\"form-control\" placeholder=\"Amount of Money\"></div><label class=\"control-label col-lg-1\">Baht</label><div class=\"col-lg-1\"><button type=\"button\" class=\"btn btn-danger btn-circle\" onclick=\"deleteCondition("+id+")\"><i class=\"icon  icon-minus3\"></i></button></div></div>"
                
                $("#MoreCondition").append(str);
            }
            function deleteCondition(id){
                $("#con"+id).remove();
            }
        </script>
	</jsp:attribute>
</welfare:staffTemplate>