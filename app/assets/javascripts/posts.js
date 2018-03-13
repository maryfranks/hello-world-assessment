// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("DOMContentLoaded", function() {
  var postDoneButton = document.querySelector('#submit-post');
  var allPosts = document.querySelector('#all-posts');
  var post = document.querySelector('#post_text')

  postDoneButton.addEventListener('submit', function(event) {
    event.preventDefault();
    console.log("Submitting post");
    $.ajax({
      url: '/posts',
      method: 'post',
      data: $(post).serialize(),
    }).done(function(data) {
      console.log("done");
      var newPost = document.createElement('p');
      newPost.innerText = data;
      allPosts.append(newPost);
      postDoneButton.reset();
      postDoneButton.disabled = false;
      console.log("all finished");
    });
  });
});
