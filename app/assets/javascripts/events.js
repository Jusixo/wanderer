// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

  $('body').on('click', '.favorite-photo', function(event) {
    let favorited = $(this).hasClass('favorited')

    $(this).toggleClass('favorited')

    let photoid = $(this).data('photo-id')
    let eventid = $(this).data('event-id')

    console.log(`clicked on a heart ${eventid}`)

    let url = favorited ? `/events/${eventid}/photos/${photoid}/unfavorite` : `/events/${eventid}/photos/${photoid}/favorite`

    $.ajax({
      method: 'POST',
      url: url,
      dataType: 'script'
    })
  })

    let inner = document.getElementById('embeddedvideo')
    let canvas = document.getElementById('canvas')
    let context = canvas.getContext('2d')

    canvas.width = 500
    canvas.height = 600

    iframe2image(inner, function (err, img) {
      console.log('Inside the iframe2image')
      // If there is an error, log it
      if (err) { return console.error(err); }

      // Otherwise, add the image to the canvas
      context.drawImage(img, 0, 0);
      console.log('Grabbed an image')
    });
})
