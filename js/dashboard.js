function fetchData() {
  $.ajax({
    url: "api/profile.php",
    type: "GET",
    success: function ({ success, data }) {
      if (success) {
        $("#container").removeClass("d-none");
        // fill form with data
        $("#info-name").text(data["name"]);
        $("#info-contact-no").text(data["phone"]);
        $("#info-email").text(data["username"]);
        $("#info-dob").text(data["dob"]);
        $("#info-age").text(data["age"]);

        $("#name").val(data["name"]);
        $("#phone").val(data["phone"]);
        $("#username").val(data["username"]);
        if (data["dob"] == null) {
          // set current locale date
          var today = new Date();
          var dd = String(today.getDate()).padStart(2, "0");
          var mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
          var yyyy = today.getFullYear();

          today = yyyy + "-" + mm + "-" + dd;
          $("#date").val(today);
        } else $("#date").val(data["dob"]);
      }
    },
    error: function (xhr, status, error) {
      console.log(xhr, status, error);
      if (xhr.status === 401) {
        // Redirect to login page if authentication is required
        window.location.href = "index.html";
      } else {
        swal("Error!", "Could not process your request!", "error");
      }
    },
  });
}
$("#edit-info-toggle").click(function () {
  if ($("#info-form").hasClass("d-none")) {
    $("#info-form").removeClass("d-none");
    $("#info-table").addClass("d-none");
  } else {
    $("#info-form").addClass("d-none");
    $("#info-table").removeClass("d-none");
  }
});
$(document).ready(function () {
  fetchData();
});
$("#info-form").submit(function (e) {
  e.preventDefault();
  var form = $(this);
  $.ajax({
    type: "PUT",
    url: "api/profile.php",
    data: form.serialize(),
    success: function (data) {
      if (data["success"]) {
        swal("Success!", "Profile updated!", "success");
        fetchData();
        $("#info-form").addClass("d-none");
        $("#info-table").removeClass("d-none");
      } else {
        swal("Error!", data["message"], "error");
      }
    },
    error: function (err) {
      swal("Error!", "Could not process your request!", "error");
      console.log(err);
    },
  });
});
$("#logout").click(function () {
  // Perform AJAX request to logout.php
  $.ajax({
    url: "api/logout.php",
    method: "GET",
    success: function (response) {
      // Redirect to the login page after logout
      window.location.href = "index.html";
    },
    error: function (xhr, status, error) {
      // Handle errors
      swal("Error!", "Could not process your request!", "error");
      console.log("Logout error:", error);
    },
  });
});
$("#change-password-nav").click(function () {
  // replace html with login page
  $("#content-body").load("change-password.html");
});
