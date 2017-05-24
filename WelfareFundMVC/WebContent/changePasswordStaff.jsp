<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Edit Staff's Information">
	<jsp:attribute name="allStaff">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat" ng-app="myApp" ng-controller="editStaffCtrl">
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
									<legend class="text-bold">เปลี่ยนรหัสผ่านของพนักงาน</legend>
									
									<div class="form-group">
										<label  class="control-label col-lg-2">ชื่อผู้ใช้</label>
										<div class="col-lg-10">
											<input type="text" id="username" class="form-control" ng-model="data.userName" placeholder="ชื่อผู้ใช้" disabled>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">รหัสผ่านเก่า</label>
										<div class="col-lg-10">
											<input type="password" id="oldpassword" class="form-control" ng-model="oldPassword" placeholder="รหัสผ่านเก่า" required>
											<span id="showErrorMsg" class="text-danger"></span>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">รหัสผ่านใหม่</label>
										<div class="col-lg-10">
											<input type="password" id="newPassword" class="form-control" ng-model="newPassword" placeholder="รหัสผ่านใหม่" required>
										</div>
									</div>
									<div class="form-group">
										<label  class="control-label col-lg-2">ยืนยันรหัสผ่านใหม่</label>
										<div class="col-lg-10">
											<input type="password" id="confirmNewPassword" class="form-control" ng-model="confirmNewPassword" placeholder="ยืนยันรหัสผ่านใหม่" required>
											<span id="showMsg" class="text-danger"></span>
										</div>
									</div>
								</fieldset>

								<div class="text-right">
									<button type="button" id="saveStaff" ng-disabled="myForm.$invalid" class="btn btn-primary" ng-click="changePassword()">บันทึก <i class="icon-arrow-right14 position-right"></i></button>
								</div>
							</form>
                                    </div>
                                </div>
                            </div>
                            
                        </div>		
		</div>
		<script>
		$('#newPassword, #confirmNewPassword').on('keyup', function () {
            if ($('#newPassword').val() == $('#confirmNewPassword').val()) {
                $('#showMsg').html('');
                checkform();
               
            } else 
                $('#showMsg').html('กรุณากรอกรหัสผ่านให้ตรงกัน');
            checkform();
            
        });
		</script>
	</jsp:attribute>
</welfare:staffTemplate>