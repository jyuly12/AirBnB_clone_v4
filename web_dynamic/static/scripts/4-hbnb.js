document.addEventListener('DOMContentLoaded', (event) => {
  // check api status
  $.get('http://127.0.0.1:5001/api/v1/status/', function (data, status) {
  // $.get('http://0.0.0.0:5001/api/v1/status/', function (data, status) {
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

  $.ajax({
    // url: 'http://127.0.0.1:5001/api/v1/places_search/',
    url: 'http://0.0.0.0:5001/api/v1/places_search/',
    headers: { 'Content-Type': 'application/json' },
    method: 'POST',
    data: JSON.stringify({}),
    success: function (data) {
      for (let i = 0; Object.entries(data)[i]; i++) {
        let text = '<article> <div class="title_box"><h2>' + data[i].name + '</h2><div class="price_by_night">$' + data[i].price_by_night +
                    '</div></div><div class="information"><div class="max_guest">' + data[i].max_guest + ' Guest';
        if (data[i].max_guest !== 1) { text += 's'; }
        text += '</div><div class="number_rooms">' + data[i].number_rooms + ' Bedroom';
        if (data[i].number_rooms !== 1) { text += 's'; }
        text += '</div><div class="number_bathrooms">' + data[i].number_bathrooms + ' Bathroom';
        if (data[i].number_bathrooms !== 1) { text += 's'; }
        text += '</div></div><div class="description">' + data[i].description + '</div></article>';
        $('.places').append(text);
      }
    }
  });

  $('button').on('click', function () {
    console.log('dict', dict);
    $.ajax({
      // url: 'http://127.0.0.1:5001/api/v1/places_search/',
      url: 'http://0.0.0.0:5001/api/v1/places_search/',
      headers: { 'Content-Type': 'application/json' },
      method: 'POST',
      data: JSON.stringify({ 'amenities': Object.values(dict) }),
      success: function (data2) {
        console.log('data2', data2);
        let html = '';
        for (let i = 0; Object.entries(data2)[i]; i++) {
          let text = '<article> <div class="title_box"><h2>' + data2[i].name +
                      '</h2><div class="price_by_night">$' + data2[i].price_by_night +
                      '</div></div><div class="information"><div class="max_guest">' +
                      data2[i].max_guest + ' Guest';
          if (data2[i].max_guest !== 1) { text += 's'; }
          text += '</div><div class="number_rooms">' + data2[i].number_rooms + ' Bedroom';
          if (data2[i].number_rooms !== 1) { text += 's'; }
          text += '</div><div class="number_bathrooms">' + data2[i].number_bathrooms + ' Bathroom';
          if (data2[i].number_bathrooms !== 1) { text += 's'; }
          text += '</div></div><div class="description">' + data2[i].description + '</div></article>';
          html += text;
        }
        $('.places').html(html);
      }
    });
  });
});
