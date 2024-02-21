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
      body: _usuario != null
          ? SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network("https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77700386918.jpg", fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.only(top: 360, right: 10, left: 10),
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
                    _informacoesUsuario(_usuario!.name, Icons.account_circle),
                    _informacoesUsuario(_usuario!.email, Icons.email),
                    _informacoesUsuario(_usuario!.phone, Icons.phone),
                    _informacoesUsuario(_usuario!.address, Icons.pin_drop),
                    _informacoesUsuario(_usuario!.username, Icons.manage_accounts),
                    _informacoesUsuario(_usuario!.firstname, Icons.account_box),
                    _informacoesUsuario(_usuario!.lastname, Icons.account_box),
                    _informacoesUsuario(_usuario!.city, Icons.location_city),
                    _informacoesUsuario(_usuario!.street, Icons.streetview),
                    _informacoesUsuario(_usuario!.number.toString(), Icons.numbers),
                    _informacoesUsuario(_usuario!.zipcode, Icons.park_outlined)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 192,
              child: ClipOval(
                child: Image.network("https://cdn-icons-png.flaticon.com/512/3001/3001758.png", fit: BoxFit.cover, width: 200),
              ),
            ),
          ],
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _informacoesUsuario(String? info, IconData icon) {
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
