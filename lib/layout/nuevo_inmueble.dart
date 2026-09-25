import 'package:flutter/material.dart';

import 'crear_inventario.dart';

class PantallaNuevoInmueble extends StatefulWidget {
  const PantallaNuevoInmueble({super.key});

  @override
  State<PantallaNuevoInmueble> createState() => _PantallaNuevoInmuebleState();
}

class _PantallaNuevoInmuebleState extends State<PantallaNuevoInmueble> {
  
  final _formKey = GlobalKey<FormState>();

  
  final TextEditingController _controladorInmueble = TextEditingController();
  final TextEditingController _controladorFecha = TextEditingController();
  final TextEditingController _comentariosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de Inventario'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            

            const Text(
              'Selecciona un inmueble y define los detalles para comenzarla inspección.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const Text('Código del Inmueble', style: TextStyle(fontSize: 14)),
            TextFormField(
              controller: _controladorInmueble,
              decoration: const InputDecoration(
                labelText: 'Codigo del inmueble',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Escribe el código del inmueble';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Fecha de la inspección',
              style: TextStyle(fontSize: 14),
            ),
            TextFormField(
              controller: _controladorFecha,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: 'DD/MM/AAAA',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Escribe la fecha de la inspección';
                }
                final formatoValido = RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(valor);
                if (!formatoValido) {
                  return 'Usa el formato DD/MM/AAAA';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            const Text('Tipo de inventario', style: TextStyle(fontSize: 14)),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CrearInventario(
                            codigoInmueble: _controladorInmueble.text,
                          ),
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
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CrearInventario(
                            codigoInmueble: _controladorInmueble.text,
                          ),
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
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 2, 0, 95),
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}