import 'package:flutter/material.dart';

class EnviarInventario extends StatefulWidget {
  final String codigoInmueble;

  const EnviarInventario({super.key, required this.codigoInmueble});

  @override
  State<EnviarInventario> createState() => _EnviarInventarioState();
}

class _EnviarInventarioState extends State<EnviarInventario> {
  final _formKey = GlobalKey<FormState>();

  String rolSeleccionado = 'Inquilino';

  final TextEditingController _controladorCorreo = TextEditingController();
  final TextEditingController _controladorMensaje = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enviar Inventario'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/img/placeholders/casa1.jpg',
                      height: 160,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 160,
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.home,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Código: ${widget.codigoInmueble.isNotEmpty ? widget.codigoInmueble : "Sin código"}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Destinatario',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              Row(
                children: ['Inquilino', 'Propietario', 'Asesor'].map((rol) {
                  final bool esSeleccionado = rolSeleccionado == rol;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: esSeleccionado
                              ? const Color.fromARGB(255, 2, 0, 95)
                              : Colors.white,
                          side: BorderSide(
                            color: esSeleccionado
                                ? const Color.fromARGB(255, 2, 0, 95)
                                : Colors.grey.shade400,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            rolSeleccionado = rol;
                          });
                        },
                        child: Text(
                          rol,
                          style: TextStyle(
                            color: esSeleccionado ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              const Text('Correo electrónico', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _controladorCorreo,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'ejemplo@correo.com',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.isEmpty) {
                    return 'Escribe el correo del destinatario';
                  }
                  if (!valor.contains('@') || !valor.contains('.')) {
                    return 'El correo no tiene un formato válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              const Text('Mensaje (opcional)', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _controladorMensaje,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Escribe un mensaje opcional...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Botón de envío
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
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Inventario enviado a ${_controladorCorreo.text}',
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Enviar Inventario',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}