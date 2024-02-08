<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Freelancing.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Index</title>
    <link rel="stylesheet" href="../Styles/index.css" />
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
        <a href="#" class="logo">
          <img src="../Images/im3.png" alt="Fiverr Logo" style="width: 50px" />
            <p>Freelance Fusion</p>
        </a>
        <ul class="menu-links">
          <li><a href="./login.aspx">Sign In</a></li>
          <li class="join-btn"><a href="./signup.aspx">Join Us</a></li>
          <span id="close-menu-btn" class="material-symbols-outlined"
            >close</span
          >
        </ul>
        <span id="hamburger-btn" class="material-symbols-outlined">menu</span>
      </nav>
    </header>

    <section class="hero-section">
      <div class="content">
        <h1>Find the right freelance service, right away</h1>
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
            <footer class="footer">
    <div class="wrapper">
      <div class="footer_top">
        <div class="footer_top_list">
          <h5>Services</h5>
          <ul>
              <a href="#">Web Development</a>
              <a href="#">UI/UX Designer</a>
              <a href="#">AI Development</a>
              <a href="#">Quality Assurance</a>
              <a href="#">Business Consultant</a>
              <a href="#">Data Enginner</a>
          </ul>
        </div>
        <div class="footer_top_list">
          <h5>Features</h5>
          <ul>
              <a>Sign in</a>
              <a href="#">Find Freelance Clients Worldwide</a>
              <a href="#">Find Freelance Clients in Lebanon</a>
          </ul>
        </div>

        <div class="footer_top_list">
          <h5>Help & Support</h5>
          <ul>
              <a href="#">Contact US</a>
              <a href="#">FAQS</a>
          </ul>
        </div>
      </div>
      <div class="footer_bottom">
        <p>© 2023 - 2024 FreelancingFusion® Global Inc.</p>
      </div>
    </div>
  </footer>

    <script>
      const header = document.querySelector("header");
      const hamburgerBtn = document.querySelector("#hamburger-btn");
      const closeMenuBtn = document.querySelector("#close-menu-btn");

      // Toggle mobile menu on hamburger button click
      hamburgerBtn.addEventListener("click", () =>
        header.classList.toggle("show-mobile-menu")
      );

      // Close mobile menu on close button click
      closeMenuBtn.addEventListener("click", () => hamburgerBtn.click());
    </script>
        </div>
    </form>
</body>
</html>
