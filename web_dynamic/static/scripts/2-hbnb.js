document.addEventListener('DOMContentLoaded', (event) => {

  // check api status
  //$.get('http://127.0.0.1:5001/api/v1/status/', function (data, status) {
  $.get('http://0.0.0.0:5001/api/v1/status/', function (data, status) {
    if (status === 'success') {
      $('div#api_status').addClass('available');
    } else { $('div#api_status').removeClass('available'); }
  });

  // show amenities list dynamicaly
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
