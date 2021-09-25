document.addEventListener('DOMContentLoaded', (event) => {
  const dict = {};
  $('input[type=checkbox]').on('click', function () {
    const amenityId = $(this).attr('data-id');
    const amenityName = $(this).attr('data-name');

    if (dict[amenityName]) {
      delete dict[amenityName];
    } else { // delete the id of the amenity
      dict[amenityName] = amenityId;
    }
    let text = '';
    for (let i = 0; Object.entries(dict)[i]; i++) {
      if (i > 0) { text += ', '; }
      text += Object.entries(dict)[i][0];
    }
    $('.amenities h4').text(text);
  });
});

$(document).ready(function () {
  $.get('http://0.0.0.0:5001/api/v1/status/', function (data, status) {
    console.log(status);
    if (status === 'OK') {
      $('div#api_status').addClass('available');
    } else { $('div#api_status').removeClass('available'); }
  });
});
