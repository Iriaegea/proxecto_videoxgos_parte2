
import 'dart:io';
class Menu {
  String? mostrarMenu(){
    
    print("""\nMENÚ
    1. Cargar datos de exemplo
    2. Engadir videoxogo
    3. Modificar videoxogo
    4. Eliminar videoxogo
    5. Listar videoxogos
    6. Buscar videoxogo
    0. Saír\n""");
  
    stdout.write("Elixe unha opción: ");
    String? opcion = stdin.readLineSync();
    return opcion;

  }

  int? comprobarNumero( String? opcion){ // si es nulo o al intentar pasarlo a int es nulo, es que el dato metido no me sirve
      if(opcion!= null){
        return int.tryParse(opcion);
      }
      return null;
  }

  bool comprobarRango(int opcion){
    if(opcion < 0 || opcion > 6){
      return false;
    }
     return true;
  }

  String? validarNome(String? nome){

  }


  void cargarDatosExemplo(){

    print("Datos de exemplo cargados");
  }

  void engadirVideoxogo(){
    String? nome = "", prezo ="", xenero = "", dispositivo = "", stock ="";
    String nomeValidado;
    
    print("Introduce os datos do novo videoxogo:\n ");

    do{
      print("\nNome: ");
      nome=stdin.readLineSync();
      nomeValidado = validarNome(nome);

      if(nomeValidado)
    }while(!nomeValido);  
  
    
    print("\nPrezo: ");
    prezo = stdin.readLineSync();

    print("\nXénero: ");
    xenero = stdin.readLineSync();
    print("\nDispositivo: ");
    dispositivo = stdin.readLineSync();
    print("\nStock: ");
    stock = stdin.readLineSync();




  }


}

 