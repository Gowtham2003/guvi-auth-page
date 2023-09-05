$.ajax({
  type: "GET",
  url: "api/auth.php",
  success: function (data) {
    window.location.href = "dashboard.html";
  },
});
$("#register-form").submit(function (e) {
  e.preventDefault();
  var form = $(this);
  $.ajax({
    type: "POST",
    url: "api/register.php",
    data: form.serialize(),
    success: function (data) {
      console.log(data);
      if (data["success"]) {
        swal({
          icon: "success",
          title: "Success",
          text: data["message"],
        }).then(function () {
          window.location.href = "dashboard.html";
        });
      } else {
        swal({
          icon: "error",
          title: "Registration Failed",
          text: data["message"],
        });
      }
    },
    error: function (xhr, status, error) {
      swal("Error!", "Could not process your request!", "error");
      console.log("Error:", error);
    },
  });
});
