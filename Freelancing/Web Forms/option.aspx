<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="option.aspx.cs" Inherits="Freelancing.option" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Join as a Client or Freelancer</title>
    <link rel="stylesheet" href="../Styles/option.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="join-container">
      <h2>Join as a client or freelancer</h2>
      <form class="join-form">
        <div class="options-container">
          <label class="option">
            <input type="radio" name="role" value="client" runat="server" id="clientRadio" checked/>
            <span class="option-box">
              <img src="../images/search.svg" alt="Client Icon" />
              <span>I'm a client, hiring for a project</span>
            </span>
          </label>
          <label class="option">
            <input type="radio" name="role" value="freelancer" runat="server" id="freelancerRadio"/>
            <span class="option-box">
              <img src="../images/signature.svg" alt="Freelancer Icon" />
              <span>I'm a freelancer, looking for work</span>
            </span>
          </label>
        </div>
        <asp:Button ID="joinButton" runat="server" Text="Join" CssClass="create-account-btn" OnClick="joinButton_Click" />

      </form>

    </div>
        </div>
    </form>
</body>
</html>
