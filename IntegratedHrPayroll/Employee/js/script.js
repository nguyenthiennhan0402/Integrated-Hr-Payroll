// change language
function changeLanguage() {
  var button = document.getElementById("languageButton");
  var currentLanguage = button.innerHTML;
  var newLanguage = "";

  if (currentLanguage === "EN") {
    newLanguage = "VN";
  } else if (currentLanguage === "VN") {
    newLanguage = "EN";
  }

  button.innerHTML = newLanguage;
}

// change color left menu and href
$(function () {
  function loadContent(targetPage) {
    $.ajax({
      url: targetPage,
      method: "GET",
      dataType: "html",
      success: function (response) {
        $("#container").html(response);
      },
      error: function (xhr, status, error) {
        console.log(error);
      },
    });
  }

  function initialize() {
    $("#header").load("header.html");
    $("#nav").load("nav.html");
    $("#container").load("profile.html");

    $("#nav").on("click", ".nav-link", function () {
      var targetPage = $(this).attr("data-page");
      history.pushState(null, "", targetPage);
      $(".nav-link").removeClass("active");
      $(this).addClass("active");
      $("#container").load(targetPage);
    });

    window.onpopstate = function (event) {
      var targetPage = window.location.href.split("/").pop();
      $("#container").load(targetPage);
    };

    window.addEventListener("pageshow", function (event) {
      var historyTraversal =
        event.persisted ||
        (typeof window.performance != "undefined" &&
          window.performance.nav.type === 2);
      if (historyTraversal) {
        // Tải lại các tài nguyên cần thiết ở đây
        location.reload();
      }
    });
  }

  initialize();
});

function changeAvtBtn() {
  var boxChangeAvt = document.querySelector(".box-change-avt");
  boxChangeAvt.style.display = "block";
}

// close btn
function closeBtn() {
  var boxChangeAvt = document.querySelector(".box-change-avt");
  var boxUpdate = document.querySelector(".box-update");
  boxChangeAvt.style.display = "none";
  boxUpdate.style.display = "none";
}

// update btn
function updateProfile() {
  var boxUpdate = document.querySelector(".box-update");
  boxUpdate.style.display = "block";
}

// update schedule
// function showLoadingImage() {
//   var loadingImg = document.getElementById('loadingImg');
//   loadingImg.style.display = 'block';
// }

// function addClickEvent() {
//   var updateBtn = document.getElementById('updateBtn');
//   updateBtn.addEventListener('click', showLoadingImage);
// }

// window.onload = addClickEvent;

// account & benefit

// // Hàm vẽ biểu đồ lương
// function drawSalaryChart() {
//   // Dữ liệu lương của nhân viên trong 3 tháng gần nhất
//   const salaryData = [
//     { month: "Tháng 1", salary: 1000 },
//     { month: "Tháng 2", salary: 2000 },
//     { month: "Tháng 3", salary: 1500 },
//   ];
//   new Chart(document.getElementById("salary").getContext("2d"), {
//     type: "bar",
//     data: {
//       labels: salaryData.map((row) => row.month),
//       datasets: [
//         {
//           data: salaryData.map((row) => row.salary),
//           backgroundColor: "#44b2f2",
//           background: "#44b2f2",
//           borderWidth: 1,
//           borderRadius: 10,
//           hoverBackgroundColor: "#55c3a3",
//         },
//       ],
//     },
//     options: {
//       responsive: false,
//       maintainAspectRatio: false,
//       scales: {
//         y: {
//           beginAtZero: true,
//         },
//       },
//       plugins: {
//         legend: {
//           display: false,
//         },
//       },
//     },
//   });
// }
