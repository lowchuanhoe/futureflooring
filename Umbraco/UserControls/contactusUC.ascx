<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contactusUC.ascx.cs"
    Inherits="freshIdeasUC.controls.contactusUC" %>

<script type="text/javascript">
    function validate() {

        if ($("#<%=txtFirstName.ClientID %>").val() == "") {
            setDivCss("<%=txtFirstName.ClientID %>", "TextBox", "TextBoxError");
            setErrorMessage('true', "<b>First name</b> is required.")
            $("#<%=txtFirstName.ClientID %>").focus();
            return false;
        }
        else {
            setDivCss("<%=txtFirstName.ClientID %>", "TextBoxError", "TextBox");
            setErrorMessage('false', "");
        }


        if ($("#<%=txtEmail.ClientID %>").val() == "") {
            setDivCss("<%=txtEmail.ClientID %>", "TextBox", "TextBoxError");
            setErrorMessage('true', "<b>Email address</b> is required.")
            $("#<%=txtEmail.ClientID %>").focus();
            return false;
        }
        else if (!validateEmail($("#<%=txtEmail.ClientID %>").val())) {
            setDivCss("<%=txtEmail.ClientID %>", "TextBox", "TextBoxError");
            setErrorMessage('true', "<b>Email address</b> is invalid.")
            $("#<%=txtEmail.ClientID %>").focus();
            return false;
        }
        else {
            setDivCss("<%=txtEmail.ClientID %>", "TextBoxError", "TextBox");
            setErrorMessage('false', "");
        }
        return true;
    }


    function setDivCss(div, removeClass, addClass) {
        $("#" + div).removeClass(removeClass);
        $("#" + div).addClass(addClass);
    }


    function setErrorMessage(state, errorMessage) {
        if (state == 'true') {
            $("#dvError").css('display', 'block');
            $("#lblError").html(errorMessage);
        }
        else if (state == 'false') {
            $("#dvError").css('display', 'none');
            $("#lblError").html("");
        }
    }

    function hideMe(objId) {
        $("#" + objId).fadeOut();
    }

    function showSuccess() {

        $("#dvSuccess").css('display', 'block');
    }

    function validateEmail(elementValue) {
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var result = emailPattern.test(elementValue);
        return result;
    }  
        
</script>
<form id="form1" runat="server">
<div id="contactusHeader" class="contactusHeader">
    <div id="dvError" class="errorStatementDiv" style="display: none;">
        <span class="errorRed">Error:</span> <span id="lblError"></span>
    </div>
    <div id="dvSuccess" class="successStatementDiv" style="display: none;">
        <span class="successGreen">Thank You:</span> Your message has been sent and we will
        get back to you shortly.
    </div>
</div>

<div class="margin_bottom" id="dvFirstName">
    <label for="txtFirstName" class="lable">
        First Name:</label>
    <asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox>
</div>
<div class="margin_bottom" id="dvLastName">
    <label for="txtLastname" class="lable">
        Last Name:</label>
    <asp:TextBox ID="txtLastname" runat="server" CssClass="TextBox"></asp:TextBox>
</div>
<div class="margin_bottom" id="dvEmail">
    <label for="txtEmail" class="lable">
        Email:</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox>
</div>
<div class="margin_bottom" id="dvMessage">
    <label for="txtMessage" class="lable">
        Your Message:</label>
    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtMessage" CssClass="TextBox"></asp:TextBox>
</div>
<div class="submitButtonDiv">
    <asp:Button runat="server" ID="btnSubmit" CssClass="SubmitButton" Text="" OnClick="btnSubmit_Click"
        OnClientClick="return validate();" />
</div>
<div id="notification" class="notificationMsg">
    <asp:Label ID="LResult" runat="server" Text="" />
</div>
</form>
