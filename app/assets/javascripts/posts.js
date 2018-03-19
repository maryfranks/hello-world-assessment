document.addEventListener("DOMContentLoaded", function() {

  if (document.querySelector('.new_post')) {

    var input = document.getElementById('post_city');
    var autocomplete = new google.maps.places.Autocomplete(input,{types: ['(cities)']});
    google.maps.event.addListener(autocomplete, 'place_changed', function(){
      var place = autocomplete.getPlace();
    });

    var postDoneButton = document.querySelector('#submit-post');
    var allPosts = document.querySelector('#all-posts');
    var getCityInfo = document.querySelector('#city-info');
    var latitude = document.querySelector('#post_lat');
    var longitude = document.querySelector('#post_long');
    var weather = document.querySelector('#post_weather');

    getCityInfo.addEventListener('click', function(event) {
      var city = document.querySelector('#post_city').value;
      getLatLong(city);
      getWeather(city);
      document.querySelector('#submit-post-button').disabled = false;
      document.querySelector('#submit-post-button').reset
    });

    postDoneButton.addEventListener('submit', function(event) {
      event.preventDefault();
      console.log("Submitting post");
      $.ajax({
        url: '/posts',
        method: 'post',
        data: $("form").serialize(),
      }).done(function(data) {
        window.google = {}
        console.log("done");
        var newPost = document.createElement('p');
        newPost.innerText = data;
        allPosts.append(newPost);
        postDoneButton.reset();
        console.log("all finished");
      });
    });

    function getLatLong(city) {
      console.log(city);
      $.ajax({
        url: "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=" + city,
        method: 'get',
        dataType: 'json'
      }).done(function(data) {
        window.google = {}
        console.log("I got the data!");
        latitude.value = data.results[0].geometry.bounds.northeast.lat;
        longitude.value = data.results[0].geometry.bounds.northeast.lng;
      });
    }

    function getWeather(city) {
      $.ajax({
        url: "http://api.apixu.com/v1/current.json?key=227cb2de815b4963a94235625181303&q=" + city,
        method: 'get',
        dataType: 'json',
      }).done(function(data) {
        console.log("I got the weather!");
        weather.value = data.current.temp_c;
      });
    }
  }
});
