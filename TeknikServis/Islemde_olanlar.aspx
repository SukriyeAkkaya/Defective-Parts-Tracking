<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Islemde_olanlar.aspx.cs" Inherits="_Default" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">



    <div class="panel panel-info"" style="width: 900px; height:auto; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold">İşlemde Olanlar</h3>
  </div>
  <div class="panel-body">



<div style="overflow:auto; margin-top:30px;">


    <asp:GridView ID="tablo_grid"  class="table" runat="server" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Arıza No" ForeColor="Black" 
        GridLines="Horizontal" 
        onrowdeleting="tablo_grid_RowDeleting" 
        onrowediting="tablo_grid_RowEditing" 
        onrowdatabound="tablo_grid_RowDataBound" 
        >
        <Columns>
            <asp:CommandField EditText="İşlem Yap" ShowEditButton="True">
            <ControlStyle CssClass="btn btn-danger" />
            <ItemStyle ForeColor="White" />
            </asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" DeleteText="Şikayet" >
            <ControlStyle CssClass="btn btn-info" />
            <ItemStyle ForeColor="White" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#ff6347" ForeColor="Black" Height="10px"/>
        <HeaderStyle BackColor="#ff6347" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />

          <emptydatarowstyle backcolor="#ecf0f1"
        />

        <emptydatatemplate>



            <p style="font-size:large;color: #2c3e50; background-image: url('Styles/bos2.png'); background-repeat: no-repeat; margin-left:280px; text-align:center; width: 400px; height: 250px; padding-top: 80px; padding-right:140px;"> İşlemde Olan Arıza Yok.</p> 

        </emptydatatemplate> 

    </asp:GridView>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 
  <asp:Label ID="lbl" runat="server" Text="" Visible="True"></asp:Label>
  
      <asp:Panel ID="Panel1" runat="server">
        
                  <div id="Div1" runat="server" >
  <div class="modal-dialog"  style="width:400px;" >
    <div class="modal-content" >
      <div class="modal-header" >
     <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/danismanlik.jpg" Height="40" Width="40" /> 
      <asp:Label ID="Label1" runat="server" Text="Şikayet Bilgisi" Font-Size="Large" 
                           Font-Bold="True"></asp:Label>
        <button type="button" id="btnOkay" runat="server" class="close" ><span>&times;</span><span class="sr-only">Close</span></button>
      
      </div>
      <div class="modal-body" style="text-align:justify; margin-left: 30px; margin-right: 20px;">
           
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
            popupdraghandlecontrolid="Panel1" drag="true"  backgroundcssclass="ModalPopupBG"
           OkControlID="btnOkay" >
        </ajaxToolkit:ModalPopupExtender>
         

      

 


</asp:Content>




