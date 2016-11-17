<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Welfare">
	<jsp:attribute name="newWelfare">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="newWelfareCtrl">
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
											<input type="text" class="form-control" ng-model="data.welfareName" placeholder="Welfare Name">
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Description</label>
										<div class="col-lg-10">
											<textarea rows="5" cols="5" class="form-control" ng-model="data.description" placeholder="Welfare Description"></textarea>
										</div>
									</div>
                                    <div class="form-group">
										<label class="control-label col-lg-2">Condition</label>
										<div class="col-lg-3">
											<input type="number" class="form-control" name="amountofDate[]" placeholder="Amount of Day" min="180" value="180">
										</div>
                                        <div class="col-lg-2">
											<select class="form-control">
                                            <option selected>Days</option>
                                            <option>Years</option>
                                            </select>
										</div>
											
										
                                        <div class="col-lg-3">
											<input type="number" class="form-control" name="welfareMoney[]" placeholder="Amount of Money">
										</div>
                                         <label class="control-label col-lg-1">Baht</label>
                                        <div class="col-lg-1">
											<button type="button" class="btn btn-success btn-circle" onclick="addCondition()"><i class="icon  icon-plus3"></i></button>
										</div>
                                       
									</div>
                                    <div id="MoreCondition"></div>
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="button" class="btn btn-primary" ng-click="saveWelfare()">Submit <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
		 <script>
            function addCondition(){
                var id = Math.floor((Math.random() * 10000) + 1);
                var str = "<div id=\"con"+id+"\" class=\"form-group\"><label class=\"control-label col-lg-2\">&nbsp;</label><div class=\"col-lg-3\"><input type=\"number\" class=\"form-control\" name=\"amountofDate[]\" placeholder=\"Amount of Day\" min=\"180\"></div><div class=\"col-lg-2\"><select class=\"form-control\"><option selected>Days</option><option>Years</option></select></div><div class=\"col-lg-3\"><input type=\"number\" class=\"form-control\" name=\"welfareMoney[]\" placeholder=\"Amount of Money\"></div><label class=\"control-label col-lg-1\">Baht</label><div class=\"col-lg-1\"><button type=\"button\" class=\"btn btn-danger btn-circle\" onclick=\"deleteCondition("+id+")\"><i class=\"icon  icon-minus3\"></i></button></div></div>"
                
                $("#MoreCondition").append(str);
            }
            function deleteCondition(id){
                $("#con"+id).remove();
            }
        </script>
	</jsp:attribute>
</welfare:staffTemplate>