<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Gecmis.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    

    <div class="panel panel-info"" style="width: 800px; height:auto; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold; font-size: large;">Ürün Geçmişi</h3>
  </div>
  <div class="panel-body">
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     
  <ContentTemplate> 
   <div style="text-align: center">  <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl="~/Styles/ara.png" 
          Width="80px" /></div> 
  <div style=" margin-top:20px; text-align: center;">
   <h4 style="display: inline"> <asp:Label ID="Label2" runat="server" class="label label-info" Text="Ürün Numarası:"></asp:Label></h4>
    <div style="display: inline">
        <asp:TextBox ID="u_notxt" runat="server" height="28px" 
            Width="128px"></asp:TextBox></div>
    
      
      <asp:Button ID="ara_btn" runat="server" Text="Ara" 
          CssClass="btn btn-warning btn-sm" Height="29px" onclick="ara_btn_Click" 
          Width="41px" />
    
      
    </div>
    <div style="overflow:auto; margin-top:30px;">

  
    <asp:GridView ID="tablo_grid1"  class="table " runat="server" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4"  ForeColor="Black" 
        GridLines="Horizontal" onrowdatabound="tablo_grid1_RowDataBound"  >
        <Columns>
           
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#ff6347" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />


         <emptydatarowstyle backcolor="#ecf0f1"/>

        <emptydatatemplate>
            <div >
            <asp:Image ID="Image2" runat="server" BorderStyle="None" ImageUrl="~/Styles/warning.png" Width="50" Height="50" />
        
            <p style="display:inline; font-size:large;color: #2c3e50; margin-left:280px; text-align:center; width: 400px; height: 250px; padding-top: 80px; padding-right:140px;"> Bu Ürün Kayıtlı Değildir.</p> 
    </div>
        </emptydatatemplate> 
    </asp:GridView>

    </div>
</ContentTemplate> 
</asp:UpdatePanel>
 
 </div>
   </div>   


</asp:Content>


