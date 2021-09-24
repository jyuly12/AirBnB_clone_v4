document.addEventListener('DOMContentLoaded', (event) => {
    let list = []

    $("input[type=checkbox]").on( "click", function () {
        let amenity = $(this).attr('data-id')
        if (list.indexOf(amenity) == -1 ) {
            list.push(amenity);
        } else { // delete the id of the amenity
            const index = list.indexOf(amenity);
            list.splice(index, 1);
        };
        console.log(list)
    }
)});
