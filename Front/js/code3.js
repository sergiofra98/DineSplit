function filter(etiqueta) {
  var arreglo, etiqueta;

  arreglo = document.getElementsByClassName("column");

  for (let i = 0; i < arreglo.length; i++) {
    if (arreglo[i].id == etiqueta || etiqueta == "all") {
      arreglo[i].style.display = "block";
    } else {
      arreglo[i].style.display = "none";
    }
  }
}
