import 'package:flutter/material.dart';
import 'nuevo_inmueble.dart';
import 'detalle_inmueble.dart';

class ListaInventarios extends StatefulWidget {
  const ListaInventarios({super.key});

  @override
  State<ListaInventarios> createState() => _ListaInventariosState();
}

class _ListaInventariosState extends State<ListaInventarios> {
  final TextEditingController controladorCodigo = TextEditingController();


  final List<String> codigosInmuebles = ['79940', '79941'];
  final List<String> imagenesInmuebles = [
    'assets/img/placeholders/casa1.jpg',
    'assets/img/placeholders/casa2.jpg',
  ];

  @override
  void dispose() {
    controladorCodigo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrendamientos Butaquito'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
        
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Mis inmuebles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Gestiona las inspecciones',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controladorCodigo,
                  decoration: const InputDecoration(
                    labelText: 'Código inmueble',
                    hintText: 'Ingrese el código',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

      
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: codigosInmuebles.length,
              itemBuilder: (context, index) {
                final codigo = codigosInmuebles[index];
                final imagen = imagenesInmuebles[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagen,
                        width: 400,
                        height: 300,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                      Text('Código: $codigo'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalleInmueble(codigo: codigo),
                            ),
                          );
                        },
                        child: const Text('ver más', style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PantallaNuevoInmueble()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        child: const Icon(Icons.add),
      ),
    );
  }
}