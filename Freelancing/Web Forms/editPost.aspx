<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editPost.aspx.cs" Inherits="Freelancing.Web_Forms.editPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Post</title>
    <link rel="stylesheet" href="../Styles/newPost.css" />
</head>
<body>
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
            <section class="post-section">
      <div class="post-container">
        <h2 class="post-title">Edit the post!</h2>
          <div class="form-group">
            <asp:TextBox ID="titleText" runat="server" placeholder="Title" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:TextBox ID="categoryText" runat="server" placeholder="Category" Required="true"></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:TextBox ID="priceText" runat="server" placeholder="Price" Required="true" TextMode="Number"></asp:TextBox>
          </div>
          <div class="form-group">
            <asp:TextBox ID="descriptionText" runat="server" placeholder="Description" Required="true" CssClass="description"></asp:TextBox>
          </div>
            <div class="form-group">
                    <label for="Post picture">Post Picture (optional):</label>
                    <asp:FileUpload ID="postPic" runat="server" />
            </div>
          <asp:Button runat="server" ID="btnPost" CssClass="post-btn" Text="Edit" OnClick="btnPost_Click" />

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
