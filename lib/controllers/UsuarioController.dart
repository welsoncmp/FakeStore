import 'package:fakestore/models/Usuario.dart';
import 'package:fakestore/services/UsuarioService.dart';


class UsuarioController{
  final UsuarioService _service = UsuarioService();

  Future<Usuario> exibirUsuario() async{
    try{
      final usuario = await _service.exibirUsuario();
      return usuario;
    }catch(e){
      throw Exception('Erro $e');
    }
  }
}