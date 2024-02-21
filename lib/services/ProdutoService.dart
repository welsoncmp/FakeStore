import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fakestore/models/Produto.dart';

class ProdutoService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<List<Produto>> listaProdutos() async {
    final url = '$baseUrl/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return List<Produto>.from(jsonData.map(
              (produto) => Produto(
                id: produto['id'] ?? 0, // Se 'id' for nulo, atribui 0
                title: produto['title'] ?? '', // Se 'title' for nulo, atribui string vazia
                price: produto['price']?.toDouble() ?? 0.0, // Se 'price' for nulo, atribui 0.0
                description: produto['description'] ?? '', // Se 'description' for nulo, atribui string vazia
                category: produto['category'] ?? '', // Se 'category' for nulo, atribui string vazia
                image: produto['image'] ?? '', // Se 'image' for nulo, atribui string vazia
                rate: produto['rating']?['rate']?.toDouble() ?? 0.0, // Se 'rate' for nulo, atribui 0.0
                count: produto['rating']?['count'] ?? 0, // Se 'count' for nulo, atribui 0
          ),
        ));
      } else {
        throw Exception('Falha ao buscar os dados');
      }
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }


  Future<Produto> exibirProduto(int idProduto) async{
    final url = '$baseUrl/products/$idProduto';
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final jsonBody = json.decode(response.body);
        final produto = Produto(
          id: jsonBody['id'] ?? 0,
          title: jsonBody['title'] ?? '',
          price: jsonBody['price']?.toDouble() ?? 0.0,
          description: jsonBody['description'] ?? '',
          category: jsonBody['category'] ?? '',
          image: jsonBody['image'] ?? '',
          rate: jsonBody['rating']?['rate']?.toDouble() ?? 0.0,
          count: jsonBody['rating']?['count'] ?? 0,
        );

        return produto;
      }else{
        throw Exception('Erro ao buscar dados da API');
      }
    }catch(e){throw Exception('Erro na requisição: $e');}
  }


}
