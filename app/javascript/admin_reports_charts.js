$(document).ready(() => {
    $('#div-average, #div-absence').hide()
  })
  $(document).ready(() => {
    $("#btn-attendance").click(() => {
      $("#div-attendance").show();
      $("#div-average,#div-absence").hide();
    });
    $("#btn-average").click(() =>{
      $("#div-average").show();
      $("#div-attendance,#div-absence").hide();
    });
    $("#btn-absence").click(() => {
      $("#div-absence").show();
      $("#div-attendance,#div-average").hide();
    });
});

