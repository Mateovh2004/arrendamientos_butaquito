Investigación de widgets de Flutter
Nombre del estudiante: Mateo Vasquez Hoyos
Grupo: 602
Fecha: 10/10/2026

Mis widgets: CarouselView, Badge, Checkbox

Widget 1: CarouselView
Qué es y para qué sirve

El widget CarouselView es un widget que nos permite ver una lista de elementos, así como ListView, solo que este se enfoca más en elementos destacados. Este widget se desplaza de manera horizontal (de manera predeterminada) y, además, cada elemento de la lista puede cambiar de tamaño. Sirve para presentar elementos visuales en poco espacio.

Cuándo usarlo

Cuando tenemos una lista de elementos importantes o destacados que el usuario sí o sí tiene que ver.

Cuándo no usarlo

Cuando tenemos una lista muy grande de elementos. Por lo general, en este caso usamos ListView.

Error o confusión típica

Crear el CarouselController dentro de build(). Como build() se ejecuta cada vez que la pantalla se redibuja, se crearía un controller nuevo cada vez y el carrusel podría perder su posición. Por eso, en el ejemplo personalizado el controller se crea en el State y se libera en dispose().

Ejemplo mínimo
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prueba(),
    ));

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de widget'),
        backgroundColor: const Color.fromRGBO(129, 212, 250, 1.0),
      ),
      body: const CarouselEjemplo(),
    );
  }
}

class CarouselEjemplo extends StatelessWidget {
  const CarouselEjemplo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: CarouselView.weighted(
          flexWeights: const <int>[2, 3, 2],
          consumeMaxWeight: false,
          children: List<Widget>.generate(20, (int index) {
            return ColoredBox(
              color: Colors.primaries[index % Colors.primaries.length]
                  .withValues(alpha: 0.8),
              child: Center(
                child: Text('$index item'),
              ),
            );
          }),
        ),
      ),
    );
  }
}
Explicación del ejemplo
Primero creamos la estructura básica de la pantalla con MaterialApp y Scaffold.
Luego creamos la clase CarouselEjemplo, que contiene el carrusel y se llama desde el body del Scaffold.
Dentro de ella usamos un Center para centrar un SizedBox, que es quien le da una altura de 200 al carrusel. Esto es necesario porque el carrusel necesita saber cuánto espacio vertical puede ocupar.
Después usamos CarouselView.weighted para que los elementos tengan tamaños distintos y se vea más dinámico. Este constructor pide la propiedad flexWeights, que define cuántos elementos se ven a la vez y qué proporción ocupa cada uno. Con [2, 3, 2] se ven tres elementos y el del centro es el más grande.
Por último, el carrusel recibe en children una lista de 20 elementos creada con List.generate. Cada elemento es un ColoredBox con un texto centrado que muestra su número.
Propiedades importantes
Propiedad	Qué hace	Ejemplo de valor
flexWeights	Define cuántos elementos se ven a la vez y qué proporción del espacio ocupa cada uno. Es obligatoria en CarouselView.weighted.	const <int>[2, 3, 2]
controller	Permite controlar desde el código con qué elemento arranca el carrusel (initialItem). Requiere StatefulWidget.	CarouselController(initialItem: 1)
itemSnapping	Si es true, el carrusel se ajusta al soltar para mantener el diseño original. Por defecto es false.	true
scrollDirection	Dirección del desplazamiento: horizontal (por defecto) o vertical.	Axis.vertical
Ejemplo personalizado
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Prueba(),
    ));

class Producto {
  final String nombre;
  final String precio;
  final Color color;

  const Producto(this.nombre, this.precio, this.color);
}

const List<Producto> productos = [
  Producto('Tomate', '\$3.500/lb', Color(0xFFC62828)),
  Producto('Aguacate', '\$6.000/lb', Color(0xFF2E7D32)),
  Producto('Naranja', '\$2.000/lb', Color(0xFFEF6C00)),
  Producto('Papa', '\$1.800/lb', Color(0xFF6D4C41)),
  Producto('Cebolla', '\$2.500/lb', Color(0xFF8E24AA)),
  Producto('Zanahoria', '\$1.500/lb', Color(0xFFF57C00)),
];

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const CarouselEjemplo();
  }
}

class CarouselEjemplo extends StatefulWidget {
  const CarouselEjemplo({super.key});

  @override
  State<CarouselEjemplo> createState() => _CarouselEjemploState();
}

class _CarouselEjemploState extends State<CarouselEjemplo> {
  final CarouselController controller = CarouselController(initialItem: 1);
  Axis direccion = Axis.horizontal;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool horizontal = direccion == Axis.horizontal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Campesino'),
        backgroundColor: const Color.fromRGBO(129, 212, 250, 1.0),
        actions: [
          IconButton(
            icon: Icon(horizontal ? Icons.swap_vert : Icons.swap_horiz),
            tooltip: 'Cambiar dirección',
            onPressed: () {
              setState(() {
                direccion = horizontal ? Axis.vertical : Axis.horizontal;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: horizontal ? 220 : 350,
          width: horizontal ? null : 220,
          child: CarouselView.weighted(
            controller: controller,
            flexWeights: const <int>[2, 3, 2],
            itemSnapping: true,
            scrollDirection: direccion,
            children: productos.map((p) {
              return ColoredBox(
                color: p.color,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          p.nombre,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          p.precio,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
Explicación del ejemplo personalizado
Los datos vienen de una clase Producto y una lista productos, en lugar de textos escritos a mano. Con productos.map(...) se crea un ColoredBox por cada producto, y .toList() lo convierte en la lista que recibe children.
La clase es un StatefulWidget porque necesita guardar un CarouselController (que hace que el carrusel arranque en el elemento 1, con initialItem: 1) y la variable direccion, que cambia. El controller se crea en el State y se libera en dispose().
itemSnapping: true hace que el carrusel se ajuste al soltar, y scrollDirection: direccion define si se desplaza en horizontal o vertical.
El botón de la barra superior cambia direccion con setState(), y el SizedBox ajusta su tamaño según la dirección.
Cada elemento usa Flexible, maxLines y overflow: TextOverflow.ellipsis para que los textos no se desborden cuando el elemento se achica.
Dónde lo usaría en Mercado Campesino

En Mercado Campesino lo usaría para dividir los tipos de productos ofrecidos, es decir lácteos, frutas, verduras, etc. Esto permite que la división de los productos ofrecidos sea mucho mejor, haciendo que los clientes encuentren de manera más fácil sus productos.

Fuentes y ayudas usadas
Documentación oficial: https://pub.dev/documentation/material_ui/latest/material_ui/CarouselView-class.html#instance-properties
Pruebas realizadas: probé los ejemplos en DartPad.
Ayudas utilizadas: usé IA para que me aclarara la explicación de la documentación, y también me ayudó en la parte del código para ingresar los elementos en los ColoredBox y con la parte del scroll. Por último, también me apoyé en videos de la documentación.
Widget 2: Badge
Qué es y para qué sirve

Es un widget que transmite información sobre su elemento secundario, como por ejemplo en las notificaciones, donde el número de notificaciones es un Badge. Por lo general se usa para decorar botones. Sirve para avisar cuando hay una notificación nueva o cuántos productos hay en el carrito.

Cuándo usarlo

Cuando quiero mostrar un contador o un aviso pequeño sobre un botón o ícono, como en el carrito de compras o la bandeja de notificaciones.

Cuándo no usarlo

Cuando el mensaje es importante o es largo. En esos casos es mejor usar un Text, un Chip o un SnackBar.

Ejemplo mínimo
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Prueba()));

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de widget'),
        actions: [
          IconButton(
            icon: Badge.count(
              count: 999,
              child: const Icon(Icons.notifications),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(child: BadgeExample()),
    );
  }
}

class BadgeExample extends StatelessWidget {
  const BadgeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        children: <Widget>[
          IconButton(
            icon: const Badge(
              label: Text('Your label'),
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.receipt),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
Explicación del ejemplo
Scaffold y AppBar forman la estructura básica de la pantalla.
Center pone el contenido en el medio.
Badge es el widget que investigué. Recibe dos cosas: el child, que es el widget sobre el que se pone la etiqueta, y el label, que es lo que se muestra en la etiqueta.
En el AppBar uso Badge.count, que en lugar de label recibe un número (count) y arma la etiqueta por sí solo.
Propiedades importantes
Propiedad	Qué hace	Ejemplo de valor
label	Contenido de la etiqueta, normalmente un Text corto. Si es null, se muestra solo un punto.	Text('3')
child	Widget sobre el que se coloca la etiqueta.	Icon(Icons.shopping_cart)
backgroundColor	Color de fondo de la etiqueta.	Colors.red
isLabelVisible	Si es false, la etiqueta no se muestra. Por defecto es true.	carrito > 0
Badge.count (constructor)	Crea una etiqueta numérica a partir de un número (count).	Badge.count(count: 5, child: ...)
Ejemplo personalizado
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Catalogo(),
    ));

class Catalogo extends StatefulWidget {
  const Catalogo({super.key});

  @override
  State<Catalogo> createState() => _CatalogoState();
}

class _CatalogoState extends State<Catalogo> {
  final List<String> productos = ['Tomate', 'Aguacate', 'Naranja', 'Papa', 'Cebolla'];
  int carrito = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mercado Campesino'),
        backgroundColor: const Color.fromRGBO(129, 212, 250, 1.0),
        actions: [
          Badge.count(
            count: carrito,
            isLabelVisible: carrito > 0,
            maxCount: 99,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            child: const Icon(Icons.shopping_cart, size: 28),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(productos[index]),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                setState(() {
                  carrito++;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            carrito = 0;
          });
        },
        icon: const Icon(Icons.delete),
        label: const Text('Vaciar carrito'),
      ),
    );
  }
}
Explicación del ejemplo personalizado
ListView.builder crea una fila por cada producto.
Cada botón suma uno a carrito con setState(), y como el Badge lee esa variable, se actualiza solo.
isLabelVisible: carrito > 0 hace que la etiqueta solo aparezca cuando hay productos.
El botón flotante pone carrito en 0 y el Badge se oculta.
Dónde lo usaría en Mercado Campesino

En Mercado Campesino lo usaría para el carrito, así cada vez que se agreguen productos al carrito sabemos cuántos productos se han agregado.

Fuentes y ayudas usadas
Documentación oficial: https://api.flutter.dev/flutter/material/Badge-class.html
Pruebas realizadas: probé los ejemplos en DartPad.
Ayudas utilizadas: usé IA para que me aclarara la explicación de la documentación, y también me ayudó en la parte del código para recordarme la propiedad adecuada. Por último, también me apoyé en videos de la documentación.
Widget 3: Checkbox
Qué es y para qué sirve

Es un widget que el usuario puede marcar o desmarcar, es una casilla de verificación. Sirve para que el usuario elija una o varias opciones.

Cuándo usarlo

Cuando se deben elegir varias opciones a la vez o seleccionar elementos de una lista.

Cuándo no usarlo
Cuando el cambio se aplica al instante, como un interruptor. Ahí es mejor un Switch.
Cuando solo se puede elegir una opción entre varias. Ahí es mejor un Radio.
Cuando el usuario debe escribir o elegir un valor dentro de un rango. Ahí es mejor un TextField o un Slider.
Ejemplo mínimo
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Prueba()));

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  bool marcado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox mínimo')),
      body: Center(
        child: Checkbox(
          value: marcado,
          onChanged: (bool? valor) {
            setState(() {
              marcado = valor ?? false;
            });
          },
        ),
      ),
    );
  }
}
Explicación del ejemplo
Scaffold y AppBar forman la estructura básica de la pantalla.
La variable marcado guarda si la casilla está marcada (true) o no (false).
value: marcado le dice al Checkbox cómo dibujarse.
onChanged se ejecuta cuando el usuario toca la casilla y recibe el valor nuevo.
setState() guarda ese valor en marcado y le avisa a Flutter que vuelva a dibujar la casilla. El Checkbox no guarda su propio estado, por eso se necesita un StatefulWidget.
Propiedades importantes
Propiedad	Qué hace	Ejemplo de valor
value	Indica si la casilla está marcada. Es obligatoria.	marcado
onChanged	Función que se ejecuta cuando el usuario toca la casilla.	(valor) { ... }
tristate	Si es true, la casilla puede tener tres estados: marcada, desmarcada y null (se muestra un guion). Por defecto es false.	true
activeColor	Color de la casilla cuando está marcada.	Colors.green
Ejemplo personalizado
dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Prueba()));

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba de widget')),
      body: const ListaCompras(),
    );
  }
}

class ListaCompras extends StatefulWidget {
  const ListaCompras({super.key});

  @override
  State<ListaCompras> createState() => _ListaComprasState();
}

class _ListaComprasState extends State<ListaCompras> {
  final List<String> productos = ['Tomate', 'Aguacate', 'Naranja', 'Papa', 'Cebolla'];
  late final List<bool> marcados = List<bool>.filled(productos.length, false);

  bool? get estadoTodos {
    int cantidad = 0;
    for (bool m in marcados) {
      if (m) cantidad++;
    }

    if (cantidad == productos.length) return true; // todos marcados
    if (cantidad == 0) return false; // ninguno marcado
    return null; // algunos sí, otros no
  }

  @override
  Widget build(BuildContext context) {
    final int cantidad = marcados.where((m) => m).length;

    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              tristate: true,
              value: estadoTodos,
              activeColor: Colors.green,
              onChanged: (bool? valor) {
                setState(() {
                  final bool nuevo = valor ?? false;
                  for (int i = 0; i < marcados.length; i++) {
                    marcados[i] = nuevo;
                  }
                });
              },
            ),
            Text('Seleccionar todo ($cantidad de ${productos.length})'),
          ],
        ),
        const Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: marcados[index],
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  onChanged: (bool? valor) {
                    setState(() {
                      marcados[index] = valor ?? false;
                    });
                  },
                ),
                title: Text(
                  productos[index],
                  style: TextStyle(
                    decoration: marcados[index]
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
Explicación del ejemplo personalizado
En lugar de una sola casilla, hay una lista de casillas controladas con una lista marcados, que guarda un true o false por cada producto.
Agregué una casilla maestra con tristate: true, cuyo valor se calcula a partir de las demás con estadoTodos: si todos están marcados devuelve true, si ninguno lo está devuelve false, y si solo algunos lo están devuelve null, que se muestra como un guion.
Al tocar la casilla maestra, un for le pone el mismo valor a todas las posiciones de la lista.
Uso activeColor y checkColor para cambiar los colores, y el texto se tacha cuando el producto está marcado.
Dónde lo usaría en Mercado Campesino

Lo usaría en la lista de compras o el carrito, para que el comprador marque los productos que ya agregó o recibió.

Fuentes y ayudas usadas
Documentación oficial: https://api.flutter.dev/flutter/material/Checkbox-class.html
Pruebas realizadas: probé los ejemplos en DartPad.
Ayudas utilizadas: usé IA para que me aclarara la explicación de la documentación, y también me ayudó en la parte del código cuando estaba usando el Checkbox de "Seleccionar todo". Por último, también me apoyé en videos de la documentación.

