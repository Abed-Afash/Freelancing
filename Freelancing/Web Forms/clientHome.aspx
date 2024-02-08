<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientHome.aspx.cs" Inherits="Freelancing.Web_Forms.clientHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Styles/clientHome.css" />
    <title>Home</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
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
    <section class="hero-section">
        <div class="content">
          <h1 runat="server" id="welcomeMessage"></h1>
          <div class="search-form">
            <input type="text" placeholder="Search for any service..." required />
            <button class="material-symbols-outlined" type="submit">
              search
            </button>
          </div>
          <div class="popular-tags">
            Popular:
            <ul class="tags">
              <li><a href="#">Website Design</a></li>
              <li><a href="#">Logo Design</a></li>
              <li><a href="#">WordPress</a></li>
              <li><a href="#">AI Design</a></li>
            </ul>
          </div>
        </div>
      </section>
        </div>
    </form>
</body>
</html>
