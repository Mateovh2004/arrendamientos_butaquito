import 'package:flutter/material.dart';

class Inmueble{
  final String nombre;
  final String direccion;
  final String imagen;
  final double precio;
  final String estado;

  const Inmueble({
    required this.nombre,
    required this.direccion,
    required this.imagen,
    required this.precio,
    required this.estado
  });
}

class listadoInmuebles extends StatelessWidget {
  const listadoInmuebles({super.key});

  static const List<Inmueble> inmuebles = [
    Inmueble(
      nombre: 'Apartamento Laureles 502',
      direccion: 'Cra 76 # 34-12, Laureles',
      imagen: 'assets/img/placeholders/casa1.jpg',
      precio: 1800000,
      estado: 'Disponible',
    ),
    Inmueble(
      nombre: 'Casa Envigado Loma del Chocho',
      direccion: 'Calle 22 Sur # 45-10, Envigado',
      imagen: 'assets/img/placeholders/casa2.jpg',
      precio: 3200000,
      estado: 'Arrendado',
    ),
    Inmueble(
      nombre: 'Apartaestudio El Poblado',
      direccion: 'Cra 43A # 10-25, El Poblado',
      imagen: 'assets/img/placeholders/casa3.jpg',
      precio: 2100000,
      estado: 'Mantenimiento',
    ),
  ];

  Color colorEstado (String estado){
    switch (estado){
      case 'Disponible':
        return Colors.green;
      case 'Arrendado':
        return Colors.orange;
      default: 
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView.builder(
      itemCount: inmuebles.length,
      itemBuilder: (context, indice) {
        final inmueble = inmuebles[indice];
        return ListTile(
          leading: Image.network(
            inmueble.imagen,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
          title: Text(
            inmueble.nombre,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text('${inmueble.direccion}\n${inmueble.estado}'),
          isThreeLine: true,
          trailing: Text('\$${inmueble.precio.toStringAsFixed(0)}'),
          onTap: () {
            print('Tocaste ${inmueble.nombre}');
          },
        );
      },
    )
    );
  }
}
