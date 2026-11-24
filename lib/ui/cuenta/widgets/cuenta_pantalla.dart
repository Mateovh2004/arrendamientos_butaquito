import 'package:flutter/material.dart';
import '../view_models/cuenta_view_model.dart';

class CuentaPantalla extends StatefulWidget {
  const CuentaPantalla({super.key, required this.viewModel});
  final CuentaViewModel viewModel;

  @override
  State<CuentaPantalla> createState() => _CuentaPantallaState();
}

class _CuentaPantallaState extends State<CuentaPantalla> {
  final controladorCorreo = TextEditingController();
  final controladorContrasena = TextEditingController();

  @override
  void dispose() {
    controladorCorreo.dispose();
    controladorContrasena.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ListenableBuilder(
            listenable: vm,
            builder: (context, _) => Column(
              children: [
                Image.asset(
                  'assets/img/logo_empresa/logo_butaquito_transparente.png',
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Bienvenido, Inventarista',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 2, 0, 95),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Inicia sesión para gestionar los inventarios de los inmuebles',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE3E5E8)),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: controladorCorreo,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                          hintText: 'Agente@butaquito.com',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: controladorContrasena,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Ingresa tu contraseña',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      if (vm.error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(vm.error!, style: const TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (vm.cargando)
                  const CircularProgressIndicator()
                else ...[
                  ElevatedButton(
                    onPressed: () => vm.iniciar(controladorCorreo.text, controladorContrasena.text),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 0, 95),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Ingresar'),
                  ),
                  TextButton(
                    onPressed: () => vm.registrar(controladorCorreo.text, controladorContrasena.text),
                    child: const Text('Crear cuenta de inventarista'),
                  ),
                ],
                TextButton(onPressed: () {}, child: const Text('contactar con soporte técnico')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}