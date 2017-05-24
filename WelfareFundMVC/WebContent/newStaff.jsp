<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="New Staff">
	<jsp:attribute name="newStaff">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="newStaffCtrl">
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
                                        
                                        <form class="form-horizontal" action="#" name="myForm">
								<fieldset class="content-group">
									<legend class="text-bold">เพิ่มพนักงานใหม่</legend>
									<div class="form-group">
										<label  class="control-label col-lg-2">หน้าที่</label>
										<div class="col-lg-10">
											<select ng-model="data.role.role" class="form-control" id="roleSelect" required>
												<option ng-repeat="role in roles" value="{{role.role}}">{{role.roleName}}</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">ตำแหน่งงาน</label>
										<div class="col-lg-10">
											<input type="text" id="position" class="form-control" ng-model="data.position" placeholder="ตำแหน่งงาน" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">ชื่อ</label>
										<div class="col-lg-10">
											<input type="text" id="firstname" class="form-control" ng-model="data.firstName" placeholder="ชื่อจริง" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">นามสกุล</label>
										<div class="col-lg-10">
											<input type="text" id="lastname" class="form-control" ng-model="data.lastName" placeholder="นามสกุล" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">เบอร์โทรศัพท์</label>
										<div class="col-lg-10">
											<input type="text" id="telephoneNumber" class="form-control" ng-model="data.telephoneNumber" placeholder="เบอร์โทรศัพท์" onkeypress="return isNumberKey(event)" maxlength="10" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">อีเมล</label>
										<div class="col-lg-10">
											<input type="email" id="email" class="form-control" ng-model="data.email" placeholder="อีเมล" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">ชื่อผู้ใช้</label>
										<div class="col-lg-10">
											<input type="text" id="username" class="form-control" ng-model="data.userName" placeholder="ชื่อผู้ใช้" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">รหัสผ่าน</label>
										<div class="col-lg-10">
											<input type="password" id="password" class="form-control" ng-model="data.password" placeholder="รหัสผ่าน" required>
										</div>
									</div>
									
									<div class="form-group">
										<label  class="control-label col-lg-2">ยืนยันรหัสผ่าน</label>
										<div class="col-lg-10">
											<input type="password" id="confirmPassword" class="form-control" ng-model="confirmPassword" placeholder="ยืนยันรหัสผ่าน" required>
											<div id="errorText" class="text-danger"></div>
										</div>
									</div>                         
                                    
                                    
								</fieldset>

								<div class="text-right">
									<button type="button" ng-disabled="myForm.$invalid" id="saveStaff" class="btn btn-primary" ng-click="saveStaff()">บันทึก <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
		<script>
		function isNumberKey(evt){
    	    var charCode = (evt.which) ? evt.which : event.keyCode
    	    if (charCode > 31 && (charCode < 48 || charCode > 57))
    	        return false;
    	    return true;
    	}
        $('#password, #confirmPassword').on('keyup', function () {
            if ($('#password').val() == $('#confirmPassword').val()) {
                $('#errorText').html('');
            } else 
                $('#errorText').html('กรุณากรอกหรหัสผ่านให้ตรงกัน');
            
        });
		</script>
	</jsp:attribute>
</welfare:staffTemplate>