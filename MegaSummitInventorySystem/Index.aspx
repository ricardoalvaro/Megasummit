<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="MegaSummitInventorySystem.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
<title>Megasummit</title>
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="CSS/base.min.css" type="text/css">
<link rel="stylesheet" href="CSS/central.css" type="text/css">
<link rel="stylesheet" href="CSS/changes.css" type="text/css">
<link href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" rel="stylesheet" type="text/css">

<!--[if lte IE 7]>
    <link rel="stylesheet" href="iehacks.min.css" type="text/css">
<![endif]-->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]>
    <script type="text/javascript" src="js/vendor/selectivizr.js"></script>
<![endif]-->
</head>
<body>
    <div id="main" class="login">
	<div class="ym-wrapper">    	   	
        <div class="ym-wbox">
        	<div class="holder">
                <!-- Start of Two Grids -->
                <div class="ym-grid">
                    <div class="pane-left ym-gl">
                        <div class="ym-gbox">
                            <form name="login_form" id="login_form" method="POST" action="http://localhost:8181/megasummit/main/" class="ym-form">
                                <table>
                                    <tbody><tr class="logo">
                                        <td><img src="image/login-logo.jpg" width="118" height="38" alt=""></td>
                                    </tr>
                                    <tr>
                                        <td class="obj"><input type="text" autocorrect="off" spellcheck="false" id="username" name="username" placeholder="Username" class="username fullwidth"></td>
                                    </tr>
                                    <tr>
                                        <td class="obj"><input type="password" autocorrect="off" id="password" name="password" placeholder="Password" class="password fullwidth"></td>
                                    </tr>
                                    <tr class="action">
                                        <td class="obj">
                                        	<div class="action ym-clearfix">
                                            	<div class="float-left">
                                                	<input type="submit" value="OK" class="btn">
                                                </div>
                                                <div class="float-right">
                                                	<input type="reset" value="Cancel" class="btn">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>  
                                    <tr>
                                        <td class="obj">
                                            <a href="http://localhost:8181/megasummit/login/change-password/">Change Password</a>
                                        </td>
                                    </tr>                                                                       
                                </tbody></table>
                            </form>	
                        </div>
                    </div>
                    <div class="pane-right ym-gr">
                        <img src="http://localhost:8181/megasummit/images/login-image.jpg" width="219" height="283" alt="">
                    </div>
                </div>
                <!-- End of Two Grids -->            
            </div>
            <p class="footnote">Developed by <span class="highlight">MegaSummit Steel Distributor</span> © 2017. All rights reserved.</p>	
        </div>
    </div>
</div>
    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
<!--<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.3.min.js"><\/script>')</script>-->
<script src="js/vendor/jquery-1.8.3.min.js"></script>
<script src="js/vendor/jquery.slimscroll.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="js/plugins.js"></script>
<script src="js/vendor/frontend.js"></script>

</body>
</html>
