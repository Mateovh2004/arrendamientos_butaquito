import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/menu_inicio.dart';
void main() {
  runApp( MainApp());
}
class MainApp extends StatelessWidget {
  MainApp({super.key});
  TextEditingController controladorCorreo = TextEditingController();
  TextEditingController controladorContrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body:widgetMenuInicio(controladorCorreo: controladorCorreo, controladorContrasena: controladorContrasena), // Cierre de AppBar
      ), // Cierre de Scaffold
    ); // Cierre de MaterialApp
  }
}

