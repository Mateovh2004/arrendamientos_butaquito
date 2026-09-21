import 'package:arrendamientos_butaquito/layout/lista_inmuebles.dart';
import 'package:arrendamientos_butaquito/layout/crear_-inventario.dart';
import 'package:arrendamientos_butaquito/layout/nuevo_inmueble.dart'; 
import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/menu_inicio.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaPrincipal(), 
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorCorreo = TextEditingController();
    final TextEditingController controladorContrasena = TextEditingController();

    return Scaffold(
      body: 

      widgetMenuInicio(
        controladorCorreo: controladorCorreo,
        controladorContrasena: controladorContrasena
     ),
      
    );
  }
}


