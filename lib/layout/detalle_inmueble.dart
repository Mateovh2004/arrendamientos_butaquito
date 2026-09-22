import 'package:flutter/material.dart';
import 'package:arrendamientos_butaquito/layout/enviar_inventario.dart'; // Importación de la última pantalla

class DetalleInmueble extends StatelessWidget {
  final String codigo;

  const DetalleInmueble({super.key, required this.codigo});

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
            // Espacio expandido para centrar el código capturado
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Código Capturado:',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      codigo.isNotEmpty ? codigo : 'Sin código',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 0, 95),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Botón inferior para continuar al flujo final (Enviar Inventario)
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
                    // Enviamos el código almacenado a la pantalla de Enviar Inventario
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
