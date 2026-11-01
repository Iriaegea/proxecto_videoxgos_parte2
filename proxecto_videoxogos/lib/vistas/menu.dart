
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:proxecto_cideo/modelo/Almacen.dart';
import 'package:proxecto_cideo/modelo/Dispositivo.dart';
import 'package:proxecto_cideo/modelo/Generos.dart';
import 'package:proxecto_cideo/modelo/TipoDispositivo.dart';
import 'package:proxecto_cideo/modelo/Videojuego.dart';
class Menu {

  Almacen almacenDeIria = Almacen.vacio();
    
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

  bool comprobarRango(int opcion){ // comprobar si la opción elegida está en el menú
    if(opcion < 0 || opcion > 6){
      return false;
    }
     return true;
  }

  bool comprobarRangoEnum(int opcion){// comprobar si la opcion elegida está entre las opciones que imprimo del enum
      if(opcion <= 0 || opcion > 4){
      return false;
    }
     return true;
  }

  bool validarString(String? nome){ //compruebo si han escrito algo y no acepto que escriban solo espacios
    if (nome != null && nome.trim().isNotEmpty){
      return true;
    } else {
      return false;
    }
  }
  bool validarStringSN(String? resposta){ //compruebo si han escrito una "s" o una "n" 
    if (resposta != 's' && resposta != 'n') {
    print("Escribe S ou N.");
    return false;
    }

  return true;
  }
  double? validarDouble(String? prezo){ // compruebo si han escrito algo y si es un double. 
    if(prezo != null && double.tryParse(prezo) != null){
      return double.tryParse(prezo);
    }
      return null;
    
  }

  
  


  void cargarDatosExemplo(){
    int codigo;
    List<Dispositivo> listaDispositivosV1=[]; 
    List<Dispositivo> listaDispositivosV2=[]; 
    List<Dispositivo> listaDispositivosV3=[]; 
    List<Dispositivo> listaDispositivosV4=[]; 
    Dispositivo pc = Dispositivo(TipoDispositivo.pc);
    Dispositivo nintendo = Dispositivo(TipoDispositivo.nintendo);
    Dispositivo xbox =  Dispositivo(TipoDispositivo.xbox);

    print("Cargando datos de exemplo: ");
    codigo = almacenDeIria.calcularCodigo(); 
    listaDispositivosV1.add(pc);
    Videojuego v1 = Videojuego(codigo: codigo, nombre: "Minecraft", precio: 20, genero: Generos.aventura, dispositivos: listaDispositivosV1, stock: 49);
    almacenDeIria.engadirVideoxogo(v1);

    
    listaDispositivosV2.add(nintendo);
    listaDispositivosV2.add(xbox);
    listaDispositivosV2.add(pc);
    codigo = almacenDeIria.calcularCodigo();
    Videojuego v2 = Videojuego(codigo: codigo, nombre: "Mario Kart", precio: 43, genero: Generos.carreras, dispositivos: listaDispositivosV2, stock: 134);
    almacenDeIria.engadirVideoxogo(v2);

    
    listaDispositivosV3.add(nintendo);
    codigo = almacenDeIria.calcularCodigo();
    Videojuego v3 = Videojuego(codigo: codigo, nombre: "Animal Crossing New Leaf", precio: 50, genero: Generos.rol, dispositivos: listaDispositivosV3, stock: 49);
    almacenDeIria.engadirVideoxogo(v3);
    

    codigo = almacenDeIria.calcularCodigo();
    listaDispositivosV4.add(pc);
    Videojuego v4 = Videojuego(codigo: codigo, nombre: "Los sims 4", precio: 78, genero: Generos.rol, dispositivos: listaDispositivosV4, stock: 30);
    almacenDeIria.engadirVideoxogo(v4);
    print("Datos de exemplo cargados!");
  }

  void engadirVideoxogo(){
    String? nome = "", prezo ="", xenero = "", dispositivo = "", stock ="";
    bool eValido= false;
    double? prezoTransformado;
    Generos xeneroEnum = Generos.aventura;
    int? opcionXenero;
    int? opcionDispositivo;
    List<Dispositivo> listaDispositivos = [];
    String? respuestaSN;
    bool engadirOutroDisp = false;
    int? stockInt = 0;
    int codigo;
    print("Introduce os datos do novo videoxogo:\n ");

    do{
      print("\nNome: ");
      nome=stdin.readLineSync();
      

      if(validarString(nome)){
        eValido = true;
      } else {
        print("O nome introducido non é válido");
      }
    }while(!eValido);  


    do{
      print("\nPrezo: ");
      prezo = stdin.readLineSync();

      prezoTransformado = validarDouble(prezo);

    }while(prezoTransformado == null);
    

     eValido = false;

    do{
      print("\nXénero: ");
      print("\tEscolle unha opción: ");
      print("\t 1. Aventura");
      print("\t 2. Deportes");
      print("\t 3. Rol");
      print("\t 4. Carreras");
      print("Opcion: ");

      xenero = stdin.readLineSync();
      opcionXenero = comprobarNumero(xenero);
      if(opcionXenero == null || !comprobarRangoEnum(opcionXenero)){
         print("Introduce un número do menú");
         eValido = false;
      } else {
        xeneroEnum = Generos.values[opcionXenero -1];
        eValido = true;
      }
     
    }while(!eValido);
    
    eValido = false;

    do{
      
      
      print("\nDispositivo: ");
      print("\tElixe unha opción: ");
      print("\t 1. pc");
      print("\t 2. playstation");
      print("\t 3. xbox");
      print("\t 4. nindento");
      print("Opcion: ");

      dispositivo = stdin.readLineSync();
      opcionDispositivo = comprobarNumero(dispositivo);
      if(opcionDispositivo == null || !comprobarRangoEnum(opcionDispositivo)){
         print("Introduce un número do menú");
         eValido = false;
      } else {
        Dispositivo d  = Dispositivo(TipoDispositivo.values[opcionDispositivo -1]);
        listaDispositivos.add(d);
        eValido = true;
        do{
          print("Queres engadir máis dipositivos?(S/N): ");
          respuestaSN = stdin.readLineSync();
          if(!validarString(respuestaSN)){
            print("A opción introducida non é correcta, escribe 'S' OU 'N'");
          }else if(respuestaSN?.trim().toLowerCase() == "s"){
            engadirOutroDisp = true;
          } else {
            engadirOutroDisp = false;
          }
        }while(!validarStringSN(respuestaSN));
        
      }
    } while(!eValido || engadirOutroDisp);
    
    eValido = false;

    do{
      print("\nStock: ");
      stock = stdin.readLineSync();
      stockInt = comprobarNumero(stock);
      if(stockInt == null){
        print("Introduce un número");
        eValido = false;
      } else {
        eValido = true;
      }

    }while(!eValido);
    
    codigo = almacenDeIria.calcularCodigo();

    Videojuego v = Videojuego(codigo: codigo, nombre: nome!, precio: prezoTransformado, genero: xeneroEnum, dispositivos: listaDispositivos, stock: stockInt!);
    almacenDeIria.engadirVideoxogo(v);
    print("Videoxogo engadido");

  }

  void mostrarVideoxogos(){
    List<Videojuego> videojuegos = almacenDeIria.getVideojuegos();
    print("\nLista de videojuegos: ");

    if(videojuegos.isNotEmpty){
      for(int i = 0; i < videojuegos.length; i ++){
        print(videojuegos[i]);

        if((i +1) % 3 == 0 && i+1 < videojuegos.length){
          print("Pulsa enter para continuar");
          stdin.readLineSync();
        }

      }
    } else {
      print("No hay videojuegos en el almacén");
    }

  }



  void modificarVideoxogo(){
    String? codigoModificarString;
    mostrarVideoxogos();

    print("Cal é o código do videoxogo que queres modificar?: ");
    codigoModificarString = stdin.readLineSync();



  }




  


}

 