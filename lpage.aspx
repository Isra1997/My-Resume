<%@ Page Language="C#" Inherits="ResumeFrontEnd.lpage" CodeFile="lpage.aspx.cs" MasterPageFile="~/Masterpage.master"%>
<asp:Content id="place1" ContentPlaceHolderID="head" runat="server">
	<div class="container">
		<br>
		<br>
		<br>
        <br>
		<br>
        <br>
	    <div class="row">
            <div class="col-12">
            <div class="words" style="margin-left:500px;float:left;">username: </div>
            <br>
            <br>
            <span><asp:TextBox id="username" Style="margin-left:350px;" runat="server" Width="40%" Height="70px" CssClass="words"></asp:TextBox></span>
            </div>
        </div>
		<br>
		<br>
		<div class="row">
            <div class="col-12">
            <div class="words" style="margin-left:500px;float:left;">Password: </div>
            <br>
            <br>
            <span><asp:TextBox id="password" Style="margin-left:350px;" runat="server" Width="40%" Height="70px" CssClass="words" TextMode="Password"></asp:TextBox></span>
            </div>
        </div>
		<br>
        <br>
		      <div runat="server" id="divmsg" class="words"  Visible="false" >Incorrect Username or Password.</div>
		<br>
		<br>
		<asp:Button Text="Login" id="login" CssClass="button" runat="server" OnClick="login_Click"></asp:Button>
   </div>


</asp:Content>

 <asp:Content id="place2"  ContentPlaceHolderID="body" runat="server">
 </asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
