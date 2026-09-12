import 'package:arrendamientos_butaquito/layout/lista_inmuebles.dart';
// 1. CORRECCIÓN: Asegúrate de tener esta importación exacta con la ruta de tu archivo
import 'package:arrendamientos_butaquito/layout/registro/nuevo_inmueble.dart'; 
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        foregroundColor: Colors.white,
        title: const Text('Inmuebles'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {
              print("Tocaste añadir un nuevo registro");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaNuevoInmueble()),
              );
            }, 
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: listadoInmuebles(),
    );
  }
}


