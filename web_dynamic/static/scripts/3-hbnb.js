$(document).ready(function () {
$.ajax({
    type:"POST", // la variable type guarda el tipo de la peticion GET,POST,..
    url:"http://0.0.0.0:5001/api/v1/places_search", //url guarda la ruta hacia donde se hace la peticion
    data: {}, // data recive un objeto con la informacion que se enviara al servidor
    success:function(response){ //success es una funcion que se utiliza si el servidor retorna informacion
         console.log(response)
     },
	 error:function(error){
		 console.log(error)
	 }
})
})