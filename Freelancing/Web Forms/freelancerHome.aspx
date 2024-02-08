<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="freelancerHome.aspx.cs" Inherits="Freelancing.Web_Forms.freelancerHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel="stylesheet" href="../Styles/freelancerHome.css"/>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
</head>
<body style="height:100vh;">
    <form id="form1" runat="server">
        <div>
            <header>
        <nav class="navbar">
            <a href="./freelancerHome.aspx" class="logo">
              <img src="../images/im3.png" alt="Fiverr Logo" style="width: 50px" />
                <p>Freelance Fusion</p>
            </a>
            <ul class="menu-links">
              <li><a href="./myPosts.aspx">My posts</a></li>
              <li><a href="./newPost.aspx">Post a freelancing job</a></li>
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
    <div class="join-container">
        <h1 runat="server" id="welcomeMessage"></h1>
        <form class="join-form">
          <div class="options-container">
            <label class="option">
              <input type="radio" name="role" value="view-post" runat="server" id="viewPost" checked />
              <span class="option-box">
                <img src="../images/search.svg" alt="seacrh Icon" />
                <span>View my posts</span>
              </span>
            </label>
            <label class="option">
              <input type="radio" name="role" value="new-post" runat="server" id ="newPost" />
              <span class="option-box">
                <img src="../images/signature.svg" alt="new post Icon" />
                <span>Make a new post</span>
              </span>
            </label>
          </div>
          <asp:Button runat="server" ID="btnGo" Text="Go" CssClass="go-btn" OnClick="btnGo_Click" />
        </form>
        </div>
    </form>
</body>
</html>
