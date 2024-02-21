import 'package:flutter/material.dart';
import 'package:fakestore/views/Inicio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => {
  runApp(ProviderScope(child: FakeStore())),
  });
}
class FakeStore extends StatelessWidget {
  const FakeStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
    );
  }
}