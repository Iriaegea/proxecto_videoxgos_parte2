import 'Videojuego.dart';

class VideojuegoFisico extends Videojuego{
  int _numeroDeDiscos;
  
  VideojuegoFisico({
    required super.codigo,
    required super.nombre,
    required super.precio,
    required super.genero,
    required super.dispositivos,
    required super.stock,
    required this._numeroDeDiscos,
  });


  int get numeroDeDiscos => _numeroDeDiscos;
  set numeroDeDiscos(int numeroNuevo){
    _numeroDeDiscos = numeroNuevo;
  }


  @override
  String toString(){
    return "${super.toString()}, Núero de discos: $_numeroDeDiscos ";
    
    }

}