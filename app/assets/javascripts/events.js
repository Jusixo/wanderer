// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

  $('body').on('click', '.favorite-photo', function(event) {
    let favorited = $(this).hasClass('favorited')

    $(this).toggleClass('favorited')

    let photoid = $(this).data('photo-id')
    let eventid = $(this).data('event-id')

    console.log(`clicked on a heart ${eventid}`)

    let url = favorited ? `/events/${eventsid}/photos/${photoid}/unfavorite` : `/events/${eventsid}/photos/${photoid}/favorite`

    $.ajax({
      method: 'POST',
      url: url,
      dataType: 'script'
    })
  })
})
