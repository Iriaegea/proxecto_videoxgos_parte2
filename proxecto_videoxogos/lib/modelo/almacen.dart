import 'package:proxecto_cideo/modelo/Videojuego.dart';
import 'Generos.dart';
class Almacen {
  List<Videojuego> videojuegos;
  

  Almacen ({required this.videojuegos});
  Almacen.vacio() : videojuegos = [];

  int calcularCodigo(){ //calculo el código en función del tamaño del array
    return videojuegos.length +1;
  }
  void engadirVideoxogo(Videojuego v){
    videojuegos.add(v);

    
   
  }
  




  
}