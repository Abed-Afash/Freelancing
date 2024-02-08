<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="client.aspx.cs" Inherits="Freelancing.Web_Forms.client" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company name</title>
    <link rel="stylesheet" href="../Styles/client.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="client-container">
      <h2>Tell us more about yourself</h2>
      <p>
        If you work for a company we'd love to know the name of the company you
        work for
      </p>
      <asp:TextBox ID="companyNameTextBox" runat="server" CssClass="input-boxes" placeholder="(Optional) Company name"/>

      <div class="buttons">
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button back-btn" OnClick="btnBack_Click" />
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="button next-btn" OnClick ="Next" />
      </div>
    </div>
        </div>
    </form>
</body>
</html>
