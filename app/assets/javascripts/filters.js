$(document).ready(function() {
  $('#filter-status').on('change', filterByLinkStatus);
})

function filterByLinkStatus() {
  var status = this.value;
  if(status === "read") {
    $(".Read").show();
    $(".Unread").hide();
  } else if(status === "unread"){
    $(".Read").hide();
    $(".Unread").show();
  } else {
    $(".Read").show();
    $(".Unread").show();
  }
}
