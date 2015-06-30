<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="IslemEkle.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    

    <div class="panel panel-info"" style="width: 400px; height:auto; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold; font-size: large;">Yeni İşlem Ekle</h3>
  </div>
  <div class="panel-body">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     
  <ContentTemplate> 
   <div style="text-align: center">  <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/Styles/add.png" 
          Width="80px" /></div> 
  <div style=" margin-top:20px; text-align: center;">
   <h4 style="display: inline"> <asp:Label ID="Label2" runat="server" class="label label-info" Text=" Yeni İşlem Ekle:"></asp:Label></h4>
    <div style="display: inline">
        <asp:TextBox ID="islem_txt" runat="server" height="28px" 
            Width="128px"></asp:TextBox></div>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                            ControlToValidate="islem_txt" Display="None" 
                                            ErrorMessage="Bölüm Alanı Boş Geçilemez" Font-Size="Medium" ForeColor="Red">*</asp:RequiredFieldValidator>

               <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                            runat="server" TargetControlID="RequiredFieldValidator20">
                                      </ajaxToolkit:ValidatorCalloutExtender>
    
      
      <asp:Button ID="ekle_btn" runat="server" Text="Ekle" 
          CssClass="btn btn-warning btn-sm" Height="29px" onclick="ekle_btn_Click" 
          Width="41px" />
    
      
    </div>
    <div style="width: 200px; margin-left: 30px; margin-top: 20px;">

    <asp:GridView ID="tablo_grid" style="margin-bottom:0px;" 
       class="table "  runat="server" 
        CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px"    >

        
        
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" 
                  Font-Size="Medium" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
     
    
              <RowStyle ForeColor="#000066" />
              <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
     
    
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    </div>
</ContentTemplate> 
</asp:UpdatePanel>
 
 </div>
   </div>   
   
    

    
          
               
        


</asp:Content>



