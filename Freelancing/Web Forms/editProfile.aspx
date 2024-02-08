<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" EnableViewState="true" Inherits="Freelancing.Web_Forms.editProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit profile</title>
    <link rel="stylesheet" href="../Styles/editProfile.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
        <nav class="navbar">
            <% if (UserObject.User_type == "Freelancer")
                { %>
            <a href="./freelancerHome.aspx" class="logo">
              <img src="../images/im3.png" alt="Fiverr Logo" style="width: 50px" />
                <p>Freelance Fusion</p>
            </a>
            <%}
                else
                { %>
            <a href="./clientHome.aspx" class="logo">
              <img src="../images/im3.png" alt="Fiverr Logo" style="width: 50px" />
                <p>Freelancing Fusion</p>
            </a>
            <%} %>
            <ul class="menu-links">
                <% if (UserObject.User_type == "Freelancer")
                    { %>
              <li><a href="./myPosts.aspx">My posts</a></li>
              <li><a href="./newPost.aspx">Post a freelancing job</a></li>
                <%}
                    else
                    { %>
              <li><a href="./posts.aspx">Look for freelancers</a></li>
                <%} %>
              <li><a href="./profile.aspx">My profile</a></li>
              <li class="join-btn"><a href="./index.aspx">Sign Out</a></li>
              <li class="join-btn"><asp:Image ID="imgDisplay" runat="server" AlternateText ="profile picture" style="width: 50px; height: 50px; border-radius: 50%;" /></li>
              <span id="close-menu-btn" class="material-symbols-outlined"
                >close</span
              >
            </ul>
            <span id="hamburger-btn" class="material-symbols-outlined">menu</span>
          </nav>
    </header>
            <section class="signup-section">
      <div class="signup-container">
        <h2 class="signup-title">Edit profile</h2>
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
                 <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" Required="true"></asp:TextBox>
          </div>
            <div class="form-group">
                     <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" Required="true"></asp:TextBox>
            </div>
            <%if (UserObject.User_type == "Freelancer")
                { %>
            <div class="form-group">
                      <asp:TextBox ID="txtLinkedIn" runat="server" placeholder="LinkedIn link" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                      <asp:TextBox ID="txtExperience" runat="server" placeholder="Experience" TextMode="Number" Required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                      <asp:TextBox ID="txtCategory" runat="server" placeholder="Preferred Category" Required="true"></asp:TextBox>
            </div>

            <%} %>
            <%else
                { %>
            <div class="form-group">
                      <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Optional: Company Name"></asp:TextBox>
            </div>
            <%} %>
            <div class="form-group">
                    <label for="profile_pic">Profile Picture :</label>
                    <asp:FileUpload ID="fileProfilePic" runat="server" />
            </div>
            <% if(UserObject.User_type== "Freelancer") {%>
            <div class="form-group">
                    <label>CV: </label>
                    <asp:FileUpload ID="fileCV" runat="server" />
            </div>
            <%} %>

          <asp:Button ID="btnEditProfile" runat="server" CssClass="signup-btn" Text="Edit my profile" OnClick="btnEditProfile_Click" />
        </div>
      </div>
    </section>

        </div>
    </form>
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
</body>
</html>
