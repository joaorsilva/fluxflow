<!DOCTYPE html>
<?php
if(isset($area) && $area == "error")
{
    ?>
    {{ content() }}
    <?php
} 
else if(isset($area) && $area == "login")
{
?>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo($this->tag->title . $this->tag->appName) ?></title>

    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/vendors/animate.css/animate.min.css" rel="stylesheet">
<?php
    if(isset($css) && is_array($css))
    {
        foreach($css as $script)
        {
?>
    <link href="<?php echo($script) ?>" rel="stylesheet" />
<?php
        }
    }
?>
    <!-- Custom Theme Style -->
    <link href="/build/css/custom.css" rel="stylesheet">
  </head>

  <body class="login">
  {{ content() }}
    <script src="/vendors/jquery/dist/jquery.min.js"></script>
<?php
    if(isset($js) && is_array($js))
    {
        foreach($js as $cript)
        {
?>
    <script src="<?php echo($cript) ?>"></script>
<?php
        }
    }
?>

  </body>
</html>
<?php
} else {
?>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title><?php echo($this->tag->title . $this->tag->appName) ?></title>

    <!-- Bootstrap -->
    <link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
<?php
    if(isset($css) && is_array($css))
    {
        foreach($css as $script)
        {
?>
    <link href="<?php echo($script) ?>" rel="stylesheet" />
<?php
        }
    }
?>
    <!-- Custom Theme Style -->
    <link href="/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><img src="/img/logo_34x34.png" alt="Flux Flow logo"> <span>Flux Flow</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            {{ elements.getQuickProfile() }}
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            {{ elements.getMenu() }}
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a class="logout" data-toggle="tooltip" data-placement="top" title="Logout" href="javascript:void(0);">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        {{ elements.getTopNavigation() }}
        <!-- /top navigation -->
        {{ content() }}
        <!-- page content -->
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
              Flux Flow (c) 2017 - Licenced under <a href="https://www.gnu.org/licenses/gpl-3.0.en.html" target="_new">GPL v3</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/vendors/nprogress/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="/build/js/custom.min.js"></script>
<?php
    if(isset($js) && is_array($js))
    {
        foreach($js as $cript)
        {
?>
    <script src="<?php echo($cript) ?>"></script>
<?php
        }
    }
?>
    <!-- Layout Scripts -->
    <script src="/js/modules/ff/layout/index.js"></script>
  </body>
</html>
<?php }?>