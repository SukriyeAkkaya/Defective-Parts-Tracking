<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yedek.aspx.cs" Inherits="yedek" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

       <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
   
    <link href="~/Styles/css/bootstrap-theme.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    
    <link href="~/Styles/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/signin.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/metro-bootstrap-responsive.css" rel="stylesheet" type="text/css"  />
    <link href="~/Styles/css/metro-bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="~/Styles/css/metro-bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/metro-bootstrap.min.css" rel="stylesheet" type="text/css"  />
    <script src="~/js/metro.min.js" type="text/javascript"></script>
    <style type="text/css">
        
         .ModalPopupBG
        {
          background-color:#7f8c8d;
          filter: alpha(opacity=30);
          opacity: 0.4;
        
       }
        .eleman
    {
        width:584px;
        height:60px;
        border:1px solid white;
        margin-left:10px;
    }
    #sikayet
    {
         height:133px;
    }
    #baslik
    {
        height:120px;
    }
    #Image1
    {
        float:left;
    }
    .ModalPopupBG
    {
        background-color:#000000;
        filter: alpha(opacity=30);
        opacity: 0.4;
    }

    .HellowWorldPopup
    {
       min-width:300px;
       min-height:150px;
       background-color:#FFFFFF;
    }
      
    #PopupHeader
    {  
       height:25px;
       background-color:#FFFFFF;
       padding:10px;
       border-bottom:1px solid black;
    }
   .myButton {
	-moz-box-shadow: 0px 1px 0px 0px #fff6af;
	-webkit-box-shadow: 0px 1px 0px 0px #fff6af;
	box-shadow: 0px 1px 0px 0px #fff6af;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #ffab23));
	background:-moz-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-webkit-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-o-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-ms-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#ffab23',GradientType=0);
	background-color:#ffec64;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border-radius:5px;
	border:1px solid #ffaa22;
	display:inline-block;
	cursor:pointer;
	color:#333333;
	font-family:arial;
	font-size:15px;
	font-weight:bold;
	padding:7px 27px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffee66;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));
	background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);
	background-color:#ffab23;
}
.myButton:active {
	position:relative;
	top:1px;
}

    #enbas{ height:30px; background-color:White; }
    #main
    {
    border-left:3px solid #95a5a6;
    border-right:3px solid #95a5a6;
    position: absolute;
	left:25%;
	padding-left:0px;
	width:650px;
	background-color:White;
	margin-top:0px;
	margin-bottom:0px;
	height:100%
	}
	.hiza
	{
    position: absolute;
    left:28%;
    display:inline;
            width: 306px;
            height: 24px;
        }
	body
	{
	 margin-top:0px;

	}
   </style>
 </head>

<body background="Styles/body-by-bg.jpg">
   
    <form id="form1"  runat="server">

    <div id="main" >
   

      <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
     
      <div  id="baslik" style="margin-bottom:10px; padding-left:40px; border-bottom:1px solid grey;">
         
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/başlık4.jpg" 
              Height="114px" Width="526px" />
       
      </div>
      <div class="govde" style="padding-left:25px; padding-top:10px;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
                <div class="eleman"> 
                     <asp:Label ID="Label8" runat="server" Text="T.C. No:" Font-Bold="True" 
                         Font-Names="Arial"></asp:Label>
                     <div class="hiza">
                        <asp:TextBox ID="tc_text" runat="server" ontextchanged="tc_text_TextChanged" 
                                     AutoPostBack="True" Height="24px" Width="306px" Font-Size="Medium"></asp:TextBox>
                     </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                      ControlToValidate="tc_text" Display="None" 
                                                      ErrorMessage="Bölüm Alanı Boş Geçilemez" 
                                                      Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2">
                         </ajaxToolkit:ValidatorCalloutExtender>
                </div>
                <div class="eleman">
                     <asp:Label ID="Label2" runat="server" Text="Personel Ad/Soyad :" 
                         Font-Names="Arial"></asp:Label>
                     <div class="hiza">
                     <asp:TextBox ID="p_ad_txt" runat="server" height="24px" width="306px" 
                             Font-Size="Medium" ></asp:TextBox>
                     </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                      ControlToValidate="p_ad_txt" Display="None" 
                                                      ErrorMessage="Bölüm Alanı Boş Geçilemez" 
                                                      Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
                          <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1">
                          </ajaxToolkit:ValidatorCalloutExtender>
                </div>
                <div class="eleman">
                     <asp:Label ID="Label1" runat="server" Text="Personel Birimi :" 
                         Font-Names="Arial" ></asp:Label>
                     <div class="hiza">
                     <asp:DropDownList ID="birimlist" runat="server" height="24px" width="306px" 
                             Font-Size="Medium">
                          
                     </asp:DropDownList>
                     </div>
                </div>
                <div class="eleman">
                     <asp:Label ID="Label9" runat="server" Text="Tel. No:" Font-Names="Arial"></asp:Label>
                     <div class="hiza">
                     <asp:TextBox ID="tel_txt" runat="server" height="24px" width="306px" 
                             Font-Size="Medium"></asp:TextBox> 
                     </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                      ControlToValidate="tel_txt" Display="None" 
                                                      ErrorMessage="Bölüm Alanı Boş Geçilemez" 
                                                      Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
                          <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidator3">
                          </ajaxToolkit:ValidatorCalloutExtender>
                </div>
         </ContentTemplate>
       </asp:UpdatePanel>

      <div class="eleman" style="height: 50px">

          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
               <asp:Label ID="Label3" runat="server" Text="Ürün Modeli :" Font-Names="Arial"></asp:Label>
               <div class="hiza">
               <asp:DropDownList ID="model_list1" runat="server" AutoPostBack="True" 
                       onselectedindexchanged="model_list1_SelectedIndexChanged" height="24px" 
                       width="145px" Font-Size="Medium">
               </asp:DropDownList>
               <asp:DropDownList ID="model_list2" runat="server" AutoPostBack="True"  
                       Visible="False" width="145px" height="24px" Font-Size="Medium"></asp:DropDownList>
              
            </ContentTemplate>
         </asp:UpdatePanel>
        
      </div>
     <div class="eleman" id="sikayet" style="margin-top: 50px">
       <asp:Label ID="Label6" runat="server" Text="Arıza/Şikayet :" Font-Size="13pt" 
             Font-Names="Arial"></asp:Label>
      
       <div class="hiza" >
       <asp:TextBox ID="sikayet_txt" runat="server" Height="100px" TextMode="MultiLine" 
               Width="306px" Font-Size="Medium"></asp:TextBox>
       </div>

             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                         ControlToValidate="p_ad_txt" Display="None" 
                                         ErrorMessage="Bölüm Alanı Boş Geçilemez" 
                                         Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
             <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidator5">
             </ajaxToolkit:ValidatorCalloutExtender>
     </div>
     <div  style="text-align: right;  width: 516px; height: 82px;"> 
       <asp:Button ID="gonder"  class="myButton" runat="server" Font-Bold="True" Text="Gönder" 
             onclick="gonder_Click1" Font-Size="Small" 
             UseSubmitBehavior="False" />
       </div>
     <div class="eleman" style="height:auto;">
     
      <asp:Label ID="lbl" runat="server" Text=" " Visible="True"></asp:Label>
     <div id="border">
      <asp:Panel ID="Panel1"  CssClass="modalPopup"  runat="server">
        
                  <div id="Div1" runat="server" >
  <div class="modal-dialog"  style="width:400px;" >
    <div class="modal-content" >
      <div class="modal-header" >
    
     
                        
        <button type="button" id="btnOkay" runat="server" class="close" ><span>&times;</span><span class="sr-only">Close</span></button>
      
      </div>
      <div class="modal-body" style="text-align:justify; margin-left: 30px; margin-right: 20px;">
          <asp:Image ID="Image2" runat="server" ImageUrl="~/Styles/danismanlik.jpg" Height="40" Width="40" />   
         <asp:Label ID="id_lbl" runat="server" Text="" Font-Size="Medium" ></asp:Label>
      </div>
       <div class="modal-footer" >
        
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
               
      </asp:Panel>
 

        <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="lbl" PopupControlID="Panel1"   
            popupdraghandlecontrolid="Panel1" drag="true"  X="100" Y="100"
           OkControlID="btnOkay" BackgroundCssClass="ModalPopupBG ">
        </ajaxToolkit:ModalPopupExtender>
     
     
      </div>
     </div>
     </div>
    </form>
   </body>
  </html>
