<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myPosts.aspx.cs" Inherits="Freelancing.Web_Forms.myPosts" EnableEventValidation="false" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Posts</title>
    <link rel="stylesheet" href="../Styles/myPosts.css" />
</head>
<body>
    <form id="form1" runat="server">
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
        <h1 runat="server" id="noPosts" style ="position:relative;left:50px;top:150px;"></h1>
        <div class="posts-grid">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                    <div class="custom-video-container">
                        <div class="video-thumbnail">
                            <asp:Image ID="imgThumbnail" runat="server" ImageUrl='<%# GetImageSrc(Eval("Image")) %>' AlternateText="Post Thumbnail" />
                        </div>
                    <div class="video-details">
                        <p class="name"><%# Eval("First_Name")+" "+ Eval("Last_Name") %></p>
                        <p class="title"><%# Eval("Title") %></p>
                        <p class="price"><%# "$ " + Eval("Price") + " / Hour" %></p>
                        <div class ="buttons-container">
                        <asp:Button ID="Button1" runat="server" Text="Delete" OnClientClick='<%# "return deletePost(" + Eval("Post_id") + ");" %>' style="border-radius: 6px;
        box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.05);
        padding: 9px 13px 9px 11px;
        width: 115px;
        background-color:#F87979;
        color:white;
        margin-top: 15px;
        font-weight: 500;
        cursor:pointer;"/>
                            <asp:Button ID="Button2" runat="server" Text="Edit" PostBackUrl='<%# "editPost.aspx?Post_id=" + Eval("Post_id") %>' style="border-radius: 6px;
        box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.05);
        padding: 9px 13px 9px 11px;
        width: 115px;
        margin-top: 15px;
        font-weight: 500;
        cursor:pointer;"  />
                            </div>
                    </div>
                        </div>

            </ItemTemplate>
        </asp:Repeater>
            </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
    function deletePost(postId) {
        if (confirm("Are you sure you want to delete this post?")) {
            $.ajax({
                type: "POST",
                url: "myPosts.aspx/DeletePost",
                data: '{postId: ' + postId + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("Post deleted successfully");
                    location.reload();
                },
                error: function (response) {
                    alert("Error deleting post");
                }
            });
            return false;
        }
    }
    </script>

</body>
</html>
