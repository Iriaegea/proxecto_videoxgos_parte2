import 'Generos.dart';
import 'Dispositivo.dart';
class Videojuego{
  int codigo;
  String nombre;
  double precio;
  Generos genero;
  List<Dispositivo> dispositivos;
  int stock;
  
  Videojuego({required this.codigo, required this.nombre, required this.precio, required this.genero,required this.dispositivos, required this.stock});


  @override
  String toString(){
  return "\nCódigo: ${this.codigo}, Nombre: ${this.nombre}, Precio: ${this.precio}, Genero: ${this.genero}, Dispositivo/s: ${this.dispositivos}, Stock: ${this.stock}";
  }

  
}