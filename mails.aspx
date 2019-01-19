<%@ Page AutoEventWireup="true" Language="C#" Inherits="ResumeFrontEnd.mails" MasterPageFile="~/MyVeiwMaster.master"%>
<asp:Content id="place1"  ContentPlaceHolderID="head" runat="server">
	<asp:Repeater runat="server" id="rpt">
		<ItemTemplate>
			<div class="words">
            <div class="container">
              <div class="col-12">
                 <div class="card">
            <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
                            <br>
                            <br>
                          <h5 class="card-title"><strong><%# Eval("Title")%></strong></h5>
                            <br>
                            <br>
                          <p class="card-text"><%# Eval("Post")%></p>
                        </div>
                        <br>
                        <br>
                        <div class="card-footer">
                            <asp:Label id="lblpostid" runat="server" Visible="false" text='<% Eval("postID") %>'></asp:Label>
                               <asp:Repeater runat="server" id="inRpdt">
                                    <div class="row">
                                        <div class="col-12">
                                             <div class="words"><%# Eval("comment")%></div>
                                        </div>
                                    </div>
                
                              </asp:Repeater>
                          <small class="text-muted" style="float:right;"><%# Eval("pdate")%></small>
                       </div>
                    </div>
                </div>
            </div>
        </div>
		</ItemTemplate>
	</asp:Repeater>
</asp:Content>
<asp:Content id="place2"  ContentPlaceHolderID="body" runat="server">
</asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
