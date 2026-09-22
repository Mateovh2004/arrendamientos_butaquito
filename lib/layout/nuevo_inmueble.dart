import 'package:flutter/material.dart';
import 'crear_-inventario.dart';

class PantallaNuevoInmueble extends StatefulWidget {
  const PantallaNuevoInmueble({super.key});

  @override
  State<PantallaNuevoInmueble> createState() => _PantallaNuevoInmuebleState();
}

class _PantallaNuevoInmuebleState extends State<PantallaNuevoInmueble> {
  // Controladores para capturar el texto ingresado
  final TextEditingController _controladorInmueble = TextEditingController();
  final TextEditingController _controladorFecha = TextEditingController();
  final TextEditingController _comentariosController = TextEditingController();

  @override
  void dispose() {
    _controladorInmueble.dispose();
    _controladorFecha.dispose();
    _comentariosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Inventario'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
        actions: [
        
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo: Nombre o Título del Inmueble

              const Text(
                'Selecciona un inmueble y define los detalles para comenzarla inspección.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const Text(
              'Código del Inmueble',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              controller: _controladorInmueble,
              decoration: const InputDecoration(
                labelText: 'Codigo del inmueble',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
            ),
            const SizedBox(height: 16),
              const Text(
              'Fecha de la inspección',
              style: TextStyle(fontSize: 14),
            ),
            // Campo: Fecha (Multilinea)
            TextField(
              controller: _controladorFecha,
              maxLines: 1 ,
              decoration: const InputDecoration(
                labelText: 'DD/MM/AAAA',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 16),

            // Sección de Imágenes (Marcador de posición)
            const Text(
              'Tipo de inventario',
              style: TextStyle(fontSize: 14),
            ),
            
Row(
  children: [
    Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CrearInventario()
              ),
           );
        },
        icon: const Icon(Icons.login),
        label: const Text(
          'Inventario de Entrada',
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 2, 0, 95),
          foregroundColor: Colors.white,
        ),
      ),
    ),
    const SizedBox(width: 12),
    Expanded(
      child: ElevatedButton.icon(
        onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CrearInventario()
              ),
          );
        },
        icon: const Icon(Icons.logout),
        label: const Text(
          'Inventario de Salida',
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 2, 0, 95),
          foregroundColor: Colors.white,
        ),
      ),
    ),
  ],
),  
        const SizedBox(height: 20),
const Text(
  'Comentarios adicionales',
  style: TextStyle(fontSize: 12, letterSpacing: 0.5),
),
const SizedBox(height: 8),
TextField(
  controller: _comentariosController,
  maxLines: 4,
  textCapitalization: TextCapitalization.sentences,
  decoration: InputDecoration(
    hintText: 'Añade comentarios adicionales...',
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color.fromARGB(255, 2, 0, 95)),
    ),
  ),
),
          
          ],
        ),
      ),
    );
  }
}
