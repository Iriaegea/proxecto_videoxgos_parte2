import 'package:proxecto_cideo/modelo/Videojuego.dart';

class Almacen {
  List<Videojuego> videojuegos;
  

  Almacen ({required this.videojuegos});


  bool engadirVideoxogo(){
    int codigo = videojuegos.length() +1;
    Videojuego v = (codigo: codigo, nombre: nombre, precio:precio, dispositivos: dispositivos, stock: stock);
  }


  
}