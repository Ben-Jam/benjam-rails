$(function() {
  navigator.getUserMedia  = navigator.getUserMedia ||
                            navigator.webkitGetUserMedia ||
                            navigator.mozGetUserMedia ||
                            navigator.msGetUserMedia;

  var errorCallback = function(e) {
      console.log('Reeeejected!', e);
  };

  var video = document.querySelector('video');
  var canvas = document.querySelector('canvas');
  var context = canvas.getContext('2d');
  var localMediaStream = null;

  function snapshot(e) {
    e.preventDefault();
    context.drawImage(video, 0, 0, 640, 480);
    // "image/webp" works in Chrome.
    // Other browsers will fall back to image/png.
    //document.querySelector('img').src = canvas.toDataURL('image/webp');
    $("video").hide();
    $("#snap").hide();
    $("canvas").show();
    $("#new_photo").show();
  };

  if (navigator.getUserMedia) {
    navigator.getUserMedia({video: true}, function(stream) {
      video.src = window.URL.createObjectURL(stream);
    }, errorCallback);
    video.addEventListener('click', snapshot, false);
  } else {
    video.outerHtml = '<input type="file" name="item[image]" id="item_image">'
  };

  document.getElementById("snap").addEventListener("click", snapshot);

  document.getElementById("new_photo").addEventListener("click", function(e) {
    e.preventDefault();
    $("video").show();
    $("#snap").show();
    $("canvas").hide();
    $("#new_photo").hide();
  });

});
