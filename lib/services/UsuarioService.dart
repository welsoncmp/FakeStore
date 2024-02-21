import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fakestore/models/Usuario.dart';

class UsuarioService{
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Usuario> exibirUsuario() async{
    final url = '$baseUrl/users/1';
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final jsonBody = json.decode(response.body);
        final usuario = Usuario(
            id: jsonBody['id'],
            email: jsonBody['email'],
            username: jsonBody['username'],
            password: jsonBody['password'],
            name: jsonBody['name']['firstname'] + ' ' + jsonBody['name']['lastname'],
            firstname: jsonBody['name']['firstname'],
            lastname: jsonBody['name']['lastname'],
            address: jsonBody['address']['geolocation']['lat'].toString() + ', ' + jsonBody['address']['geolocation']['long'].toString(),
            city: jsonBody['address']['city'],
            street: jsonBody['address']['street'],
            number: jsonBody['address']['number'],
            zipcode: jsonBody['address']['zipcode'],
            phone: jsonBody['phone']);

        return usuario;
      }else{
        throw Exception('Erro ao buscar dados da API');
      }
    }catch(e){throw Exception('Erro na requisição: $e');}
  }
}
