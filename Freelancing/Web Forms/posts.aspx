<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="posts.aspx.cs" Inherits="Freelancing.Web_Forms.posts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Posts</title>
    <link rel="stylesheet" href="../Styles/posts.css" />
</head>
<body>
    <form id="form1" runat="server">
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
        <div class="posts-grid">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <a href='<%# "postDetails.aspx?Post_id=" + Eval("Post_id") %>' style="display:flex; text-decoration:none; color:white; ">
                    <div class="custom-video-container">
                        <div class="video-thumbnail">
                            <asp:Image ID="imgThumbnail" runat="server" ImageUrl='<%# GetImageSrc(Eval("Image")) %>' AlternateText="Post Thumbnail" />
                        </div>
                    <div class="video-details">
                        <p class="name"><%# Eval("First_Name")+" "+ Eval("Last_Name") %></p>
                        <p class="title"><%# Eval("Title") %></p>
                        <p class="price"><%# "$ " + Eval("Price") + " / Hour" %></p>
                    </div>
                         </a>
                        </div>

            </ItemTemplate>
        </asp:Repeater>
            </div>
    </form>
</body>
</html>
