<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Print Receipt">
	<jsp:attribute name="content">
		<div class="row">
        <div class="col-md-10 col-md-offset-9">
            <div class="form-group">
                    <label class="control-label col-lg-0 text-bold">เลขที่ใบเสร็จ</label>
                    <label class="control-label">27/2559</label>
                
            </div>
            
        </div>                                            
    </div>
    <div class="row print">
        <div class="col-md-6 col-md-offset-2">
            <div class="form-group">
                    <label class="control-label col-lg-0 text-bold">กลุ่มออมทรัพย์</label>
                    <label class="control-label"> ชุมชนธาตุดุม ต.ธาตุเชิงชุม</label>
                
            </div>
            <div class="form-group">
                    <label class="control-label col-lg-0 text-bold">ได้รับเงินจาก</label>
                <label class="control-label">นายชินวัตร รุ่งตระกูลชัย (ชุมชนธาตุดุม)</label>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-0 text-bold">เลขที่สมาชิก</label>
                <label class="control-label ">2356125412</label>
                <label class="control-label col-lg-0 text-bold">วันที่</label>
                <label class="control-label ">27 กันยายน 2559</label>            
            </div>
        </div>                                            
    </div>
     <div class="row">
        <div class="col-md-8 col-md-offset-2">
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th class="text-center">List</th>
                <th class="text-center">Baht</th>
                <th class="text-center">Satang</th>
            </tr>
        </thead>
        <tbody>
            <tr>              
                <td>เงินสะสม ก.ย.59 - ส.ค. 60</td>
                <td class="text-center">365</td>
                <td class="text-center"></td>                
            </tr>
            <tr>              
                <td>เงินกู้ชำระคืน</td>
                <td class="text-center"></td>
                <td class="text-center"></td>                
            </tr>
            <tr>              
                <td>เงินถอนจากธนาคาร</td>
                <td class="text-center"></td>
                <td class="text-center"></td>                
            </tr>
            <tr>              
                <td>ค่าธรรมเนียม รายใหม่</td>
                <td class="text-center">20</td>
                <td class="text-center"></td>      
            </tr>
            <tr>              
                <td>(สามร้อยแปดสิบห้าบาท) <label class="control-label text-bold pull-right">รวมเงิน</label> </td>
                <td class="text-center">385</td>
                <td class="text-center"></td>      
            </tr>
        </tbody>
    </table>
            <br>
            <div class="form-group">
                    <label class="control-label col-lg-0 text-bold">ผู้รับเงิน</label>
                    <label class="control-label"> รัตนา ฉะโน</label>
                
            </div>
            <br>
            <button onclick="myFunction()" class="btn btn-success pull-right">Print Receipt</button>
         </div>
    </div>



<script>
function myFunction() {
    window.print();
}
</script>
	</jsp:attribute>
</welfare:staffTemplate>