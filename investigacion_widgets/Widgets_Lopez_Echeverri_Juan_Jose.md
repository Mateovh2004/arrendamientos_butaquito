# Investigación de widgets de Flutter

**Nombre del estudiante:** Juan José López Echeverri<br>
**Grupo:** 602<br>
**Fecha:** 16 de octubre de 2026<br>

**Mis widgets:** `LinearProgressIndicator`, `CalendarDatePicker`, `RefreshIndicator`

## 1. `LinearProgressIndicator`

### Qué es y para qué sirve

`LinearProgressIndicator` dibuja una barra horizontal que muestra cuánto falta para terminar algo. Tiene dos modos: **determinado**, cuando se sabe el avance exacto (por ejemplo, 60 %), y indeterminado, cuando solo se quiere indicar que algo está cargando y no se sabe cuánto falta; en ese caso la barra se anima de forma continua.

Resuelve un problema de comunicación con el usuario: que sepa que la app está trabajando o cuánto le falta para terminar una tarea larga, sin tener que escribir porcentajes a mano ni dibujar la barra con contenedores.

### Cuándo usarlo y cuándo no

Es la mejor opción para tareas con pasos medibles (llenar un formulario largo, completar una lista de revisión) y para esperas de duración desconocida, como subir información a un servidor. No conviene cuando la espera es tan corta que la barra apenas parpadea, ni cuando el avance que se muestra no es real: una barra que no refleja el progreso verdadero confunde más de lo que ayuda.

La barra ocupa todo el ancho que le den. Dentro de una `Column` se estira sola, pero dentro de una `Row` hay que envolverla en un `Expanded`, o Flutter lanzará un error de tamaño.

### Ejemplo mínimo

```dart
const LinearProgressIndicator(value: 0.6)
```

### Explicación del ejemplo

El parámetro `value` va de 0.0 (vacía) a 1.0 (llena). Con `0.6` la barra se pinta llena hasta el 60 %. Si se omite `value` (o se pone `null`), la barra pasa al modo indeterminado y se anima sin parar. Para probarlo, se coloca dentro del `body` de un `Scaffold` con algo de `Padding`.

### Propiedades importantes

| Propiedad         | Qué hace                                                         | Ejemplo                                     |
| ----------------- | ---------------------------------------------------------------- | ------------------------------------------- |
| `value`           | Avance de 0.0 a 1.0. Si es `null`, la barra es indeterminada.    | `value: 0.6`                                |
| `minHeight`       | Grosor de la barra.                                              | `minHeight: 10`                             |
| `color`           | Color de la parte que avanza.                                    | `color: Colors.blue`                        |
| `backgroundColor` | Color del fondo de la barra (la parte que falta).                | `backgroundColor: Colors.grey.shade300`     |
| `borderRadius`    | Redondea las esquinas de la barra.                               | `borderRadius: BorderRadius.circular(8)`    |
| `semanticsLabel`  | Texto que leen los lectores de pantalla para describir la barra. | `semanticsLabel: 'Progreso del inventario'` |

### Ejemplo personalizado

Este ejemplo calcula el progreso a partir de cuántos espacios del inmueble están completos y actualiza la barra cada vez que se completa uno:

```dart
class ProgresoInventario extends StatefulWidget {
  const ProgresoInventario({super.key});

  @override
  State<ProgresoInventario> createState() => _ProgresoInventarioState();
}

class _ProgresoInventarioState extends State<ProgresoInventario> {
  final int _totalEspacios = 3;
  int _espaciosCompletos = 0;

  @override
  Widget build(BuildContext context) {
    final progreso = _espaciosCompletos / _totalEspacios;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('$_espaciosCompletos de $_totalEspacios espacios completos'),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progreso,
          minHeight: 10,
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 2, 0, 95),
          backgroundColor: Colors.grey.shade300,
          semanticsLabel: 'Progreso del inventario',
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: _espaciosCompletos < _totalEspacios
              ? () => setState(() => _espaciosCompletos++)
              : null,
          child: const Text('Completar un espacio'),
        ),
      ],
    );
  }
}
```

La barra usa el azul oscuro de la marca. El progreso es simplemente `espaciosCompletos / totalEspacios`, así que al llegar a 3 de 3 la barra queda llena y el botón se deshabilita. En una pantalla real, `_espaciosCompletos` saldría de revisar qué espacios ya tienen estado, fotos y novedades.

### Dónde lo usaría en Arrendamientos Butaquito

En la pantalla Crear inventario, en la parte de arriba, para mostrar cuántos espacios (Paredes, Cocina, Sala, etc.) ya fueron diligenciados. Ayuda al inventarista a ver qué le falta.

También en la pantalla Enviar inventario, en modo indeterminado, mientras se envía el correo con la API de Gmail. Hoy la app muestra el mensaje de confirmación de inmediato; con la barra el usuario vería que el envío está en proceso y no lo daría por terminado antes de tiempo.

### Fuentes y ayudas usadas

- Documentación oficial: https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html
- Utilicé IA para la redacción del Markdown y aclaración de conceptos usando Claude Sonnet 5.5.
- El ejemplo se probó en DartPad apoyado de Gemini AI para corrección de errores.

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

| Propiedad                | Qué hace                                                                              | Ejemplo                                                       |
| ------------------------ | ------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| `initialDate`            | Fecha seleccionada al abrir el calendario (obligatoria).                              | `initialDate: DateTime.now()`                                 |
| `firstDate`              | Primera fecha que se puede elegir (obligatoria).                                      | `firstDate: DateTime(2020)`                                   |
| `lastDate`               | Última fecha que se puede elegir (obligatoria).                                       | `lastDate: DateTime(2030)`                                    |
| `onDateChanged`          | Se llama al tocar un día y entrega la fecha elegida (obligatoria).                    | `onDateChanged: (f) {...}`                                    |
| `selectableDayPredicate` | Función que decide si un día se puede seleccionar; los demás aparecen deshabilitados. | `selectableDayPredicate: (d) => d.weekday != DateTime.sunday` |
| `currentDate`            | Fecha que se marca como "hoy"; por defecto es la fecha real.                          | `currentDate: DateTime.now()`                                 |
| `initialCalendarMode`    | Si abre mostrando días o la lista de años.                                            | `initialCalendarMode: DatePickerMode.year`                    |

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

| Propiedad         | Qué hace                                                                 | Ejemplo                                             |
| ----------------- | ------------------------------------------------------------------------ | --------------------------------------------------- |
| `onRefresh`       | Función asíncrona que recarga los datos (obligatoria).                   | `onRefresh: _recargar`                              |
| `child`           | La lista desplazable que se envuelve (obligatoria).                      | `child: ListView(...)`                              |
| `color`           | Color del círculo que gira.                                              | `color: Colors.white`                               |
| `backgroundColor` | Color del fondo del círculo.                                             | `backgroundColor: Colors.blue`                      |
| `displacement`    | Distancia que baja el círculo desde el borde superior.                   | `displacement: 60`                                  |
| `strokeWidth`     | Grosor de la línea del círculo.                                          | `strokeWidth: 3`                                    |
| `triggerMode`     | Si el gesto se activa solo en el borde de la lista o en cualquier punto. | `triggerMode: RefreshIndicatorTriggerMode.anywhere` |

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