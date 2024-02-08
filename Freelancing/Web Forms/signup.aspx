<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Freelancing.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Signup</title>
        <link rel="stylesheet" href="../Styles/signup.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <section class="signup-section">
      <div class="signup-container">
        <h2 class="signup-title">Sign Up to Connect</h2>
        <div
          class="signup-form"
        >
          <div class="form-group">
            <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" Required="true"></asp:TextBox>

          </div>
          <div class="form-group">
                 <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
                 <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Email" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
                 <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" Required="true"></asp:TextBox>
          </div>
            <div class="form-group">
                     <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                      <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                    <label for="profile_pic">Profile Picture (optional):</label>
                    <asp:FileUpload ID="fileProfilePic" runat="server" />
            </div>

          <asp:Button ID="btnCreateAccount" runat="server" CssClass="signup-btn" Text="Create my account" OnClick="btnCreateAccount_Click" />

          <div class="log-link">
            <p class="login-text">Already have an account?</p>
            <a class="login-link" href="./login.aspx">Log In</a>
          </div>
        </div>
      </div>
    </section>
    <script>

      document.addEventListener("DOMContentLoaded", (event) => {
        const inputs = document.querySelectorAll(".form-group input");

        inputs.forEach((input) => {
          input.addEventListener("focus", (event) => {
            event.target.style.borderColor = "#19a463";
            event.target.style.color = "#fff";
          });

          input.addEventListener("blur", (event) => {
            if (event.target.value.trim() !== "") {
              event.target.style.borderColor = "#19a463";
              event.target.style.color = "#fff";
            } else {
              event.target.style.borderColor = "#5c5c5e";
            }
          });
        });
      });
    </script>
        </div>
    </form>
</body>
</html>
