<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="deneme" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <link href="Styles/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/css/signin.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
          top: 0px;
          left: 0px;
      }
      </style>
  
</head>
<body >
    <div class="container">
  
      
   <form class="form-signin" runat="server" role="form">
        <h4 class="form-signin-heading">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/logo.jpg" />
       </h4>
       <h4 class="form-signin-heading">
           Giresun Üniversitesi BİDB </h4>
              <h5 class="form-signin-heading">
            Giriş Yapın. </h5>
       <asp:TextBox ID="kullanıcı_txt" class="form-control"  
           placeholder="Kullanıcı Adı" required autofocus  runat="server"></asp:TextBox>
       <asp:TextBox ID="psw_txt" class="form-control" placeholder="Şifre" required TextMode="Password"
           runat="server"></asp:TextBox>
        <div class="checkbox">
           
          <label>
           <asp:CheckBox ID="remember_check" value="remember-me" runat="server" />Remember Me
          </label>
            
            
        </div>
  
        <asp:Button  class="btn btn-lg btn-primary btn-block" ID="Button1" 
           runat="server" Text="Giriş" onclick="Button1_Click" Height="42px" 
           Width="146px" />
           
    
      </form> 
    </div>

  
</body>
</html>
