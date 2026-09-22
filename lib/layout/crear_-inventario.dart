import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/detalle_inmueble.dart';

class CrearInventario extends StatefulWidget {
  final String codigoInmueble;

  const CrearInventario({super.key, required this.codigoInmueble});

  @override
  State<CrearInventario> createState() => _CrearInventarioState();
}

class _CrearInventarioState extends State<CrearInventario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrendamientos Butaquito'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Paredes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Estado', style: TextStyle(fontSize: 14)),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Bueno"
                        },
                        child: const Text('Bueno'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Regular"
                        },
                        child: const Text('Regular'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Malo"
                        },
                        child: const Text('Malo'),
                      ),
                    ],
                  ),
                  const Text(
                    'Fotos de evidencia',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton(
                    onPressed: () {
                      // Acción al presionar el botón "Agregar fotos"
                    },
                    child: const Text('Agregar fotos'),
                  ),
                  const Text('Novedades', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Escribe aquí las novedades',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Cocina',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Estado', style: TextStyle(fontSize: 14)),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Bueno"
                        },
                        child: const Text('Bueno'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Regular"
                        },
                        child: const Text('Regular'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Malo"
                        },
                        child: const Text('Malo'),
                      ),
                    ],
                  ),
                  const Text(
                    'Fotos de evidencia',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton(
                    onPressed: () {
                      // Acción al presionar el botón "Agregar fotos"
                    },
                    child: const Text('Agregar fotos'),
                  ),
                  const Text('Novedades', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Escribe aquí las novedades',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sala',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Estado', style: TextStyle(fontSize: 14)),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Bueno"
                        },
                        child: const Text('Bueno'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Regular"
                        },
                        child: const Text('Regular'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción al presionar el botón "Malo"
                        },
                        child: const Text('Malo'),
                      ),
                    ],
                  ),
                  const Text(
                    'Fotos de evidencia',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton(
                    onPressed: () {
                      // Acción al presionar el botón "Agregar fotos"
                    },
                    child: const Text('Agregar fotos'),
                  ),
                  const Text('Novedades', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Escribe aquí las novedades',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetalleInmueble(codigo: widget.codigoInmueble),
                  ),
                );
              },
              child: const Text(
                'Guardar inventario',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
