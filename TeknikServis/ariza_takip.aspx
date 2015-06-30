<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ariza_takip.aspx.cs" Inherits="ariza_takip" %>




<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
        width:600px;
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

   <link href="~/Styles/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/signin.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/metro-bootstrap-responsive.css" rel="stylesheet" type="text/css"  />
    <link href="~/Styles/css/metro-bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
    <link href="~/Styles/css/metro-bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/css/metro-bootstrap.min.css" rel="stylesheet" type="text/css"  />
    <script src="~/js/metro.min.js" type="text/javascript"></script>
   
  
 </head>

<body style="margin-top : 80px">
   
    <form id="form2"  runat="server">

    <div id="main" >
   

      <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
     
      <div  id="baslik" style="margin-bottom:10px; padding-left:40px; border-bottom:1px solid grey;">
         
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/tkp.jpg" 
              Height="114px" Width="526px" />
       
      </div>
      <div class="govde" style="padding-left:25px; padding-top:10px;">
                <div class="eleman"> 
                     <asp:Label ID="Label8" runat="server" Text="T.C. No:" Font-Bold="True" 
                         Font-Names="Arial"></asp:Label>
                     <div class="hiza">
                        <asp:TextBox ID="tc_text" runat="server" 
                                     AutoPostBack="True" Height="24px" Width="306px" Font-Size="Medium"></asp:TextBox>
                     </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                      ControlToValidate="tc_text" Display="None" 
                                                      ErrorMessage="Bölüm Alaný Boþ Geçilemez" 
                                                      Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
                         <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2">
                         </ajaxToolkit:ValidatorCalloutExtender>
                </div>
                  <div class="eleman">
                     <asp:Label ID="Label2" runat="server" Text="Ürün Numarası :" Font-Bold="True"
                         Font-Names="Arial"></asp:Label>
                     <div class="hiza">
                     <asp:TextBox ID="p_ad_txt" runat="server" height="24px" width="306px" 
                             Font-Size="Medium" ></asp:TextBox>
                     </div>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                      ControlToValidate="p_ad_txt" Display="None" 
                                                      ErrorMessage="Bölüm Alaný Boþ Geçilemez" 
                                                      Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>
                          <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1">
                          </ajaxToolkit:ValidatorCalloutExtender>
                </div>
      
     <div  style="text-align: right;  width: 516px; height: 82px;"> 
       <asp:Button ID="gonder"  class="btn btn-danger" runat="server" Font-Bold="True" Text="Gönder" 
              Font-Size="Small" data-toggle="modal" data-target=".bs-example-modal-sm"
             UseSubmitBehavior="False" onclick="gonder_Click" />
         
        
  
       </div>
     </div>
     </div>

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
               </div>
      </asp:Panel>
 

        <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="lbl" PopupControlID="Panel1"   
            popupdraghandlecontrolid="Panel1" drag="true"  X="500" Y="200"
           OkControlID="btnOkay" BackgroundCssClass="ModalPopupBG ">
        </ajaxToolkit:ModalPopupExtender>




    </form>
   </body>
  </html>
