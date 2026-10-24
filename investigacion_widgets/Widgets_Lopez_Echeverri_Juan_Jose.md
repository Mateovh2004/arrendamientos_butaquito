# Investigación de widgets de Flutter

**Nombre del estudiante:** Juan José López Echeverri<br>
**Grupo:** 602<br>
**Fecha:** 16 de octubre de 2026<br>

**Mis widgets:** `AlertDialog`, `CalendarDatePicker`, `RefreshIndicator`

## 1. `AlertDialog`

### Qué es y para qué sirve

`AlertDialog` es una ventana emergente de Material que aparece encima de la pantalla actual para informar algo importante o pedirle al usuario que tome una decisión. Normalmente tiene un título, un mensaje y uno o más botones de acción (por ejemplo, "Cancelar" y "Aceptar"). Mientras está abierta, el resto de la pantalla queda oscurecido y no se puede tocar.

Resuelve el problema de interrumpir al usuario justo cuando necesita confirmar o enterarse de algo, sin tener que construir otra pantalla completa ni dibujar a mano una ventana flotante con fondo oscuro.

### Cuándo usarlo y cuándo no

Es la mejor opción para confirmar acciones que no se pueden deshacer (finalizar, eliminar, enviar), para avisar de errores que impiden continuar y para preguntas con pocas respuestas posibles (sí/no, aceptar/cancelar). No conviene para mensajes menores que no necesitan atención inmediata, como una confirmación de que algo se guardó: un aviso breve que desaparezca solo molesta menos. Tampoco para formularios largos o contenido extenso, y hay que evitar mostrar muchos diálogos seguidos porque cansan al usuario.

Un detalle importante: crear un `AlertDialog` no lo muestra. Hay que llamar a la función `showDialog(context: ..., builder: ...)`, que es la que lo abre encima de la pantalla. Para cerrarlo se usa `Navigator.pop(context)`, y si se le pasa un valor (`Navigator.pop(context, true)`), ese valor llega a quien llamó a `showDialog`, así se sabe qué botón tocó el usuario.

### Ejemplo mínimo

Código completo para pegar en DartPad:

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Pantalla()));

class Pantalla extends StatelessWidget {
  const Pantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Inventario guardado'),
                content: const Text('El inventario se guardó correctamente.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Aceptar'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Mostrar aviso'),
        ),
      ),
    );
  }
}
```

### Explicación del ejemplo

Al tocar el botón se llama a `showDialog`, que recibe el `context` y una función `builder` que devuelve el `AlertDialog` que se quiere mostrar. El `title` es el encabezado, `content` es el mensaje y `actions` es la lista de botones que van abajo a la derecha. El botón "Aceptar" llama a `Navigator.pop(context)`, que cierra el diálogo. Si el usuario toca fuera de la ventana, también se cierra, porque por defecto `showDialog` lo permite.

### Propiedades importantes

| Propiedad | Qué hace | Ejemplo |
|---|---|---|
| `title` | Widget con el título del diálogo. | `title: Text('¿Finalizar?')` |
| `content` | Widget con el mensaje o contenido principal. | `content: Text('No se podrá editar')` |
| `actions` | Lista de botones que aparecen abajo. | `actions: [TextButton(...)]` |
| `icon` | Ícono que se muestra arriba del título. | `icon: Icon(Icons.warning)` |
| `backgroundColor` | Color de fondo de la ventana. | `backgroundColor: Colors.white` |
| `actionsAlignment` | Alineación de los botones de `actions`. | `actionsAlignment: MainAxisAlignment.spaceBetween` |
| `scrollable` | Si el contenido puede desplazarse cuando es largo. | `scrollable: true` |

Además, `showDialog` tiene su propio parámetro `barrierDismissible`: si es `false`, el diálogo no se cierra al tocar fuera y el usuario está obligado a elegir un botón.

### Ejemplo personalizado

Este ejemplo pregunta si el inventarista quiere finalizar el inventario. El diálogo devuelve `true` o `false` según el botón tocado, y la pantalla muestra el resultado. Código completo para DartPad:

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: PantallaPrueba());
  }
}

class PantallaPrueba extends StatefulWidget {
  const PantallaPrueba({super.key});

  @override
  State<PantallaPrueba> createState() => _PantallaPruebaState();
}

class _PantallaPruebaState extends State<PantallaPrueba> {
  String _estado = 'Inventario en borrador';

  Future<void> _confirmarFinalizacion() async {
    final confirmado = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded),
        title: const Text('¿Finalizar inventario?'),
        content: const Text(
          'Una vez finalizado, no se podrá editar su contenido.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 2, 0, 95),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Finalizar'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    setState(() {
      _estado = confirmado == true
          ? 'Inventario finalizado'
          : 'Finalización cancelada';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba AlertDialog'),
        backgroundColor: const Color.fromARGB(255, 2, 0, 95),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _estado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmarFinalizacion,
              child: const Text('Finalizar inventario'),
            ),
          ],
        ),
      ),
    );
  }
}
```

La función `_confirmarFinalizacion` es `async` porque espera con `await` a que el usuario toque un botón. Lo que se pasa en `Navigator.pop(context, true)` o `Navigator.pop(context, false)` es lo que queda guardado en `confirmado`. Con `barrierDismissible: false` el usuario no puede cerrar el diálogo tocando fuera: tiene que elegir "Cancelar" o "Finalizar". El `icon` agrega una advertencia visual arriba del título y el botón principal usa el azul oscuro de la marca. La línea `if (!mounted) return;` evita usar `setState` si la pantalla ya se cerró mientras el diálogo estaba abierto.

### Dónde lo usaría en Arrendamientos Butaquito

En la pantalla Crear inventario, al finalizar el inventario: un diálogo que pregunte "¿Finalizar inventario?" y avise que ya no se podrá editar. También ahí mismo, si el inventario está incompleto, un diálogo de aviso que explique qué información falta en lugar de dejar que el usuario no entienda por qué no puede finalizar.

También en la pantalla Enviar inventario, antes de enviar el correo, para confirmar el destinatario (por ejemplo, "¿Enviar el inventario al propietario en correo@ejemplo.com?"), ya que un envío por correo no se puede deshacer.

### Fuentes y ayudas usadas

- Documentación oficial: https://api.flutter.dev/flutter/material/AlertDialog-class.html
- Utilicé IA para la redacción del Markdown y aclaración de conceptos usando Claude Sonnet 5.5.
- El ejemplo se probó en DartPad.

## 2. `CalendarDatePicker`

### Qué es y para qué sirve

`CalendarDatePicker` muestra un calendario mensual en pantalla donde el usuario toca el día que quiere. Permite cambiar de mes con flechas y, al tocar el año, saltar a otro año. Cada vez que se elige un día, avisa con la fecha seleccionada.

Resuelve el problema de pedir fechas sin depender de que el usuario escriba un formato exacto. Con un campo de texto hay que validar que la persona escriba algo como `DD/MM/AAAA` y manejar los errores; con el calendario solo se pueden elegir fechas válidas.

### Cuándo usarlo y cuándo no

Es buena opción cuando la fecha es un dato importante del formulario y hay espacio en pantalla para el calendario, o cuando se quiere limitar qué fechas se pueden escoger (por ejemplo, un rango permitido). No conviene cuando la fecha es un dato secundario que no justifica ocupar media pantalla, ni cuando la pantalla ya está muy cargada de contenido.

Tiene tres parámetros obligatorios que conviene recordar: `initialDate`, `firstDate` y `lastDate`. La fecha inicial debe estar dentro del rango, o Flutter lanza un error de aserción.

### Ejemplo mínimo

```dart
CalendarDatePicker(
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  onDateChanged: (fecha) {
    debugPrint('Fecha elegida: $fecha');
  },
)
```

### Explicación del ejemplo

El calendario arranca mostrando el día de hoy (`initialDate`) y permite navegar entre 2020 y 2030 (`firstDate` y `lastDate`). Cada vez que el usuario toca un día, se ejecuta `onDateChanged` y recibe un `DateTime` con la fecha tocada; aquí solo se imprime en consola. El widget no muestra la fecha elegida en ningún texto por sí solo: si se quiere mostrar o guardar, hay que almacenarla en una variable de estado.

### Propiedades importantes

| Propiedad | Qué hace | Ejemplo |
|---|---|---|
| `initialDate` | Fecha seleccionada al abrir el calendario (obligatoria). | `initialDate: DateTime.now()` |
| `firstDate` | Primera fecha que se puede elegir (obligatoria). | `firstDate: DateTime(2020)` |
| `lastDate` | Última fecha que se puede elegir (obligatoria). | `lastDate: DateTime(2030)` |
| `onDateChanged` | Se llama al tocar un día y entrega la fecha elegida (obligatoria). | `onDateChanged: (f) {...}` |
| `selectableDayPredicate` | Función que decide si un día se puede seleccionar; los demás aparecen deshabilitados. | `selectableDayPredicate: (d) => d.weekday != DateTime.sunday` |
| `currentDate` | Fecha que se marca como "hoy"; por defecto es la fecha real. | `currentDate: DateTime.now()` |
| `initialCalendarMode` | Si abre mostrando días o la lista de años. | `initialCalendarMode: DatePickerMode.year` |

### Ejemplo personalizado

Aquí se guarda la fecha elegida, se muestra en un texto con el formato `DD/MM/AAAA` y se bloquean los domingos con `selectableDayPredicate` (solo como ejemplo para mostrar la propiedad):

```dart
class SelectorFecha extends StatefulWidget {
  const SelectorFecha({super.key});

  @override
  State<SelectorFecha> createState() => _SelectorFechaState();
}

class _SelectorFechaState extends State<SelectorFecha> {
  late DateTime _fecha;

  @override
  void initState() {
    super.initState();
    var fecha = DateTime.now();
    while (fecha.weekday == DateTime.sunday) {
      fecha = fecha.add(const Duration(days: 1));
    }
    _fecha = fecha;
  }

  String _formatear(DateTime f) {
    final dia = f.day.toString().padLeft(2, '0');
    final mes = f.month.toString().padLeft(2, '0');
    return '$dia/$mes/${f.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Fecha de la inspección: ${_formatear(_fecha)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        CalendarDatePicker(
          initialDate: _fecha,
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
          selectableDayPredicate: (dia) => dia.weekday != DateTime.sunday,
          onDateChanged: (nueva) {
            setState(() {
              _fecha = nueva;
            });
          },
        ),
      ],
    );
  }
}
```

La variable `_fecha` guarda la selección y el texto de arriba se actualiza con cada toque. Los domingos se ven en gris y no se pueden elegir.

### Dónde lo usaría en Arrendamientos Butaquito

En la pantalla Nuevo inventario, en lugar del campo de texto "Fecha de la inspección". Hoy el inventarista tiene que escribir la fecha a mano en formato `DD/MM/AAAA` y el código la valida con una expresión regular; con el calendario se evitan los errores de formato y no hace falta esa validación. La fecha elegida sería la que se guarda en el inventario (atributo `fecha` de la entidad Inventario), que es lo que da trazabilidad al estado del inmueble en un momento dado.

### Fuentes y ayudas usadas

- Documentación oficial: https://api.flutter.dev/flutter/material/CalendarDatePicker-class.html
- Utilicé IA para la redacción del Markdown y aclaración de conceptos usando Claude Sonnet 5.5.
- El ejemplo se probó en DartPad apoyado de Gemini AI para corrección de errores.

## 3. `RefreshIndicator`

### Qué es y para qué sirve

`RefreshIndicator` implementa el gesto de "arrastrar hacia abajo para actualizar". Envuelve una lista desplazable: cuando el usuario tira de ella hacia abajo estando al inicio, aparece un círculo de carga y se ejecuta una función para recargar los datos. El círculo desaparece solo cuando esa función termina.

Resuelve el problema de darle al usuario una forma natural y conocida de pedir datos nuevos, sin tener que poner un botón de "Actualizar" ni manejar el gesto y la animación a mano.

### Cuándo usarlo y cuándo no

Es ideal para listas que vienen de un servidor o de una base de datos y que pueden cambiar mientras la app está abierta. No sirve en pantallas que no se desplazan, como un formulario fijo, ni cuando los datos no cambian nunca.

Hay dos detalles que suelen causar problemas:

- El `child` debe ser algo desplazable (una lista), y el desplazamiento debe ser vertical.
- Si la lista tiene pocos elementos y no llena la pantalla, en Android no se puede "tirar" y el indicador nunca aparece. Se soluciona dándole a la lista `physics: const AlwaysScrollableScrollPhysics()`.

### Ejemplo mínimo

```dart
RefreshIndicator(
  onRefresh: () async {
    await Future.delayed(const Duration(seconds: 2));
  },
  child: ListView(
    physics: const AlwaysScrollableScrollPhysics(),
    children: const [
      ListTile(title: Text('Inmueble 79940')),
      ListTile(title: Text('Inmueble 79941')),
    ],
  ),
)
```

### Explicación del ejemplo

`onRefresh` recibe una función `async` que devuelve un `Future`. El círculo de carga se queda girando mientras ese `Future` no termine: aquí se simula una espera de 2 segundos con `Future.delayed`, y en una app real sería la consulta a la base de datos. La lista tiene solo dos elementos, por eso lleva `AlwaysScrollableScrollPhysics`: sin eso no se podría arrastrar para refrescar.

### Propiedades importantes

| Propiedad | Qué hace | Ejemplo |
|---|---|---|
| `onRefresh` | Función asíncrona que recarga los datos (obligatoria). | `onRefresh: _recargar` |
| `child` | La lista desplazable que se envuelve (obligatoria). | `child: ListView(...)` |
| `color` | Color del círculo que gira. | `color: Colors.white` |
| `backgroundColor` | Color del fondo del círculo. | `backgroundColor: Colors.blue` |
| `displacement` | Distancia que baja el círculo desde el borde superior. | `displacement: 60` |
| `strokeWidth` | Grosor de la línea del círculo. | `strokeWidth: 3` |
| `triggerMode` | Si el gesto se activa solo en el borde de la lista o en cualquier punto. | `triggerMode: RefreshIndicatorTriggerMode.anywhere` |

### Ejemplo personalizado

Esta lista guarda los códigos en una variable y, al refrescar, "descubre" un inmueble nuevo y actualiza la pantalla:

```dart
class ListaConRefresco extends StatefulWidget {
  const ListaConRefresco({super.key});

  @override
  State<ListaConRefresco> createState() => _ListaConRefrescoState();
}

class _ListaConRefrescoState extends State<ListaConRefresco> {
  final List<String> _codigos = ['79940', '79941'];

  Future<void> _recargar() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      _codigos.add('${79940 + _codigos.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _recargar,
      color: Colors.white,
      backgroundColor: const Color.fromARGB(255, 2, 0, 95),
      displacement: 60,
      strokeWidth: 3,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: _codigos.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Inmueble ${_codigos[index]}'));
        },
      ),
    );
  }
}
```

El círculo de carga queda blanco sobre el azul oscuro de la marca. Después de la espera, `setState` agrega un código nuevo y la lista se redibuja. La línea `if (!mounted) return;` evita usar `setState` si el usuario salió de la pantalla mientras cargaba. Se prueba poniendo el widget como `body` de un `Scaffold`.

Este ejemplo personalizado de código no se pudo probar en DartPad ni en el código de este repositorio. Por lo que estuve investigando, es necesario utilizar un emulador de android para poder realizar el gesto de arrastrar hacia abajo y que aparezca el círculo de carga.

### Dónde lo usaría en Arrendamientos Butaquito

En la pantalla Lista de inmuebles, envolviendo la lista de inmuebles. Hoy los códigos están escritos directamente en el código (`['79940', '79941']`), pero cuando la app se conecte a la base de datos para sincronizar en la nube, el inventarista podrá arrastrar hacia abajo para traer los inmuebles asignados más recientes sin salir de la pantalla ni cerrar sesión. Como la lista actual tiene pocos elementos, habría que usar `AlwaysScrollableScrollPhysics` para que el gesto funcione.

### Fuentes y ayudas usadas

- Documentación oficial: https://api.flutter.dev/flutter/material/RefreshIndicator-class.html
- Utilicé IA para la redacción del Markdown y aclaración de conceptos usando Claude Sonnet 5.5. También para la explicación de este widget que resultó particularmente difícil de entender para mi y su implementación en código que resultó igualmente complicada ya que desconozco muchas de las cosas que se usaron en la demostración de código. Sin embargo me pareció un widget interesante para tener en cuenta a la hora de desarrollar una app móvil como la que estamos desarrollando.
