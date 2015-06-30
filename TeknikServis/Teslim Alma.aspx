<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Teslim Alma.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



    <div class="panel panel-info"" style="width: 400px; height: 300px; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold">Ürün Teslim Al</h3>
  </div>
  <div class="panel-body">
  
 

    
      
        <div style="padding-top: 30px; padding-left:10px;">
    

           <h4 style="display: inline"><asp:Label ID="Label1"  class="label label-info" runat="server" Text="Arıza No:"></asp:Label> </h4> 
           <div class="hiza">
               <asp:TextBox ID="a_notxt"   runat="server"
                   AutoPostBack="True"></asp:TextBox>
           </div>
           </div>
     <div  style="padding: 10px 15px 20px 15px">
    <div class="hiza"  >
     <asp:CheckBox ID="CheckBox1" runat="server" Text="İlk Arıza Kaydı." 
            AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" />
      </div></div>


  <div style="padding: 10px;">
   <h4 style="display: inline"> <asp:Label ID="Label2" runat="server" class="label label-info" Text="Ürün Numarası:"></asp:Label></h4>
    <div class="hiza" style="margin:0px; padding:0px;"><asp:TextBox ID="u_notxt"   
            runat="server"></asp:TextBox></div>
 </div>


  <div class="hiza" style="text-align:right; padding-top:20px; width:150px;"> 
      <asp:Button ID="Button1"  class="btn btn-warning" runat="server" Text="Teslim Al" 
         onclick="Button1_Click" /></div>


          <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 
  <asp:Label ID="lbl" runat="server" Text="" Visible="True"></asp:Label>
   <div id="border">
      <asp:Panel ID="Panel1" runat="server">
      
               
                <div class="PopupBody modal-content">
                    <div align="left" style="padding: 20px">
                       <div> <asp:Image ID="logo_img" runat="server" ImageUrl="~/Styles/tick-icon.jpg" 
                            Height="65px" Width="69px" />Ürün Kaydı Yapılmıştır.</div>

                    <div style="margin-top:30px;"> <asp:Label ID="id_lbl" runat="server" Text="" Font-Size="Large" 
                            Height="50px" Width="169px"></asp:Label></div>  
                   </div>
                    <div class="modal-footer">
        <button type="button" id="btnOkay" class="btn btn-default" data-dismiss="modal">Kapat</button>
   </div>
      </div>
               </div>
                
               
      </asp:Panel>
      </div> 

        <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="lbl" PopupControlID="Panel1"   
            popupdraghandlecontrolid="modal-header" drag="true"   backgroundcssclass="ModalPopupBG"
           OkControlID="btnOkay" >
        </ajaxToolkit:ModalPopupExtender>



  </div>
</div>




</asp:Content>

