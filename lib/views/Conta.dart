import 'package:fakestore/controllers/UsuarioController.dart';
import 'package:fakestore/models/Usuario.dart';
import 'package:flutter/material.dart';

class Conta extends StatefulWidget {
  const Conta({super.key});

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  final UsuarioController _controller = UsuarioController();
  late Usuario? _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = null; // Inicializa _usuario com null
    _carregarUsuario();
  }

  void _carregarUsuario() async {
    _usuario = await _controller.exibirUsuario();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _usuario != null ? SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/background.jpg'), fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 195, right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: Column(
                  children: [
                    _informacoesUsuario(_usuario!.name, 'Nome: ', Icons.account_circle),
                    _informacoesUsuario(_usuario!.email, 'E-mail: ',  Icons.email),
                    _informacoesUsuario(_usuario!.phone, 'Telefone: ',  Icons.phone),
                    _informacoesUsuario(_usuario!.username, 'Usuário: ',  Icons.manage_accounts),
                    _informacoesUsuario(_usuario!.firstname, 'Primeiro Nome: ',  Icons.account_box),
                    _informacoesUsuario(_usuario!.lastname, 'Último Nome: ',  Icons.account_box),
                    _informacoesUsuario(_usuario!.city, 'Cidade: ',  Icons.location_city),
                    _informacoesUsuario(_usuario!.street, 'Bairro: ',  Icons.streetview),
                    _informacoesUsuario(_usuario!.number.toString(), 'Número: ',  Icons.numbers),
                    _informacoesUsuario(_usuario!.zipcode, 'CEP: ',  Icons.park_outlined)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 27,
              child: ClipOval(
                child: Image.asset("assets/icons/user.png", fit: BoxFit.cover, width: 200),
              ),
            ),
          ],
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _informacoesUsuario(String? info, String? labelText, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 10, bottom: 5, top: 10),
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: (MediaQuery.of(context).size.width) - 80,
              child: TextField(
                controller: TextEditingController(text: info),
                style: TextStyle(fontSize: 16),
                enabled: false,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
