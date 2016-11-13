<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="All Members">
	<jsp:attribute name="allMember">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="panel panel-flat">
						<div class="panel-heading">
							<h5 class="panel-title"> <i class="icon-users2"></i> All Members</h5>
							<div class="heading-elements">
								<ul class="icons-list">
			                		
			                		<li><a data-action="reload"></a></li>
			                		
			                	</ul>
		                	</div>
						</div>


						<table class="table datatable-basic table-hover table-bordered">
							<thead>
								<tr>
                                    <th width="12.5%">Member Id</th>
									<th width="12.5%">First Name</th>
									<th width="12.5%">Last Name</th>
                                    <th width="11%">Community</th>
									<th width="12.5%">Phone No.</th>
									<th width="14%">Entrance Date</th>
                                    <th width="15%">Payment Type</th>
									<th width="10%" class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr>
                                    <td>593333333</td>
									<td>นางสาววารุณี</td>
									<td>เสนาไชย</td>
                                    <td>กลางธงชัย</td>
									<td>0811111111</td>									
									<td>8 มีนาคม 2559</td>
                                    <td>รายปี</td>
									<td class="text-center">
										<ul class="icons-list">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													<i class="icon-menu9"></i>
												</a>

												<ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a
											href="memberDetail.html">View</a></li>
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>													
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
                                    <td>592222222</td>
									<td>นางสิริรัตน์</td>
									<td>บัณฑิตถาวร</td>
                                    <td>กกส้มโฮง</td>
									<td>0811225413</td>									
									<td>4 พฤภาคม 2559</td>
                                    <td>รายครึ่งปี</td>
									<td class="text-center">
										<ul class="icons-list">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													<i class="icon-menu9"></i>
												</a>

												<ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a
											href="memberDetail.html">View</a></li>
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>													
												</ul>
											</li>
										</ul>
									</td>
								</tr>								
								<tr>
                                    <td>591111111</td>
									<td>นางสาวสมสนุก</td>
									<td>โมทศรี</td>
                                    <td>เอื้ออาทร</td>
									<td>0811111111</td>									
									<td>8 มีนาคม 2559</td>
                                    <td>รายเดือน</td>
									<td class="text-center">
										<ul class="icons-list">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													<i class="icon-menu9"></i>
												</a>

												<ul class="dropdown-menu dropdown-menu-right">
                                                    <li><a
											href="memberDetail.html">View</a></li>
													<li><a href="#">Edit</a></li>
													<li><a href="#">Delete</a></li>													
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>
	</jsp:attribute>
</welfare:staffTemplate>