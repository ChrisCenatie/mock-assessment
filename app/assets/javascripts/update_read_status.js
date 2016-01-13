$(document).ready(function() {
  $('button').on('click', updateLink);
})

function updateLink() {
  var linkId = this.parentNode.className.split("link")[1];
  var updateStatus = this.value;

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PUT',
    data: {link: {read_status: updateStatus}},
    success: function() {
      if (updateStatus === "Read") {
        this.value = "Unread";
        $(this).html("Mark as Unread");
      }
      if (updateStatus === "Unread") {
        this.value = "Read";
        $(this).html("Mark as Read");
      }
    }.bind(this),
    error: function(){
      console.log(response.body);
    }
  });
}
