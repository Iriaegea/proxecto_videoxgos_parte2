

import 'dart:io';


import 'package:proxecto_cideo/modelo/Almacen.dart';
import 'package:proxecto_cideo/modelo/Dispositivo.dart';
import 'package:proxecto_cideo/modelo/Generos.dart';
import 'package:proxecto_cideo/modelo/TipoDispositivo.dart';
import 'package:proxecto_cideo/modelo/Videojuego.dart';
import 'package:proxecto_cideo/modelo/VideojuegoDigital.dart';
import 'package:proxecto_cideo/modelo/VideojuegoFisico.dart';
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
    7. Mostrar videoxogos ordenados por precio
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
    if(opcion < 0 || opcion > 7){
      return false;
    }
     return true;
  }

  bool comprobarRangoModificar(int opcion){
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
    if(prezo != null && double.tryParse(prezo) != null ){
      if(double.tryParse(prezo)! > 0){
          return double.tryParse(prezo);
      }
    
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
    VideojuegoDigital v1 = VideojuegoDigital(codigo: codigo, nombre: "Minecraft", precio: 20, genero: Generos.aventura, dispositivos: listaDispositivosV1, stock: 49, tamano: 14);
    almacenDeIria.engadirVideoxogo(v1);

    
    listaDispositivosV2.add(nintendo);
    listaDispositivosV2.add(xbox);
    listaDispositivosV2.add(pc);
    codigo = almacenDeIria.calcularCodigo();
    VideojuegoDigital v2 = VideojuegoDigital(codigo: codigo, nombre: "Mario Kart", precio: 43, genero: Generos.carreras, dispositivos: listaDispositivosV2, stock: 134, tamano: 56);
    almacenDeIria.engadirVideoxogo(v2);

    
    listaDispositivosV3.add(nintendo);
    codigo = almacenDeIria.calcularCodigo();
    VideojuegoFisico v3 = VideojuegoFisico(codigo: codigo, nombre: "Animal Crossing New Leaf", precio: 50, genero: Generos.rol, dispositivos: listaDispositivosV3, stock: 49, numeroDeDiscos: 2);
    almacenDeIria.engadirVideoxogo(v3);
    

    codigo = almacenDeIria.calcularCodigo();
    listaDispositivosV4.add(pc);
    VideojuegoFisico v4 = VideojuegoFisico(codigo: codigo, nombre: "Los sims 4", precio: 78, genero: Generos.rol, dispositivos: listaDispositivosV4, stock: 30, numeroDeDiscos: 1);
    almacenDeIria.engadirVideoxogo(v4);
    print("Datos de exemplo cargados!");
  }


  String pedirNome(){
    String? nome;
    bool eValido = false;
    do{
      print("\nNome: ");
      nome=stdin.readLineSync();
      

      if(validarString(nome)){
        eValido = true;
      } else {
        print("O nome introducido non é válido");
      }
    }while(!eValido);  
    
    return nome!;
  }

  double pedirPrezo(){
    String? prezo;
    double? prezoTransformado;
    do{
      print("\nPrezo: ");
      prezo = stdin.readLineSync();

      prezoTransformado = validarDouble(prezo);

    }while(prezoTransformado == null);

    return prezoTransformado;
  }

  Generos pedirXenero(){
    bool eValido = false;
    String? xenero;
    int? opcionXenero;
    Generos xeneroEnum = Generos.aventura;
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

    return xeneroEnum;
  }


  List<Dispositivo> pedirDispositivos(){
    bool eValido = false;
    String? dispositivo;
    int? opcionDispositivo;
    List<Dispositivo> listaDispositivos = [];
    String? respuestaSN;
    bool engadirOutroDisp = false;
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


    return listaDispositivos;
  }


  int pedirStock(){
    bool eValido = false;
    String? stock;
    int? stockInt;
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

    return stockInt!;
  }

  int pedirNumeroDiscos(){
    String? numeroDiscos;
    int? numeroDiscosInt;
    bool eValido = false;
    do{
      print("\nNúmero de discos: ");
      numeroDiscos = stdin.readLineSync();
      numeroDiscosInt = comprobarNumero(numeroDiscos);
      if(numeroDiscosInt == null){
        print("Introduce un número");
        eValido = false;
      } else {
        eValido = true;
      }
    }while(!eValido);


    return numeroDiscosInt!;
    


  }


  double  pedirTamano(){
    String? tamano;
    double? tamanoDouble;
    bool eValido = false;
    do{
      print("\nTamaño: ");
      tamano = stdin.readLineSync();
      tamanoDouble = validarDouble(tamano);
      if(tamanoDouble == null){
        print("Introduce un número");
        eValido = false;
      } else {
        eValido = true;
      }
    }while(!eValido);


    return tamanoDouble!;
  }


  bool esFisico(){
    String? respuesta;
    do{
    print("\n O videoxogo que queres engadir é físico?(S/N): ");
    respuesta = stdin.readLineSync()?.trim().toLowerCase();
    }while(!validarStringSN(respuesta));

    if (respuesta == "s"){
      return true;
    }else {
      return false;
    }
    
    
    
    

  }
  void engadirVideoxogo(){
    String nome;
    double prezo;
    int stock;
    List<Dispositivo> listaDispositivos = [];
    Generos xenero;
    int codigo;
    int numeroDeDiscos;
    double tamano;
    Videojuego v;



    print("\nIntroduce os datos do novo videoxogo:\n ");
    
    nome = pedirNome();
   
    prezo = pedirPrezo();
    
    xenero = pedirXenero();
    
    listaDispositivos = pedirDispositivos();

    stock = pedirStock();
    
    codigo = almacenDeIria.calcularCodigo();

    if (esFisico()){// pregunto si es físico para saber qué datos pedir
      numeroDeDiscos = pedirNumeroDiscos();
      v = VideojuegoFisico(codigo: codigo, nombre: nome, precio: prezo, genero: xenero, dispositivos: listaDispositivos, stock: stock, numeroDeDiscos: numeroDeDiscos);
    }else{
      tamano = pedirTamano();
      v = VideojuegoDigital(codigo: codigo, nombre: nome, precio: prezo, genero: xenero, dispositivos: listaDispositivos, stock: stock, tamano: tamano);
    }

    
    almacenDeIria.engadirVideoxogo(v);
    print("\nVideoxogo engadido");

  }

  void mostrarVideoxogos(){
    List<Videojuego> videojuegos = almacenDeIria.getVideojuegos();
    print("\nLista de videojuegos: ");

    if(videojuegos.isNotEmpty){
      for(int i = 0; i < videojuegos.length; i ++){
        print(videojuegos[i]);

        if((i +1) % 3 == 0 && i+1 < videojuegos.length){
          print("\nPulsa enter para continuar");
          stdin.readLineSync();
        }

      }
    } else {
      print("\nNo hay videojuegos en el almacén");
    }

  }

  int pedirCodigo(){
    String? codigoString;
    int? codigoInt;

    do{
      print("\nCal é o código do videoxogo que estás a buscar?: ");
      codigoString= stdin.readLineSync();
      codigoInt = comprobarNumero(codigoString);
      if(codigoInt == null){
        print("\nEscribe un código válido");
      }

    }while(codigoInt == null);

    return codigoInt;
  }
  
int mostrarMenuFisico(){
  bool eValido = false;
  String? opcionString;
  int? opcionInt;
  do{
        print("\nQué queres modificar?: ");
        print("""1.  Nome
        2. Prezo
        3. Xénero
        4. Dispositivos
        5. stock
        6. Número de CDs""");
        print("\nElixe unha opción: ");
        opcionString = stdin.readLineSync();
        opcionInt = comprobarNumero(opcionString);

        if(opcionInt == null || !comprobarRangoModificar(opcionInt)){
         print("\nIntroduce un número do menú");
         eValido = false;
        } else {
        eValido = true;
        }
      }while(!eValido);

      return opcionInt!;
}

int mostrarMenuDigital(){
  bool eValido = false;
  String? opcionString;
  int? opcionInt;
  do{
        print("\nQué queres modificar?: ");
        print("""1.  Nome
        2. Prezo
        3. Xénero
        4. Dispositivos
        5. stock
        6. Tamaño""");
        print("\nElixe unha opción: ");
        opcionString = stdin.readLineSync();
        opcionInt = comprobarNumero(opcionString);

        if(opcionInt == null || !comprobarRangoModificar(opcionInt)){
         print("\nIntroduce un número do menú");
         eValido = false;
        } else {
        eValido = true;
        }
      }while(!eValido);

      return opcionInt!;
}



  void modificarVideoxogo(){
    int? codigoInt;
    String nomeNovo;
    double prezoNovo;
    Generos xeneroNovo = Generos.aventura;
    List<Dispositivo> dispositivosNovos;
    int stockNovo;
    int opcionInt;
    int numeroDeDiscosNuevo;
    double tamanonuevo;



    
    codigoInt = pedirCodigo();
    

    Videojuego? videojuegoBuscado = almacenDeIria.buscarVideoxogoCodigo(codigoInt);

    if(videojuegoBuscado == null){
      print("\nVideoxogo non atopado");
    } else {
      print("\nVideoxogo atopado: \n");
      print(videojuegoBuscado);
      
      if(videojuegoBuscado is VideojuegoFisico){
        opcionInt = mostrarMenuFisico();
        switch(opcionInt){
        case 1:
        nomeNovo = pedirNome();

        videojuegoBuscado.nombre = nomeNovo;
        break;

        case 2:

        prezoNovo = pedirPrezo();
        videojuegoBuscado.precio = prezoNovo;
        break;

        case 3:
        xeneroNovo = pedirXenero();
        videojuegoBuscado.genero =xeneroNovo;
          
        break;

        case 4:
        dispositivosNovos = pedirDispositivos();

        videojuegoBuscado.dispositivos = dispositivosNovos;
        break;

        case 5:
        stockNovo = pedirStock();
          videojuegoBuscado.stock = stockNovo;
        break;

        case 6:
        numeroDeDiscosNuevo = pedirNumeroDiscos();
        videojuegoBuscado.numeroDeDiscos = numeroDeDiscosNuevo;
        break;




      } 
      } else if(videojuegoBuscado is VideojuegoDigital){

        opcionInt = mostrarMenuDigital();
        switch(opcionInt){
        case 1:
        nomeNovo = pedirNome();

        videojuegoBuscado.nombre = nomeNovo;
        break;

        case 2:

        prezoNovo = pedirPrezo();
        videojuegoBuscado.precio = prezoNovo;
        break;

        case 3:
        xeneroNovo = pedirXenero();
        videojuegoBuscado.genero =xeneroNovo;
          
        break;

        case 4:
        dispositivosNovos = pedirDispositivos();

        videojuegoBuscado.dispositivos = dispositivosNovos;
        break;

        case 5:
        stockNovo = pedirStock();
          videojuegoBuscado.stock = stockNovo;
        break;

        case 6:
        tamanonuevo = pedirTamano();
        videojuegoBuscado.tamano = tamanonuevo;
        break;
        }


      }
      

      
      

    }
  }


  void eliminarVideoxogo(){
    Videojuego? v;
    int? codigo;
    String? resposta;

    mostrarVideoxogos();
    codigo = pedirCodigo();

    v = almacenDeIria.buscarVideoxogoCodigo(codigo);

    if(v != null){
      print("\nEste é o videoxogo que se vai eliminar: ");
      print(v);
      do{
        print("\nEstá seguro de que o quere eliminar?(S/N)");
        resposta = stdin.readLineSync()?.trim().toLowerCase();
      }while(!validarStringSN(resposta));

      if(resposta == 's'){
        almacenDeIria.eliminarVideoXogo(v);
        print("${v.nombre} eliminado");

      }else {
        print("Cancelando...");
      }
    
    } else {
      print("O videoxogo buscado non se atopou");
    }
  
  }


  void listarVideoxogos(){
    mostrarVideoxogos();
  }


  void buscarVideoxogos(){
    List<Videojuego> videoxogosAtopados = [];
    String? palabra;
    do{
      print("\nEscribe unha palabra relacionada co videoxogo que buscas: ");
    palabra = stdin.readLineSync();
    }while(!validarString(palabra));

    videoxogosAtopados = almacenDeIria.buscarPorPalabra(palabra!); // busca coincidencias de esa palabra en el nombre y en el género
    
    if(videoxogosAtopados.isEmpty){
      print("\nNon se atopou ningún videoxogo que contenga esa palabra");
    } else {
      for(Videojuego v in videoxogosAtopados){
        print("\n$v");
      }
    }
    

  }



  void mostrarVidedoxogosOrdenadosPorPrecio(){


    List<Videojuego> ordenados = almacenDeIria.ordenarVideoxogos();
    ordenados.sort((a, b) => a.precio.compareTo(b.precio));

    for(Videojuego v in ordenados){
      print("\n$v");
    }
  }


}

 