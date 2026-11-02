import 'Videojuego.dart';

class VideojuegoDigital extends Videojuego{
  double _tamano;
  
  VideojuegoDigital({
    required super.codigo,
    required super.nombre,
    required super.precio,
    required super.genero,
    required super.dispositivos,
    required super.stock,
    required this._tamano,
  });


  double get tamano => _tamano;
  set tamano(double tamanoNuevo){
    _tamano = tamanoNuevo;
  }


  @override
  String toString(){
    return "${super.toString()}, Tamaño: $tamano GB";
    
    }

}