import 'package:arrendamientos_butaquito/layout/detalle_inmueble.dart';
import 'package:arrendamientos_butaquito/layout/crear_inventario.dart';
import 'package:arrendamientos_butaquito/layout/nuevo_inmueble.dart';
import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/menu_inicio.dart';
import 'package:arrendamientos_butaquito/layout/lista_inventarios.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
      body: widgetMenuInicio(
        controladorCorreo: controladorCorreo,
        controladorContrasena: controladorContrasena,
      ),
    );
  }
}