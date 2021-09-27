document.addEventListener('DOMContentLoaded', (event) => {
  // check api status
  $.get('http://127.0.0.1:5001/api/v1/status/', function (data, status) {
  // $.get('http://0.0.0.0:5001/api/v1/status/', function (data, status) {
    if (status === 'success') {
      $('div#api_status').addClass('available');
    } else { $('div#api_status').removeClass('available'); }
  });

  // show amenities list dynamicaly
  const general = [];
  const dictAmenities = {};
  const dictCities = {};
  const dictStates = {};

  $('.amenities input[type=checkbox]').on('click', function () {
    const id = $(this).attr('data-id');
    const name = $(this).attr('data-name');
    if (dictAmenities[name]) {
      delete dictAmenities[name];
    } else { // delete the id of the amenity
      dictAmenities[name] = id;
      general.push(name);
    }
    let text = '';
    for (let i = 0; Object.entries(dictAmenities)[i]; i++) {
      if (i > 0) { text += ', '; }
      text += Object.entries(dictAmenities)[i][0];
    }
    $('.amenities h4').text(text);
  });

  $('.st').on('click', function () {
    const id = $(this).attr('data-id');
    const name = $(this).attr('data-name');
    if (dictStates[name]) {
      delete dictStates[name];
      let index = general.indexOf(name);
      general.splice(index, 1);
    } else { // delete the id of the amenity
      dictStates[name] = id;
      general.push(name);
    }
    $('.locations h4').text(general.join(', '));
  });

  $('.ci').on('click', function () {
    const id = $(this).attr('data-id');
    const name = $(this).attr('data-name');
    if (dictCities[name]) {
      delete dictCities[name];
      let index = general.indexOf(name);
      general.splice(index, 1);
    } else { // delete the id of the amenity
      dictCities[name] = id;
      general.push(name);
    }
    $('.locations h4').text(general.join(', '));
  });

  $.ajax({
    url: 'http://127.0.0.1:5001/api/v1/places_search/',
    // url: 'http://0.0.0.0:5001/api/v1/places_search/',
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
    $.ajax({
      url: 'http://127.0.0.1:5001/api/v1/places_search/',
      // url: 'http://0.0.0.0:5001/api/v1/places_search/',
      headers: { 'Content-Type': 'application/json' },
      method: 'POST',
      data: JSON.stringify({ 'amenities': Object.values(dictAmenities), 'cities': Object.values(dictCities), 'states': Object.values(dictStates) }),
      success: function (data2) {
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
