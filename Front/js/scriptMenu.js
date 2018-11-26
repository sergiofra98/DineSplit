datoRestaurante = [
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    },
    {
        img: "img/chilis/01.jpg",
        nombre: "Fried Cheese",
        descripcion: "Breaded Mozzarella cheese sticks, accompanied by Marinara sauce.",
        precio: 150,
        tipo: "Appetizer"
    }

]


function insertarAlimentos(){
    append = "";

    for( let i = 0; i < datoRestaurante.length; i++){
        append += '<div class="col-4 alimento"><div><img src="' + datoRestaurante[i].img + '" width="100%"></div><div>'
        append += '<h4>' + datoRestaurante[i].nombre + '</h4>'
        append += '<p>' + datoRestaurante[i].descripcion  + '</p>'
        append += '<select class="form-control"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select>'
        append += '<h3 class="float-right">$' + datoRestaurante[i].precio + '</h3>'
        append += '</div><div><button class="btn btn-warning">Add to order</button></div></div>'
    }
    
    

    $('#insertarAlimentos').html(append)
}
