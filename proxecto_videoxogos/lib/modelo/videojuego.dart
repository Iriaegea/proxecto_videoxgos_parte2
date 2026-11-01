import 'Generos.dart';
import 'Dispositivo.dart';
class Videojuego{
  // se puede acceder directamente a las propieddes sin necesidad de hacerlos privados pero de esta manera es más controlado (si son públicos no hacen falta getters ni setters)
  int _codigo;
  String _nombre;
  double _precio;
  Generos _genero;
  List<Dispositivo> _dispositivos;
  int _stock;
  
  Videojuego({required this._codigo, required this._nombre, required this._precio, required this._genero,required this._dispositivos, required this._stock});

  int get codigo => _codigo;
  set codigo(int codigoNuevo){
    _codigo = codigoNuevo;
  }

  String get nombre => _nombre;
  set nombre(String nombreNuevo){
    _nombre = nombreNuevo;
  }

  double get precio => _precio;
  set precio(double precioNuevo){
    _precio = precioNuevo;
  }
  Generos get genero => _genero;
  set genero(Generos generoNuevo){
    _genero = generoNuevo;
  }

  List<Dispositivo> get dispositivos => _dispositivos;
  set dispositivos(List<Dispositivo> listaNueva){
    _dispositivos = listaNueva;
  }

  int get stock => _stock;
  set stock(int stockNuevo){
    _stock = stock;
  }


  @override
  String toString(){
  return "\nCódigo: ${this.codigo}, Nombre: ${this.nombre}, Precio: ${this.precio}, Genero: ${this.genero}, Dispositivo/s: ${this.dispositivos}, Stock: ${this.stock}";
  }


  

  
}