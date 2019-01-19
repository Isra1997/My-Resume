<%@ Page Language="C#" enableEventValidation="false" AutoEventWireup="true" Inherits="ResumeFrontEnd.Blog" MasterPageFile="~/Masterpage.master"%>
<asp:Content id="place1" ContentPlaceHolderID="head" runat="server">
	<br>
	<br>
	<br>
    <br>
	<br>
    <br>
	<br>
    <br>
<asp:Repeater runat="server" id="rpt" OnItemDataBound="rpt_ItemDataBound" OnItemCommand="rpt_ItemCommand1">
	<ItemTemplate>
        <div class="words">
            <div class="container">
              <div class="col-12">
                 <div class="card">
            <!--            <img class="card-img-top" src="..." alt="Card image cap">-->
                        <div class="card-body">
						    <br>
                            <br>
                          <h5 class="card-title" style="float:left;margin-left:10px;text-transform:uppercase;"><strong><%# Eval("Title")%></strong></h5>
							<br>
                            <hr>
                            <br>
						<span><img src="../Images/Pass1.Jpg" style="height:60%;width:50%;" class="card-img-top img-thumbnail"></span>
								<br>
								<br>
                        <span><p class="card-text"><%# Eval("Post")%></p></span>
                        </div>
							
						<br>
                        <br>
                        <div class="card-footer">
							<asp:Label id="lblpostid" runat="server" Visible="false" text='<%# Eval("postID") %>'></asp:Label>

								<asp:Repeater runat="server" id="inRpdt">
									<ItemTemplate>
									<div class="row">
										<div class="col-12">
											 <span><div class="words" style="float:left;margin-left:10px;"><%# Eval("comment")%></div></span>						
										</div>
									</div>
				                    </ItemTemplate>
							  </asp:Repeater> 
						
                       
						<asp:ImageButton id="likebu"  src="../Images/like.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() + 1%> ' ></asp:ImageButton>
                        <asp:Label id="countlbllike" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>
								
						<asp:ImageButton id="dislikebu" src="../Images/dislike.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() +2%>'></asp:ImageButton>
                        <asp:Label id="countlbldislike" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>
								
 
						<asp:ImageButton id="heartbu"  src="../Images/heart.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() +3 %>' ></asp:ImageButton>
                        <asp:Label id="countlblheart" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>

						<asp:ImageButton id="brokenheart"  src="../Images/BrokenHeart.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() +4 %>'></asp:ImageButton>
                        <asp:Label id="countlblbrokenheart" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>
								

						<asp:ImageButton id="hahabu"  src="../Images/emoicon.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() +5%>' ></asp:ImageButton>
                        <asp:Label id="countlblhaha" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>
								
						<asp:ImageButton id="Angrybu"  src="../Images/angry.png" style="float:left;" runat="server" CommandName="addlike" CommandArgument='<%# Eval("postID").ToString() +6%>' ></asp:ImageButton>
						<asp:Label id="countlblangry" Visible="false" runat="server" CssClass="words" Style="float:left;margin-top:20px;margin-left:10px;"></asp:Label>	
								
                         <asp:LinkButton CausesValidation="false" runat="server" id="react" Text="Clear Reaction" CssClass="words" Style="float:left;color:#79d279;margin-top:20px;margin-left:10px;" CommandArgument='<%# Eval("postID")%>' CommandName="ClearCommand"></asp:LinkButton>
                         <small class="text-muted" style="float:right;"><%# Eval("pdate")%></small>
								    <br>
								    <br>
								    <br>
								    <hr>
									<asp:TextBox runat="server" id="ctext" CssClass="words" Style="float:left" Width="40%" >
									</asp:TextBox> 
								    <span><asp:LinkButton CausesValidation="false" runat="server" id="bureadmore" Text="comment" CssClass="words" Style="float:left;margin-left:10px;color:#79d279;" CommandArgument='<%# Eval("postID")%>' CommandName="Command"></asp:LinkButton></span>
                                    <asp:Label id="badlbl" Visible="false" runat="server" Text="Please use another language to express your comment"></asp:Label>
                                    <asp:Label id="regslbl" Visible="false" runat="server" Text="Please Register or login to Comment or like :)"></asp:Label>
                       </div>
                    </div>
                </div>
            </div>
	
       </div>
			<br>
			<br>
			<br>
	</ItemTemplate>
</asp:Repeater>

</asp:Content>

 <asp:Content id="place2"  ContentPlaceHolderID="body" runat="server">
</asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
