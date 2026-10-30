import 'package:proxecto_cideo/vistas/menu.dart';


void main(List<String> args) {
  bool opcionValida = false;
  String? opcionString = "";
  int? opcionInt = 1;

  //creo el menú (ya tiene las opciones creadas, no hay que pasarle nada al constructor):
  var menu = Menu();

  do{
    opcionString = menu.mostrarMenu(); // muestro el menú y guardo la opción, que es lo que han escrito por teclado sin revisar

    //compruebo si lo que me han escrito por teclado es un número y no es nulo
    //compruebo si el número está entre las opciones del menú
    opcionInt = menu.comprobarNumero(opcionString);

    if(opcionInt != null && menu.comprobarRango(opcionInt) == true){
      opcionValida = true;
      if(opcionInt != 0){
        switch(opcionInt){
          case 1:
          menu.cargarDatosExemplo();
          break;
          case 2:
          menu.engadirVideoxogo();
          break;
          case 3:
          menu.modificarVideoxogo();
          break;
          case 4:
          menu.eliminarVideoxogo();
          break;
          case 5:
          menu.listarVideoxogos();
          break;
          case 6:
          menu.buscarVideoxogo();
          break;
          
        }
      }
    } else {
      opcionValida = false;
    }
   
  }while(!opcionValida || opcionInt != 0);
  
  print("\nHas salido del programa");

}