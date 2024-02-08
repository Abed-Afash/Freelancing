<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="experience.aspx.cs" Inherits="Freelancing.experience" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Experience Questionnaire</title>
        <link rel="stylesheet" href="../Styles/experience.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="experience-container">
      <h2>A few quick questions: first, have you freelanced before?</h2>
      <p>
        This lets us know how much help to give you along the way. We won't
        share your answer with anyone else, including potential clients.
      </p>

      <form class="questionnaire-form" onsubmit="handleSubmit(); return false;">
        <div class="radio-container">
          <label class="radio-box">
            <input type="radio" name="experience" value="new" id="newFreelancer" runat ="server"/>
            <span class="box-content">
              <img src="../Images/search.svg" alt="New Icon" />
              <span>I am brand new to this</span>
            </span>
          </label>

          <label class="radio-box">
            <input
              type="radio"
              name="experience"
              value="some"
              id="someExperience"
              runat ="server"
            />
            <span class="box-content">
              <img src="../Images/signature.svg" alt="Some Experience Icon" />
              <span>I have some experience</span>
            </span>
          </label>
        </div>

        <div
          class="years-experience"
          id="yearsExperienceInput"
          style="display: none"
        >
          <asp:TextBox ID="years" runat="server" CssClass="years-input"  type = "number" placeholder="Years of Experience" />
        </div>

        <div class="buttons">
          <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="button back-btn" OnClick="btnBack_Click" />

          <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="button next-btn" OnClick ="Next" />
        </div>
      </form>
    </div>

    <script>
      document
        .getElementById("someExperience")
        .addEventListener("change", toggleYearsInputRequired);

      document
        .querySelectorAll('input[name="experience"]')
        .forEach(function (elem) {
          elem.addEventListener("change", function () {
            if (elem.value !== "some") {
              document.getElementById("yearsExperienceInput").style.display =
                "none";
              toggleYearsInputRequired();
            } else {
              document.getElementById("yearsExperienceInput").style.display =
                "block";
            }
          });
        });

      function toggleYearsInputRequired() {
        var yearsInput = document.getElementById("years");
        var isSomeExperienceChecked =
          document.getElementById("someExperience").checked;
        yearsInput.required = isSomeExperienceChecked;
      }
    </script>
        </div>
    </form>
</body>
</html>
