<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master"  EnableEventValidation="true" AutoEventWireup="true" CodeFile="Kullanıcı.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <div class="panel panel-info"" style="width: 900px; height:auto; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold">Personel</h3>
  </div>
  <div class="panel-body">



<div style="overflow:auto; margin-top:30px;">


    <asp:GridView ID="tablo_grid" style="margin-bottom:0px;" 
       class="table "  runat="server" 
        CellPadding="4"  ForeColor="#333333" 
        GridLines="None"    onrowediting="tablo_grid_RowEditing" onrowupdating="tablo_grid_RowUpdating1" 
        DataKeyNames="No" onrowcancelingedit="tablo_grid_RowCancelingEdit" 
        onrowdeleting="tablo_grid_RowDeleting" 
        onrowdatabound="tablo_grid_RowDataBound"  >

        
        <AlternatingRowStyle BackColor="White" />

        
        <Columns>
            <asp:CommandField CancelText="İptal" EditText="Düzenle" 
                ShowEditButton="True" UpdateText="Güncelle" CausesValidation="False" 
                ButtonType="Button"></asp:CommandField>
          
         
            <asp:CommandField ButtonType="Button" DeleteText="Sil" 
                ShowDeleteButton="True" />
          
         
        </Columns>
        
        
        
        <EditRowStyle BackColor="#ecf0f1" />
        
        
        
        <FooterStyle BackColor="#e67e22" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#ff6347" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
     
    
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#2ecc71" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <div style="background-color:#ff6347; margin-top:0px; height:40px; padding-top:10px; padding-left:10px;">
    <div style="display:inline; margin-left:85px;"></div>
     <asp:Button ID="ekle"  runat="server" Text="Personel Ekle"  onclick="ekle_Click" 
            Height="28px" />
     <div style="display:inline; margin-left:100px;"></div>
     <asp:Label ID="Label1" runat="server" Text="Ad:" ForeColor="White"></asp:Label>
     <asp:TextBox ID="isim" runat="server"></asp:TextBox>
     <div style="display:inline; margin-left:110px;"></div>
     <asp:Label ID="Label2" runat="server" Text="Şifre:" ForeColor="White"></asp:Label>
    <asp:TextBox ID="sifre" runat="server"></asp:TextBox>
    
    
    </div >

     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 
  <asp:Label ID="lbl" runat="server" Text="" Visible="True"></asp:Label>
   <div id="border">
      <asp:Panel ID="Panel1" runat="server">
      
                <div class="PopupHeader modal fade bs-example-modal-sm"" id="PopupHeader">Gönderiniz İletilmiştir...</div>
                <div class="PopupBody modal-content">
                    <p align="center" style="padding: 20px">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/user_warning.png" 
                            Height="101px" Width="122px" />
                        <asp:Label ID="id_lbl" runat="server" Text="Admin Kullanıcısı Silinemez." Font-Size="Large" 
                            Height="50px" Width="169px"></asp:Label>
                   </p>
                    <div class="modal-footer">
        <button type="button" id="btnOkay" class="btn btn-default" data-dismiss="modal">Tamam</button>
     
      </div>
               </div>
                
               
      </asp:Panel>
      </div> 

        <ajaxToolkit:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" 
            DynamicServicePath="" Enabled="True" TargetControlID="lbl" PopupControlID="Panel1"   
            popupdraghandlecontrolid="modal-header" drag="true"  backgroundcssclass="ModalPopupBG"
           OkControlID="btnOkay" >
        </ajaxToolkit:ModalPopupExtender>




    
</div>
  



</asp:Content>

