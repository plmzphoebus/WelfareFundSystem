<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="welfare" tagdir="/WEB-INF/tags"%>
<welfare:staffTemplate title="Dashboard">
	<jsp:attribute name="indexpage">active</jsp:attribute>
	<jsp:attribute name="content">
		<div class="row">
            <div class="col-lg-12">
                                
                                <div class="row">
                                    <div class="col-lg-4">
                                        <!-- Members online -->
                                        <div class="panel bg-teal-400">
                                            <div class="panel-body text-left">
                                                <div class="heading-elements">
                                                    <a class="btn bg-teal-300 btn-info btn-rounded btn-xs" href="allMember.jsp"> View All </a>
                                                </div>
                                                <h3 class="no-margin" id="allMembersCounter">0</h3>
                                              	สมาชิกทั้งหมด
                                            </div>
                                            <div class="container-fluid">
                                                <div id="members-online"></div>
                                            </div>
                                        </div>
                                        <!-- /members online -->
                                    </div>
                                    <div class="col-lg-4">
                                        <!-- Current server load -->
                                        <div class="panel bg-pink-400">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    <a class="btn bg-teal-300 btn-info btn-rounded btn-xs" href="allCommunity.jsp"> View All</a>
                                                </div>
                                                <h3 class="no-margin" id="allCommunityCounter">0</h3>
                                            	    ชุมชนทั้งหมด
                                            </div>
                                            <div id="server-load"></div>
                                        </div>
                                        <!-- /current server load -->
                                    </div>
                                    <div class="col-lg-4">
                                        <!-- Today's revenue -->
                                        <div class="panel bg-blue-400">
                                            <div class="panel-body">
                                                <div class="heading-elements">
                                                    
                                                    <a class="btn bg-teal-300 btn-info btn-rounded btn-xs" href="allWelfare.jsp"> View All
</a>
                                                </div>
                                                <h3 class="no-margin" id="allWelfareCounter">0</h3>
                                                สวัสดิการทั้งหมด
                                            </div>
                                            <div id="today-revenue"></div>
                                        </div>
                                        <!-- /today's revenue -->
                                    </div>
                                </div>
                               <!-- Chart -->
                                <div class="panel panel-flat">
                                    <div class="panel-heading">
                                        
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                        	<div class="col-md-6">
                                        		<div id="chartContainer" style="height: 400px; width: 100%;"></div>
                                        	</div>
                                        	<div class="col-md-6">
                                        		<div id="pieChart" style="height: 400px; width: 100%;"></div>
                                        	</div>
                                        	<div class="col-md-6">
                                        		<div id="YearlyReport" style="height: 400px; width: 100%;"></div>
                                        	</div>
                                        	<div class="col-md-6">
                                        		<div id="MonthlyReport" style="height: 400px; width: 100%;"></div>
                                        	</div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /latest posts -->
                            </div>
                            
                        </div>
   <script type="text/javascript">
		window.onload = function () {
			$.get( "getTotalMembersChart.do", function( data ) {
				  console.log("chart",data);
				  var chart = new CanvasJS.Chart("chartContainer", {
						title: {
							text: "สมาชิกทั้งหมดในแต่ละชุมชน"
						},
						exportFileName: "สมาชิกทั้งหมดในแต่ละชุมชน",
						exportEnabled: true,
						animationEnabled: true,
						axisY:{
						       title: "จำนวนสมาชิก",
						        titleFontSize: 20
						      },
						axisX:{
							title: "ชื่อชุมชน",
					        titleFontSize: 20
						},
						data: [{
							type: "column",
							dataPoints:data
						}]
					});
					chart.render();
				});
			$.get( "getMoneyReceiveChart.do", function( data ) {
				var chart = new CanvasJS.Chart("pieChart",
						{
							theme: "theme2",
							title:{
								text: "จำนวนเงินที่มอบในแต่ละสวัสดิการ"
							},
							exportFileName: "จำนวนเงินที่มอบในแต่ละสวัสดิการ",
							exportEnabled: true,
					        animationEnabled: true,
							data: [
							{
								type: "pie",
								showInLegend: true,
								toolTipContent: "{y} - #percent %",
								yValueFormatString: "#,###.## บาท",
								legendText: "{label}",
								dataPoints: data
							}
							]
						});
						chart.render();
			});
			var savingFundReport = [];
			var promise = $.get("getSavingYearly.do");
			promise.done(function(response) {
				savingFundReport = response;
				$.get("getReceiveWelfareYearly.do", function(data){
					
					console.log(data);
					for(var index = 0 ; index < data.length ; index++){
						data[index].x = new Date(data[index].x);
					}
					for( var index = 0 ; index < savingFundReport.length; index++){
						savingFundReport[index].x = new Date(savingFundReport[index].x);
					}
					var chart = new CanvasJS.Chart("YearlyReport",
							{

						title:{
							text: "จำนวนเงินที่จ่ายและรับในแต่ละปี",
							fontSize: 30
						},
			                        animationEnabled: true,
						axisX:{

							gridColor: "Silver",
							tickColor: "silver",
							valueFormatString: "YYYY"

						},                        
			                        toolTip:{
			                          shared:true
			                        },
						theme: "theme2",
						axisY: {
							gridColor: "Silver",
							tickColor: "silver"
						},
						legend:{
							verticalAlign: "center",
							horizontalAlign: "right"
						},
						data: [
						{        
							type: "line",
							showInLegend: true,
							lineThickness: 2,
							name: "จำนวนเงินจ่ายสวัสดิการ",
							yValueFormatString: "#,###.## บาท",
							markerType: "square",
							color: "#F08080",
							dataPoints: data
						},
						{        
							type: "line",
							showInLegend: true,
							lineThickness: 2,
							name: "จำนวนเงินฝาก",
							yValueFormatString: "#,###.## บาท",
							markerType: "square",
							color: "#20B2AA",
							dataPoints: savingFundReport
						}
						],
			          legend:{
			            cursor:"pointer",
			            itemclick:function(e){
			              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			              	e.dataSeries.visible = false;
			              }
			              else{
			                e.dataSeries.visible = true;
			              }
			              chart.render();
			            }
			          }
					});

			chart.render();		
				});
			});
			var savingMonthlyReport = [];
			var savingPromise = $.get("getSavingMonthly.do");
			savingPromise.done(function(response) {
				$.get("getReceiveWelfareMonthly.do", function(data){
					savingMonthlyReport = response;
					for( var index = 0 ; index < savingMonthlyReport.length; index++){
						savingMonthlyReport[index].x = new Date(savingMonthlyReport[index].x);
					}
					
					for(var index = 0 ; index < data.length ; index++){
						data[index].x = new Date(data[index].x);
					}
					
					console.log("savingFundMonthlyReport",savingMonthlyReport);
					var chart = new CanvasJS.Chart("MonthlyReport",
							{

						title:{
							text: "จำนวนเงินที่จ่ายและรับในแต่ละเดือน",
							fontSize: 30
						},
			                        animationEnabled: true,
						axisX:{

							gridColor: "Silver",
							tickColor: "silver",
							valueFormatString: "MMM YYYY"

						},                        
			                        toolTip:{
			                          shared:true
			                        },
						theme: "theme2",
						axisY: {
							gridColor: "Silver",
							tickColor: "silver"
						},
						legend:{
							verticalAlign: "center",
							horizontalAlign: "right"
						},
						data: [
						{        
							type: "line",
							showInLegend: true,
							lineThickness: 2,
							name: "จำนวนเงินจ่ายสวัสดิการ",
							yValueFormatString: "#,###.## บาท",
							markerType: "square",
							color: "#F08080",
							dataPoints: data
						},
						{        
							type: "line",
							showInLegend: true,
							lineThickness: 2,
							name: "จำนวนเงินฝาก",
							yValueFormatString: "#,###.## บาท",
							markerType: "square",
							color: "#20B2AA",
							dataPoints: savingMonthlyReport
						}
						],
			          legend:{
			            cursor:"pointer",
			            itemclick:function(e){
			              if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			              	e.dataSeries.visible = false;
			              }
			              else{
			                e.dataSeries.visible = true;
			              }
			              chart.render();
			            }
			          }
					});

			chart.render();	
				});
					
			});
			$("#allMembersCounter").html('<i class="fa fa-spinner fa-spin"></i>');
			$("#allCommunityCounter").html('<i class="fa fa-spinner fa-spin"></i>');
			$("#allWelfareCounter").html('<i class="fa fa-spinner fa-spin"></i>');
			$.get("listMember.do").then(function(memberData){
				$("#allMembersCounter").html(memberData.length);
			},function(){
				$("#allMembersCounter").html('0');
			});
			$.get("listallCommunity.do").then(function(communityData){
				$("#allCommunityCounter").html(communityData.length);
			},function(){
				$("#allCommunityCounter").html('0');
			});
			$.get("listAllWelfare.do").then(function(welfareData){
				$("#allWelfareCounter").html(welfareData.length);
			},function(){
				$("#allWelfareCounter").html('0');
			});
		}
	</script>
	</jsp:attribute>
</welfare:staffTemplate>