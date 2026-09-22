import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/enviar_inventario.dart';

class DetalleInmueble extends StatelessWidget {
  final String codigo;
  final String imagen;

  const DetalleInmueble({
    super.key,
    required this.codigo,
    this.imagen = 'assets/img/placeholders/casa1.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Inmueble'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        imagen,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 220,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.home,
                              size: 60,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Código del inmueble',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              codigo.isNotEmpty ? codigo : 'Sin código',
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 2, 0, 95),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 0, 95),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EnviarInventario(codigoInmueble: codigo),
                  ),
                );
              },
              child: const Text(
                'Continuar a Enviar Inventario',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}