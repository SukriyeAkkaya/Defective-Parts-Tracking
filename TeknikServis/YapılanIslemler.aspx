<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="YapılanIslemler.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="panel panel-info" style="width: 600px; height:auto; margin:auto; margin-top:30px;">
  <!-- Default panel contents -->
  <div class="panel-heading" style="font-weight: bold; ">İşlem Yap</div>
  <div class="panel-body">
 
<asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate> 
             <h3 style="display: inline"><span class="label label-danger" style ="background : #FD6969 ">Ürün Numarası:</span></h3>
           
           
                                      
           
             <asp:TextBox ID="urunid_txt" runat="server" Height="30px" 
                 ontextchanged="urunid_txt_TextChanged" AutoPostBack="True"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                            ControlToValidate="urunid_txt" Display="None" 
                                            ErrorMessage="Bölüm Alanı Boş Geçilemez" Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>

               <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" TargetControlID="RequiredFieldValidator20">
                                      </ajaxToolkit:ValidatorCalloutExtender>

<div style="margin-left:10px; margin-top:10px;" >  
 <div style="float: left">
  <h4 style="display: inline"><asp:Label ID="Label1"  runat="server" Text="Ürün Sahibi"></asp:Label></h4>
           <h4 ><asp:Label ID="Label2"  runat="server" Text="Birim"></asp:Label></h4>
             <h4 ><asp:Label ID="Label3"  runat="server" Text="Telefon Numarası"></asp:Label></h4>
             <h4 ><asp:Label ID="Label4"  runat="server" Text="Ürün Modeli"></asp:Label></h4>
  <h4 ><asp:Label ID="Label5"  runat="server" Text="Son İşlem Yapan"></asp:Label></h4>
                    <h4 ><asp:Label ID="Label6" class="label label-warning" runat="server" Text="Arıza" Font-Bold="True"></asp:Label></h4>
</div>
<div >
           <h4 ><asp:Label ID="sahip_lbl"  runat="server" Text=":"></asp:Label></h4>
              <h4 ><asp:Label ID="birim_lbl"  runat="server" Text=":"></asp:Label></h4>
               <h4 ><asp:Label ID="tel_no_lbl"  runat="server" Text=":"></asp:Label></h4>
                  <h4 ><asp:Label ID="model_lbl"  runat="server" Text=":"></asp:Label></h4>
                  <h4 ><asp:Label ID="islem_yapan_lbl"  runat="server" Text=":"></asp:Label></h4>
                    <h4 ><asp:Label ID="sikayet_lbl"  runat="server" Text=":"></asp:Label></h4>
           
           
 </div>           
            
     </div>      
            
          
           

              <div style="overflow:auto; margin-top:30px;">
<asp:Table ID="Table1" class="table  table-bordered" runat="server" >

</asp:Table>
</div>

<asp:DropDownList ID="durum_Drop"   runat="server" Height="30px"  >
          
        <asp:ListItem Value="0">İşlemde</asp:ListItem>
        <asp:ListItem Value="1">Hazır</asp:ListItem>
     
       


      </asp:DropDownList>

      
    </ContentTemplate>
 </asp:UpdatePanel>


 <div style="text-align: right">
 <asp:Button ID="Button1"  class="btn btn-info" runat="server" Text="Kaydet" 
          Height="31px" onclick="Button1_Click" /> </div>
  
     
 </div>

       
</div>


  <asp:Label ID="lbl" runat="server" Text="" Visible="True"></asp:Label>
  
      <asp:Panel ID="Panel1" runat="server">
        
                  <div id="Div1" runat="server" >
  <div class="modal-dialog"  style="width:400px;" >
    <div class="modal-content" >
      <div class="modal-header" >
        <button type="button" id="btnOkay" runat="server" class="close" ><span>&times;</span><span class="sr-only">Close</span></button>
       </div>
        
      <div class="modal-body" style="text-align:center; margin-left: 10px; margin-right: 20px;">
          <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/small.gif" 
              Height="30px" Width="30px" /> 
         <asp:Label ID="id_lbl" runat="server" Text="Bu Ürün Teknik Serviste Değil." Font-Size="Medium" ></asp:Label>
      </div>
       <div class="modal-footer" >
        
      </div>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


               
      </asp:Panel>
 

        <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="lbl" PopupControlID="Panel1"   
            popupdraghandlecontrolid="Panel1" drag="true"  backgroundcssclass="ModalPopupBG"
           OkControlID="btnOkay" >
        </ajaxToolkit:ModalPopupExtender>


        
        
     






</asp:Content>





