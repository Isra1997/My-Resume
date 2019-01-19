<%@ Page enableEventValidation="true" Language="C#" Inherits="ResumeFrontEnd.login" CodeFile="login.aspx.cs" MasterPageFile="~/Masterpage.master" %>
<asp:Content id="place1" ContentPlaceHolderID="head" runat="server">
	<div class="container">
    <div class="row">
            <span><div class="col-12" style="font-size:30px;color: #737373;text-align:center;font-family: Courier New, Courier, monospace;">
                Register
            </div></span>
            <span><img src="../Images/bars.png"></span>
        </div>
        <br>
        <hr>
        <br>
        
        <div class="row">
        <div class="col-12">
        <span><div class="words" style="margin-right:10px;float:left;">First Name:  </div></span>
        <span><div class="words" Style="margin-left:50px;margin-right:10px;">Last Name:   </div></span>
        <br>    
        <span><asp:TextBox id="FirstName" runat="server" Height="40px" Required="required" CssClass="words"></asp:TextBox></span>
        <span><asp:TextBox  id="LastName" runat="server" Style="margin-left:32%;" Height="40px"  Required="required" CssClass="words"></asp:TextBox></span>
        </div>
        </div>

        <br>
        <br>
	<div class="row">
            <div class="col-12">
                <div class="words" style="float:left;">Username:</div>
                <br>
                <br>
                <asp:TextBox id="username" Width="60%"  Height="30px" runat="server"  Required="required" CssClass="words"></asp:TextBox>
            </div>
        </div>

	<br>
    <br>
		
	<div class="row">
            <div class="col-12">
                <div class="words" style="float:left;">Password:</div>
                <br>
                <br>
                <asp:TextBox id="password" TextMode="Password" Width="50%"  Height="30px" runat="server" Required="required" CssClass="words"></asp:TextBox>
            </div>
       </div>

	<br>
    <br>
        
    <div class="row">
            <div class="col-12">
                <div class="words" style="float:left;">Address:</div>
                <br>
                <br>
                <asp:TextBox id="address" Width="50%"  Height="30px" runat="server" Required="required" CssClass="words"></asp:TextBox>
            </div>
       </div>

    <br>
    <br>
        
    <div class="row">
            <div class="col-12">
                <div class="words" style="float:left;">E-mail:</div>
                <br>
                <br>
                <asp:TextBox id="email" Width="50%"  Height="30px" runat="server"  Required="required" CssClass="words"></asp:TextBox>
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
        <div class="row">
        <input type="text" id="dateofbirth" runat="server" Required="required" class="words">
        </div>

		<br>
		<br>
		
    <div runat="server" id="divmsg" class="words"  Visible="false" >Please enter a different username.</div>
		
	
	<asp:Button id="register" Text="Register"  CssClass="button" runat="server" OnClick="Button_Click" >
	</asp:Button>

	
</div>


 
</asp:Content>

 <asp:Content id="place2"  ContentPlaceHolderID="body" runat="server">
        </asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
