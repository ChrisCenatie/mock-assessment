$(document).ready(function() {
  $('#filter-status').on('change', filterByLinkStatus);
  $('#search-terms').on('keyup',filterBySearchTerm);
});

function filterBySearchTerm(){
  var search = this.value;
  var links = $('.links');
  for (var i = 0; i < links.length; i++){
    if(!links[i].innerText.includes(search)){
      links[i].style.display = "none";
    } else if (search === "") {
      links[i].style.display = "block";
    }
  }
}

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
