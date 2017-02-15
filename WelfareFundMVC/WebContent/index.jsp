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
                                                    <button class="btn bg-teal-300 btn-info btn-rounded btn-xs" type="button"> View All </button>
                                                </div>
                                                <h3 class="no-margin">532</h3>
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
                                                    <button class="btn bg-teal-300 btn-info btn-rounded btn-xs" type="button"> View All</button>
                                                </div>
                                                <h3 class="no-margin">1,220</h3>
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
                                                    
                                                    <button class="btn bg-teal-300 btn-info btn-rounded btn-xs" type="button"> View All
</button>
                                                </div>
                                                <h3 class="no-margin">18</h3>
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
							text: "Total members of each community"
						},
						exportFileName: "Total Members of each Community Chart",
						exportEnabled: true,
						animationEnabled: true,
						axisY:{
						       title: "Persons",
						        titleFontSize: 20
						      },
						axisX:{
							title: "Community Name",
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
								text: "Amount of Resceiving Welfare"
							},
							exportFileName: "Amount of Resceiving Welfare Chart",
							exportEnabled: true,
					        animationEnabled: true,
							data: [
							{
								type: "pie",
								showInLegend: true,
								toolTipContent: "{y} - #percent %",
								yValueFormatString: "#,###.## Baht",
								legendText: "{label}",
								dataPoints: data
							}
							]
						});
						chart.render();
			});
			
			
		}
	</script>
	</jsp:attribute>
</welfare:staffTemplate>