<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aspnetHome.aspx.cs" Inherits="MegaSummitInventorySystem.aspnetHome" %>

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
    <link rel="stylesheet" href="js/iehacks.min.css" type="text/css">
<![endif]-->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]>
    <script type="text/javascript" src="hjs/vendor/selectivizr.js"></script>
<![endif]-->
</head>
<body>
    <div id="main" class="mainmenu">
	<div class="ym-wrapper">    	   	
        <div class="ym-wbox">
        	<div class="holder">
            	<a href="aspnetHome.aspx" class="logo"><img src="image/main-logo.jpg" width="160" height="88" alt="Megasummit" /></a>
                <img src="image/main-menu.jpg" width="160" height="88" alt="" /> 
                
                <ul class="list ym-clearfix">
                    <li class=""><a href="aspnetCompany.aspx" class="item company">Company</a></li>
                    <li class=""><a href="aspnetCustomer.aspx" class="item customers">Customers</a></li>
                    <li class=""><a href="#" class="item suppliers">Suppliers</a></li>
                    <li class=""><a href="#" class="item employees">Employees</a></li>
                    <li class=""><a href="aspnetProduct.aspx" class="item products">Products</a></li>
                    <li class=""><a href="#" class="item banking">Banking</a></li>
                    <li class=""><a href="#" class="item accounts">Accounts</a></li>
                    <li class=""><a href="#" class="item accessories">Accessories</a></li>
                    <li class=""><a href="#" class="item reports">Reports</a></li>
                </ul>
                <div class="ym-ie-clearing">&nbsp;</div>             
            </div>            
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
