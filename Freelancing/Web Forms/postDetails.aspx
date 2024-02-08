<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postDetails.aspx.cs" Inherits="Freelancing.Web_Forms.postDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Post Details</title>
    <link rel="stylesheet" href="../Styles/postDetails.css" />
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
            <div class = "body-container">
                <div class="post-details-container">
                    <div class ="date">
                    <img src='<%# GetImageSrc(PostObject.Image) %>' />
                        <p runat="server" id="dateText"></p>

                        </div>
                    <div class="post-details">
                        <h1 runat="server" id="titleText"></h1>
                        <h3 runat="server" id="categoryText"></h3>
                        <h3 runat="server" id="priceText">Price</h3>
                        <p runat="server" id="descriptionText">Description</p>
                    </div>
                </div>
                <div class="user-details">
                        <a href ='<%# "userProfile.aspx?User_id=" + UserObject.User_id %>'><img src ='<%# GetImageSrc(UserObject.Profile_picture) %>'/> <p runat="server" id="userIdText"></p></a>
                    </div>
            </div>
            
        </div>
    </form>
</body>
</html>
