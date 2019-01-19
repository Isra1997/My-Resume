<%@ Page Language="C#" AutoEventWireup="true" Inherits="ResumeFrontEnd.Archive" MasterPageFile="~/MyVeiwMaster.master"%>
<asp:Content id="place1"  ContentPlaceHolderID="head" runat="server">
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
    <asp:Repeater  runat="server" id="rpt">
        <ItemTemplate >
<div class="words">
  <div class="col-8">
     <div class="card">
<!--   <img class="card-img-top" src="..." alt="Card image cap">-->
            <div class="card-body" >
              <h5 class="card-title"><%# Eval("Title")%></h5>
              <p class="card-text"><%# Eval("Post")%></p>
                                
            </div>
            <div class="card-footer">
              <small class="text-muted"><%# Eval("pdate")%></small>

                      
           </div>
        </div>
    </div>
</div>
    <br>
    <br>
        </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>
<asp:Content id="place2"  ContentPlaceHolderID="body" runat="server">
</asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
