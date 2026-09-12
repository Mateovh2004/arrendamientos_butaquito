import 'package:flutter/material.dart';

class PantallaNuevoInmueble extends StatefulWidget {
  const PantallaNuevoInmueble({super.key});

  @override
  State<PantallaNuevoInmueble> createState() => _PantallaNuevoInmuebleState();
}

class _PantallaNuevoInmuebleState extends State<PantallaNuevoInmueble> {
  // Controladores para capturar el texto ingresado
  final TextEditingController _controladorNombre = TextEditingController();
  final TextEditingController _controladorDescripcion = TextEditingController();

  @override
  void dispose() {
    _controladorNombre.dispose();
    _controladorDescripcion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Inmueble'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo: Nombre o Título del Inmueble
            TextField(
              controller: _controladorNombre,
              decoration: const InputDecoration(
                labelText: 'Nombre del Inmueble',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 16),

            // Campo: Descripción (Multilinea)
            TextField(
              controller: _controladorDescripcion,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Descripción detallada',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 24),

            // Sección de Imágenes (Marcador de posición)
            const Text(
              'Imágenes del Inmueble',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            // Contenedor interactivo para simular la subida de fotos
            InkWell(
              onTap: () {
                print('Aquí se abrirá la galería o cámara más adelante');
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[400]!, style: BorderStyle.solid),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                    SizedBox(height: 8),
                    Text('Toca para añadir fotos', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Botón Guardar Registro
            ElevatedButton(
              onPressed: () {
                print('--- Guardando nuevo inmueble ---');
                print('Nombre: ${_controladorNombre.text}');
                print('Descripción: ${_controladorDescripcion.text}');
                
                // Regresa a la pantalla anterior después de guardar
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Guardar Inmueble', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
