import 'package:flutter/material.dart';

class DetalleInmueble extends StatelessWidget {
  final String codigo;

  const DetalleInmueble({super.key, required this.codigo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del inmueble')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Código: $codigo',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}