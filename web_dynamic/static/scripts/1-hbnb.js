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
