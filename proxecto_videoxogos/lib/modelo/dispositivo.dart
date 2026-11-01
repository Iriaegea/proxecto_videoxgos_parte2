import 'TipoDispositivo.dart';
class Dispositivo {
  TipoDispositivo tipo;

  Dispositivo(this.tipo);
  

  List<TipoDispositivo> obterListaDispositivos(){
    return TipoDispositivo.values;
  }
}