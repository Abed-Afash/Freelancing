<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Freelancing.Web_Forms.userProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel ="stylesheet" href ="../Styles/profile.css" />
    <title>Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
        <nav class="navbar">
            <a href="./clientHome.aspx" class="logo">
              <img src="../images/im3.png" alt="Fiverr Logo" style="width: 50px" />
                <p>Freelance Fusion</p>
            </a>
            <ul class="menu-links">
              <li><a href="./posts.aspx">Look for freelancers</a></li>
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
            
        </div>
        <div class="profile-container">
            <div class ="info-container">
                <h1 runat="server" id="nametext"></h1>
                <h5 runat="server" id="categorytext"></h5>
                <h6 runat="server" id="typetext"></h6>
                
                <div class="buttons-container">
                    <asp:Button ID="Button1" runat="server" Text="CV" CssClass="cv" onclick="Button1_Click" ></asp:Button>

                <asp:Button ID="Button2" runat="server" Text="LinkedIn" OnClientClick="linkedIn();" />
                </div>
                <div class="phone-container">
                    <img  src="../Images/phone.png"/>
                <h3 runat="server" id="phonetext"></h3>
                </div>
                <div class="phone-container">
                    <img  src ="../Images/email.png"/>
                <h3 runat="server" id="emailtext"></h3>
                </div>
                <h3 runat="server" id="experiencetext"></h3>
                <h3 runat="server" id="companyName"></h3>

            </div>
                <asp:Image ID="Image1" runat="server" AlternateText ="profile picture" />
                

          </div>
    </form>
    <script type="text/javascript">
        function linkedIn() {
            var linkedInPage = '<%= freelancerObject.Linkedin_link%>';
            window.open(linkedInPage, '_blank');
        }
    </script>
</body>
</html>
