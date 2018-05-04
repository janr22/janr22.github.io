<?php 
	session_start(); 

	if (!isset($_SESSION['username'])) {
		$_SESSION['msg'] = "You must log in first";
		header('location: login.php');
	}

	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['username']);
		header("location: login.php");
	}

?>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>Baguio Car Rental</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">
        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">
        <script src="assets/js/chart-master/Chart.js"></script>
    </head>

    <body>
        <section id="container">
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start--><a href="index.html" class="logo"><b>BAGUIO CAR RENTAL</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  notification end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="login.php">Logout</a></li>
                        <?php  if (isset($_SESSION['username'])) : ?>
                            <p>Welcome <strong><?php echo $_SESSION['username']; ?></strong></p>
                            <?php endif ?>
                    </ul>
                </div>
            </header>
            <!--header end-->
            <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <li class="sub-menu">
                            <a href="javascript:;"> <i class="fa fa-desktop"></i> <span>HOME</span> </a>
                        </li>
                        <li class="sub-menu">
                            <a href=""> <i class="fa fa-cogs"></i> <span>Vehicle Management</span> </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;"> <i class="fa fa-cogs"></i> <span>Registered User</span> </a>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center"> Baguio Car Rental
                    <a href="index.html#" class="go-top"> <i class="fa fa-angle-up"></i> </a>
                </div>
            </footer>
            <!--footer end-->
        </section>
        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/js/jquery.sparkline.js"></script>
        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>
        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>
        <!--script for this page-->
        <script src="assets/js/sparkline-chart.js"></script>
        <script src="assets/js/zabuto_calendar.js"></script>
        <script type="application/javascript">
            $(document).ready(function () {
                $("#date-popover").popover({
                    html: true
                    , trigger: "manual"
                });
                $("#date-popover").hide();
                $("#date-popover").click(function (e) {
                    $(this).hide();
                });
                $("#my-calendar").zabuto_calendar({
                    action: function () {
                        return myDateFunction(this.id, false);
                    }
                    , action_nav: function () {
                        return myNavFunction(this.id);
                    }
                    , ajax: {
                        url: "show_data.php?action=1"
                        , modal: true
                    }
                    , legend: [
                        {
                            type: "text"
                            , label: "Special event"
                            , badge: "00"
                    }
                    , {
                            type: "block"
                            , label: "Regular event"
                        , }
                ]
                });
            });

            function myNavFunction(id) {
                $("#date-popover").hide();
                var nav = $("#" + id).data("navigation");
                var to = $("#" + id).data("to");
                console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>
    </body>

    </html>