<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Freelancing.Web_Forms.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Styles/login.css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="login-section">
      <div class="login-container">
        <h2 class="login-title">Log In</h2>
        <form action="home.html" method="GET" class="login-form">
          <div class="form-group">
            <asp:TextBox runat="server" ID="emailTextBox" placeholder="Email" TextMode="Email" Required="true" />
          </div>
          <div class="form-group">
            <asp:TextBox runat="server" ID="passwordTextBox" placeholder="Password" TextMode="Password" Required="true" />
          </div>
          <asp:Button ID="btnNext" runat="server" Text="Log In" CssClass="login-btn" OnClick ="LogIn_button" />
        </form>
        <a class="signup-link" href="./signup.aspx">Sign up</a>
      </div>
    </section>
        </div>
    </form>

</body>
</html>
