import 'package:flutter/material.dart';
import 'nuevo_inmueble.dart';

class widgetMenuInicio extends StatelessWidget{
  const widgetMenuInicio({super.key, required this.controladorCorreo, required this.controladorContrasena});
  final TextEditingController controladorCorreo;
  final TextEditingController controladorContrasena;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Image.asset('assets/img/logo_empresa/logo_butaquito_transparente.png',
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
          style: TextStyle(
            color: Color.fromARGB(255, 53, 53, 54),
            fontSize: 12,
          ),
        ),
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
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'Agente@butaquito.com',
                prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
              ),
            ),
            TextField(
            controller: controladorContrasena,
            decoration: const InputDecoration(
            labelText: 'Contraseña',
            hintText: 'Ingresa tu contraseña',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
        ),
          Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text("¿Olvidaste tu contraseña?"),
              ),
            ) ,
          ],
          
        ),
        
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PantallaNuevoInmueble(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 2, 0, 95)),
          child: const Text('Ingresar'),
        ),
        TextButton(onPressed: () {}, child: const Text("contactar con soporte técnico")),

      ],
    );
  }
}