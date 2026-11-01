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


  List<Videojuego> getVideojuegos(){
    return videojuegos;
  }


  Videojuego? buscarVideoxogoCodigo(int codigoBuscado){
    if(videojuegos.isNotEmpty){
       for(Videojuego v in videojuegos){
          if(v.codigo == codigoBuscado ){
            return v;
          }
        }
      return null;
    }
   return null;
  }

  void eliminarVideoXogo(Videojuego v){
    videojuegos.remove(v);
  }



  List<Videojuego> buscarPorPalabra(String palabra){
    List<Videojuego> listaVideoxogos = [];
    if(videojuegos.isNotEmpty){
      for(Videojuego v in videojuegos){
        if(v.nombre.trim().toLowerCase().contains(palabra.trim().toLowerCase())|| v.genero.name.trim().toLowerCase() ==  palabra.toLowerCase()){
          listaVideoxogos.add(v);
        }

      }
      
    } 
  
      return listaVideoxogos;
    
    
  }

  
  




  
}