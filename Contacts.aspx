<%@ Page Language="C#" AutoEventWireup="true" Inherits="ResumeFrontEnd.Contacts" CodeFile="Contacts.aspx.cs"  MasterPageFile="~/Masterpage.master"%>
<asp:Content id="place1" ContentPlaceHolderID="head" runat="server">
	<br>
	<br>
 <div class="container">
		<div class="row">
			<span><div class="col-12" style="font-size:30px;color: #737373;text-align:center;font-family: Courier New, Courier, monospace;">
				Lets Talk
			</div></span>
			<span><img src="../Images/chat.png"></span>
		</div>
		<br>
		<hr>
		<br>
		
        <div class="row">
	    <div class="col-12">
	    <span><div class="words" style="margin-right:10px;float:left;">First Name:  </div></span>
        <span><div class="words" Style="margin-left:50px;margin-right:10px;">Last Name:   </div></span>
		<br>	
		<span><asp:TextBox id="FirstName" runat="server" Height="40px" CssClass="words"></asp:TextBox></span>
		<span><asp:TextBox  id="LastName" runat="server" Style="margin-left:32%;" Height="40px" CssClass="words"></asp:TextBox></span>
	    </div>
        </div>

		<br>
		<br>

		<div class="row">
		    <div class="col-12">
            <div class="words" style="margin-right:10px;float:left;">Subjects: </div>
			<br>
			<br>
			<span><asp:TextBox id="subject" runat="server" Width="40%" Height="70px" CssClass="words"></asp:TextBox></span>
            </div>
		</div>

		<br>
		<br>

		<div class="row">
			<div class="col-12">
			<span><div class="words" style="margin-right:10px;float:left;" CssClass="words">Message: </div></span>
            <br>
			<br>
			<span><asp:TextBox id="message" Width="70%" Height="160px" runat="server" CssClass="words"></asp:TextBox></span>
            </div>
		</div>

		<br>
		<br>

		 <div class="row">
            <div class="words" style="float:left">
                Date :
            </div>
            <br>
            <br>
        </div>
        
        <input type="text" id="dateOfmess" runat="server" Required="required" class="words">
        
        <br>
        <br>
        <br>

		<asp:Button CssClass="button" Text="Send" runat="server" OnClick="Button_Click1"></asp:Button>

   
 </div>
</asp:Content>

 <asp:Content id="place2"  ContentPlaceHolderID="body" runat="server" Visible="false">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<asp:Label id="Resopnse" CssClass="words" runat="server" Visible="false" Style="text-align:center;"> Thank you for sharing your thoughts :)</asp:Label>
		</div>
	</div>
	
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
	<br>
    <br>
    <br>
    <br>
    <br>
    <br>
 </asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>

 