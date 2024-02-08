<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="Freelancing.category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Category / LinkedIn</title>
    <link rel="stylesheet" href="../Styles/category.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="category-container">
      <h2>Final Questions:</h2>
      <p>
        We'd love to learn more about your expertise! First, could you share
        your preferred category for freelancing opportunities?
      </p>
      <asp:TextBox ID="preferredCategory" runat="server" CssClass="input-boxes" placeholder="Preferred category" Required="true" />
      <p>
        Additionally, providing your  CV and LinkedIn profile link will help showcase
        your professional experience to potential clients.
      </p>
      <asp:TextBox ID="linkedInLink" runat="server" CssClass="input-boxes" placeholder="LinkedIn link" Required="true" />
      <p>Please upload your CV</p>
      <asp:FileUpload ID="cvUpload" runat="server" CssClass="input-boxes" />
      <div class="buttons">
        <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button back-btn" OnClick="btnBack_Click" />
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="button next-btn" OnClick ="Next" />
      </div>
    </div>
        </div>
    </form>
</body>
</html>
