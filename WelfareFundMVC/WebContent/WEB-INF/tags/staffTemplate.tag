<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true" rtexprvalue="true"%>
<%@ attribute name="indexpage" required="false" rtexprvalue="true"%>
<%@ attribute name="allMember" required="false" rtexprvalue="true"%>
<%@ attribute name="newMember" required="false" rtexprvalue="true"%>
<%@ attribute name="newWelfare" required="false" rtexprvalue="true"%>
<%@ attribute name="allWelfare" required="false" rtexprvalue="true"%>
<%@ attribute name="allCommunity" required="false" rtexprvalue="true"%>
<%@ attribute name="newCommunity" required="false" rtexprvalue="true"%>
<%@ attribute name="allStaff" required="false" rtexprvalue="true"%>
<%@ attribute name="newStaff" required="false" rtexprvalue="true"%>
<%@ attribute name="content" fragment="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${title}</title>
        <!-- Global stylesheets -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
        <link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="assets/css/core.css" rel="stylesheet" type="text/css">
        <link href="assets/css/components.css" rel="stylesheet" type="text/css">
        <link href="assets/css/colors.css" rel="stylesheet" type="text/css">
        <link href="assets/style.css" rel="stylesheet" type="text/css">
        <!-- /global stylesheets -->
        <!-- Core JS files -->
        <script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
        <script type="text/javascript" src="assets/js/angular.min.js"></script>
        <script type="text/javascript" src="assets/js/canvasjs.min.js"></script>
        <script type="text/javascript" src="assets/js/app.js"></script>
        <!-- /core JS files -->
        <!-- Theme JS files -->
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
        <script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>
        <script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
        <script type="text/javascript" src="assets/js/core/app.js"></script>
        <!-- /theme JS files -->
    </head>
    <body>
        <!-- Main navbar -->
        <div class="navbar navbar-default header-highlight">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html" style="color:white;">
                    ระบบกองทุนสวัสดิการตำบลธาตุเชิงชุม
                </a>
                <ul class="nav navbar-nav visible-xs-block">
                    <li>
                        <a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a>
                    </li>
                    <li>
                        <a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a>
                    </li>
                </ul>
            </div>
            <div class="navbar-collapse collapse" id="navbar-mobile">
                <ul class="nav navbar-nav">
                    <li>
                        <a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a>
                    </li>
                    
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown dropdown-user">
                        <a class="dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/images/placeholder.jpg" alt="">
                            <span>Staff</span>
                            <i class="caret"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="#"><i class="icon-user-plus"></i> My profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#"><i class="icon-cog5"></i> Account settings</a>
                            </li>
                            <li>
                                <a href="login_simple.html"><i class="icon-switch2"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /main navbar -->
        <!-- Page container -->
        <div class="page-container">
            <!-- Page content -->
            <div class="page-content">
                <!-- Main sidebar -->
                <div class="sidebar sidebar-main">
                    <div class="sidebar-content">
                        <!-- User menu -->
                        <div class="sidebar-user">
                            <div class="category-content">
                                <div class="media">
                                    <a href="#" class="media-left">
                                        <img src="assets/images/placeholder.jpg" class="img-circle img-sm" alt="">
                                    </a>
                                    <div class="media-body">
                                        <span class="media-heading text-semibold">Staff</span>
                                        <div class="text-size-mini text-muted">
                                            staff
</div>
                                    </div>
                                    <div class="media-right media-middle">
                                        <ul class="icons-list">
                                            <li>
                                                <a href="#"></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /user menu -->
                        <!-- Main navigation -->
                        <div class="sidebar-category sidebar-category-visible">
                            <div class="category-content no-padding">
                                <ul class="navigation navigation-main navigation-accordion">
                                    <!-- Main -->
                                    <li class="navigation-header">
                                        <span>เมนูหลัก</span> 
                                        <i class="icon-menu" title="Main Menu"></i>
                                    </li>
                                    <li class="${indexpage }">
                                        <a href="index.jsp" id="index"><i class="icon-home4"></i> <span>หน้าแรก</span></a>
                                    </li>
                                    <li>
                                        <a href="#" id="menageMember"><i class="icon-file-text"></i> <span> จัดการสมาชิก</span></a>
                                        <ul>
                                            <li class="${newMember }">
                                                <a href="newMember.jsp" id="addNewMember"><i class=" icon-file-plus"></i>เพิ่มสมาชิกใหม่</a>
                                            </li>
                                            <li class="${allMember }">
                                                <a href="allMember.jsp" id="allMember"><i class="icon-files-empty"></i>ดูสมาชิกทั้งหมด</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- /main -->
                                    <!-- Forms -->
                                    <li>
                                        <a href="#" id="manageWelfare" ><i class="icon-images2"></i> <span>จัดการสวัสดิการ</span></a>
                                        <ul>
                                            <li class="${newWelfare }">
                                                <a href="newWelfare.jsp" id="addnewWelfare"><i class="icon-plus3"></i>เพิ่มสวัสดิการใหม่</a>    
                                            </li>
                                            <li class="${allWelfare }">
                                                <a href="allWelfare.jsp" id="allWelfare"><i class="icon-images3"></i>ดูสวัสดิการทั้งหมด</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" id="manageCommunity"><i class="icon-images2"></i> <span>จัดการชุมชน</span></a>
                                        <ul>
                                            <li class="${newCommunity }">
                                                <a href="newCommunity.jsp" id="addCommunity"><i class="icon-plus3"></i>เพิ่มชุมชนใหม่</a>    
                                            </li>
                                            <li class="${allCommunity }">
                                                <a href="allCommunity.jsp" id="AllCommunity"><i class="icon-images3"></i>ดูชุมชนทั้งหมด</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#" id="manageStaff"><i class="icon-images2"></i> <span>จัดการพนักงาน</span></a>
                                        <ul>
                                            <li class="${newStaff }">
                                                <a href="newStaff.jsp" id="addStaff"><i class="icon-plus3"></i>เพิ่มพนักงานใหม่</a>    
                                            </li>
                                            <li class="${allStaff }">
                                                <a href="allStaff.jsp" id="allStaff"><i class="icon-images3"></i>ดูพนักงานทั้งหมด</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <!-- /page kits -->
                                </ul>
                            </div>
                        </div>
                        <!-- /main navigation -->
                    </div>
                </div>
                <!-- /main sidebar -->
                <!-- Main content -->
                <div class="content-wrapper">
                    <!-- Content area -->
                    <div class="content">
                        <!-- Contents -->
                        <jsp:invoke fragment="content"></jsp:invoke>
                        <!-- Footer -->
                        <div class="footer text-muted">
                            &copy; 2016. 
                            <a href="#">ระบบกองทุนสวัสดิการ</a> by 
                            <a href="#" target="_blank">Popza Studio</a>
                        </div>
                        <!-- /footer -->
                    </div>
                    <!-- /content area -->
                </div>
                <!-- /main content -->
            </div>
            <!-- /page content -->
        </div>
        <!-- /page container -->
        
    </body>
</html>
