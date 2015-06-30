<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Hazir.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



    <div class="panel panel-info"" style="width:750px; height:auto; margin:auto; margin-top:30px;">
  <div class="panel-heading">
    <h3 class="panel-title" style="font-weight: bold">Hazır Olanlar</h3>
  </div>
  <div class="panel-body">



<div style="overflow:auto; margin-top:30px;">


    <asp:GridView ID="tablo_grid"  class="table" runat="server" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="Arz. No" ForeColor="Black" 
        GridLines="Horizontal" onrowcommand="tablo_grid_RowCommand" 
        onrowdatabound="tablo_grid_RowDataBound" Width="700px" 
        >
        <Columns>
            <asp:ButtonField Text="Teslim Et">
            <ControlStyle CssClass="btn btn-warning" ForeColor="White" />
            </asp:ButtonField>
            
        </Columns>

         <emptydatarowstyle backcolor="#ecf0f1"
        />

        <emptydatatemplate>



            <p style="font-size:large;color: #2c3e50; background-image: url('Styles/bos2.png'); background-repeat: no-repeat; margin-left:280px; text-align:center; width: 400px; height: 250px; padding-top: 80px; padding-right:140px;"> Hazır Olan Arıza Yok.</p> 

        </emptydatatemplate> 
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#ff6347" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>


   

</div>
 </div>     


  <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 
  <asp:Label ID="lbl" runat="server" Text="" Visible="True"></asp:Label>
  
      <asp:Panel ID="Panel1" runat="server">
        
                  <div id="Div1" runat="server" >
  <div class="modal-dialog"  style="width:400px;" >
    <div class="modal-content" >
      <div class="modal-header" >
    
     
                        
        <button type="button" id="btnOkay" runat="server" class="close" ><span>&times;</span><span class="sr-only">Close</span></button>
      
      </div>
      <div class="modal-body" style="text-align:justify; margin-left: 30px; margin-right: 20px;">
          <asp:Image ID="Image1" runat="server" ImageUrl="~/Styles/danismanlik.jpg" Height="40" Width="40" />   
         <asp:Label ID="id_lbl" runat="server" Text="Ürün Teslim Edildi." Font-Size="Medium" ></asp:Label>
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


