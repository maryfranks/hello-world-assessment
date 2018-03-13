document.addEventListener("DOMContentLoaded", function() {

  var submitReplyButton = document.querySelector('#submit-reply-form');
  var allReplies = document.querySelector('.replies');
  var reply = document.querySelector('#reply')

  submitReplyButton.addEventListener('submit', function(event) {
    event.preventDefault();
    console.log("Submitting reply");
    var link = submitReplyButton.action
    $.ajax({
      url: link,
      method: 'post',
      data: $(reply).serialize(),
    }).done(function(data) {
      console.log("done");
      var newReply = document.createElement('p');
      newReply.innerText = data;
      allReplies.append(newReply);
      submitReplyButton.reset();
      submitReplyButton.disabled = false;
      console.log("all finished");
    });
  });
});
