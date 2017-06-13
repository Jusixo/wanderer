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

  $('.demo').click(function() {
    let liveVideo = document.getElementById('about')
    html2canvas(liveVideo, {
      onrendered: function(canvas) {
        document.body.appendChild(canvas);
      }
    })
  })

  $('.button').click(function(){
    var buttonId = $(this).attr('id');
    $('#modal-container').removeAttr('class').addClass(buttonId);
    $('body').addClass('modal-active');
  })

  $('#modal-container').click(function(){
    $(this).addClass('out');
    $('body').removeClass('modal-active');
  });
})
