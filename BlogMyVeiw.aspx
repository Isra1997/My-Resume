<%@Page Language="C#" AutoEventWireup="true" Inherits="ResumeFrontEnd.BlogMyVeiw"  CodeFile="BlogMyVeiw.aspx.cs" MasterPageFile="~/MyVeiwMaster.master"%>
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
				<div class="words" style="float:left;">Title:</div>
				<br>
				<br>
                <asp:TextBox id="Btitle" Width="60%"  Height="30px" runat="server" CssClass="words"></asp:TextBox>
			</div>
		</div>

		<br>
		<br>

		<div class="row">
			<div class="col-12">
				<div class="words" style="float:left">Blog Post:</div>
				<br>
				<br>
				<asp:TextBox id="BPost" Width="100%" Height="200px" runat="server" CssClass="words"></asp:TextBox>
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
		
        <input type="text" id="dateOfPost" runat="server" Required="required" class="words">
		
		<br>
		<br>
		<br>
		  <div class="row">
            <div class="words" style="float:left">
               Attachment:
            </div>
            <br>
            <br>
        </div>
		<asp:FileUpload id="uploader" runat="server" CssClass="words"></asp:FileUpload>
		<br>
        <br>
        <br>
        <asp:Button CssClass="button" Text="Post" runat="server" OnClick="Button_Click"></asp:Button>
</div>
</asp:Content>

<asp:Content id="place2"  ContentPlaceHolderID="body" runat="server" Visible="false">
	<br>
	<br>
	<br>
	<br>
    <br>
    <br>
	<asp:Label id="postresp" runat="server" Visible="false" CssClass="word" >The post has been posted :)</asp:Label>
</asp:Content>

<asp:Content id="place3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>
