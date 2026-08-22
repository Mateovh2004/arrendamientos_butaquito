# Alcance del proyecto:

## Problema que resuelve 

## Usuario objetivo
Inventaristas, son los principales usuarios que van a utilizar la aplicación, y tambien la empresa en general ya que la información se guardara en el servidor en el que esté la aplicación y no de forma fisica.

## Funcionalidades minimas (MVP)
- Registrar Inventarios.
- Enviar Inventario.
- Registro de usuario.

## Que queda fuera de alcance
- Aplicación web o de escritorio
- Geolocalización del inmueble
- Funcionamiento offline
## Stack
Flutter y Dart. Git y GitHub para el control de versiones. SQLite para el progreso local.
Firebase Authentication y Firestore para el inicio de sesion y la sincronizacion en la nube.
Arquitectura por capas a partir de la unidad del curso que la introduce.
# Especificaciones del proyecto: Arrendamientos Butaquito(lado del inventarista)

## Problema

Arrendamientos Butaquito lleva el registro de sus inventarios de inmuebles manuelamente, lo que lo ha llevado a demorarse en los tiempos de entrega o recepción de inmuebles, tambien se han perdido inventarios y los han tenido que volver a realizar. Estas demoras terminan afectando a la reputación de la empresa por lo cual es necesaria una solución tecnologica que permita agilizar estos tiempos en los que se realiza el inventario y modernizar la forma en la que se comparte el inventario de los inmuebles con arrendatarios, propietarios y asesores.

## Stakeholders
-Inventarista
-Asesor
-inquilino
-propietario

## Actores
- Inventarista
- Administrador
- API gmail


## Objetivo y metricas de exito
1. Métrica: Tiempo para hacer Inventario
   Actual: Actualmente mientras registran la casa y anotan cada detalle hacen dos inventarios por día, es decir se demoran 4 horas
   Objetivo: optimizar este tiempo y que con las fotos solo pongan detalles que hay, la meta es que se demoren 2 horas o menos por inventario
2. Métrica: Reducir la pérdida de inventarios
   Actual: Actualmente se han perdido inventarios
   Objetivo: el objetivo es que no se pierdan los inventarios
3. Métrica: Disminuir el tiempo de entrega del inventario
   Actual: Actualmente se debe esperar a que llegue el inventario a la sede para entregarselo al cliente
   Objetivo: apenas el inventarista termine su inventario, inmediatamente lo envíe al correo
4. Métrica:Mejorar la trazabilidad
   Actual: Actualmente no se lleva un registro pues muchos de los inventarios se pierden
   Objetivo: llevar el 100%  de la trazabilidad del inmueble que se va a arrendar
5. Métrica: Mejorar la calidad de los inventarios
   Actual: Actualmente se reciben quejas de los propietarios indicando el mal estado del inmueble, al no comprobar con exactitud el estado  en el que la inmobiliaria lo recibe no le responden al propietario
   Objetivo: al tener las fotos se puede dar respaldo del inventario hecho para asi tener una mayor claridad y orientación
   

   
## Restricciones
Tecnología. Flutter y Dart, sin otro stack.
Tiempo. Las 14 semanas del curso, no más.
Equipo. Grupos de trabajo de 3 personas
solo sera aplicación movil

## Alcance
El proyecto contempla el desarrollo de una solución tecnológica para digitalizar y agilizar el proceso de elaboración, almacenamiento y distribución de inventarios de inmuebles de Arrendamientos Butaquito.

La solución permitirá que el inventarista registre la información del inmueble mediante fotografías y detalles de cada espacio o elemento encontrado, reduciendo el tiempo requerido para realizar el inventario. La información será almacenada digitalmente para evitar pérdidas o reprocesos.

Además, el sistema permitirá al administrador consultar, gestionar y compartir los inventarios terminados con los diferentes interesados, como propietarios, inquilinos y asesores. Para facilitar esta distribución, se contempla la integración con la API de Gmail, permitiendo enviar los inventarios de manera más rápida y automatizada.
### Incluyedebe tener:
- Inicio de sesión
- registro de inventarios
- Envío del inventario por correo electrónico
- Almacenamiento en bases de datos
### No incluye
- Aplicación web o de escritorio
- Geolocalización del inmueble
- Funcionamiento offline

## Conceptos del dominio
- Inventarista. Persona encargada de revisar físicamente un inmueble y registrar su estado.
- Inmueble. Propiedad que es entregada o recibida y sobre la cual se realiza un inventario.
- Inventario. Registro del estado y las condiciones físicas de un inmueble en un momento determinado.
- Propietario. Persona dueña del inmueble que recibe o consulta información sobre su estado.
- Inquilino. Persona que arrienda el inmueble y participa en la entrega o recepción del mismo.
- Asesor. Persona de Arrendamientos Butaquito encargada de gestionar el proceso de arrendamiento del inmueble.
- Administrador. Persona encargada de gestionar los inventarios y su distribución dentro de la empresa.
-Espacio. Parte del inmueble que es revisada durante el inventario, como una habitación, cocina, baño, sala o patio.
- Elemento. Objeto o componente perteneciente a un espacio que puede ser revisado durante el inventario, como una puerta, ventana, enchufe o mueble.
-   Novedad. Condición, daño, defecto o característica particular encontrada en un espacio o elemento durante el inventario.
Relaciones del dominio

Un Inventarista realiza un Inventario de un Inmueble, registrando el estado de sus Espacios, Elementos y Novedades. Un Propietario y un Inquilino están relacionados con el Inmueble, mientras que un Asesor gestiona su proceso de arrendamiento.

## Reglas de negocio

RN-01. Un inventario no se puede enviar si está incompleto.

RN-02. Un inventario debe corresponder a un inmueble.

RN-03. Un inventario debe ser realizado por un inventarista.

RN-04. Un inventario debe registrar el estado de los espacios que hacen parte del inmueble.

RN-05. Una novedad debe estar asociada al espacio o elemento donde fue encontrada.

RN-06. Un inventario solo se puede entregar al propietario, inquilino o asesor relacionado con el inmueble.

RN-07. Un inventario realizado debe conservarse como registro del estado del inmueble en el momento en que fue realizado.

RN-08. Un inventario no se puede considerar terminado mientras tenga información pendiente de registrar.

## Historias de usuario
- Crear inventario:Como inventarista quiero crear un inventario para solo un inmueble
- Registrar espacios de inmueble: Como inventarista quiero registrar los espacio del inmueble
- Registrar novedades: Como inventarista  quiero registrar las novedades encontradas en cada espacio
- Adjuntar fotografías: Como inventarista quiero asociar las fotos de los espacios y novedades encontradas en el inmueble
- Guardar un inventario: Como inventarista quiero guardar un inventario asi no esté terminado, para poder continuar con el registro posteriormente
- Consultar información pendiente: Como inventarista quiero consultar la información que falta por registrar en el inventario, para poder completarlo antes de finalizarlo.
- Finalizar un inventario: Como inventarista quiero finalizar un inventario cuando toda la información requerida esté registrada, para dejarlo listo para ser entregado.
- Evitar enviar inventarios incompletos: Como administrador quiero evitar que se envíen inventarios incompletos, para asegurar que la información entregada sea correcta y suficiente.
- Consultar inventarios: Como administrador quiero consultar los inventarios realizados, para hacer seguimiento a los inventarios de los inmuebles.
- Consultar el estado del inventario: Como administrador quiero consultar el estado de los inventarios, para identificar cuáles están pendientes, en proceso o finalizados.
- Identificar al responsable del inventario: Como administrador quiero identificar qué inventarista realizó cada inventario, para mantener un registro del responsable del proceso.
- Compartir un inventario por correo: Como administrador quiero enviar un inventario terminado por correo electrónico, para compartirlo con el propietario, inquilino o asesor correspondiente.
- Recibir el inventario: Como propietario quiero recibir el inventario de mi inmueble, para conocer y conservar el registro de su estado.
## Casos de uso
CU-01. Crear inventario
    Actor:Inventarista.
    Precondición: El inmueble ya está registrado.
    Flujo principal.
        El inventarista selecciona la opción para crear un inventario.
        El inventarista selecciona el inmueble.
        La aplicación crea el inventario asociado al inmueble.
        La aplicación muestra el inventario para comenzar a registrarlo.
    Excepción:Si el inmueble ya tiene un inventario activo, la aplicación informa al inventarista y no permite crear otro inventario.
CU-02. Registrar espacios del inmueble
Actor: Inventarista.
    Precondición: El inventarista ya tiene un inventario creado.
    Flujo principal.
        El inventarista selecciona la opción para agregar un espacio.
        El inventarista registra el nombre del espacio.
        La aplicación guarda el espacio asociado al inventario.
        La aplicación permite continuar registrando otros espacios.
    Excepción: Si el inventarista no registra la información requerida del espacio, la aplicación solicita completar la información antes de guardarlo.
CU-03. Registrar novedades
    Actor: Inventarista.
    Precondición:El inventarista ya tiene un inventario con al menos un espacio registrado.
    Flujo principal.
        El inventarista selecciona un espacio del inmueble.
        El inventarista selecciona la opción para registrar una novedad.
        El inventarista describe la novedad encontrada.
        La aplicación guarda la novedad asociada al espacio.
    Excepción: Si el inventarista no registra la descripción de la novedad, la aplicación solicita completar la información antes de guardarla.
CU-04. Adjuntar fotografías
Actor: Inventarista.
Precondición: El inventarista ya tiene un espacio o una novedad registrada.
Flujo principal.
    El inventarista selecciona el espacio o la novedad.
    El inventarista selecciona la opción para agregar una fotografía.
    El inventarista toma o selecciona una fotografía.
    La aplicación asocia la fotografía al espacio o novedad seleccionada.
    La aplicación guarda la fotografía en el inventario.
Excepción: Si la fotografía no se puede cargar, la aplicación informa al inventarista y permite intentar nuevamente.
CU-05. Guardar inventario
Actor: Inventarista.
Precondición: El inventarista ya tiene un inventario creado.
Flujo principal.
    El inventarista registra la información disponible del inmueble.
    El inventarista selecciona la opción de guardar.
    La aplicación almacena la información registrada.
    La aplicación mantiene el inventario disponible para continuar posteriormente.
Excepción: Si ocurre un error al guardar la información, la aplicación informa al inventarista que el inventario no pudo guardarse.
CU-06. Consultar información pendiente
Actor: Inventarista.
Precondición: El inventarista ya tiene un inventario guardado que no ha sido finalizado.
Flujo principal.
    El inventarista abre el inventario.
    La aplicación revisa la información registrada.
    La aplicación muestra la información que falta por registrar.
    El inventarista selecciona la información pendiente que desea completar.
Excepción: Si el inventario no tiene información pendiente, la aplicación informa al inventarista que el inventario está completo.
CU-07. Finalizar inventario
Actor: Inventarista.
Precondición: El inventarista tiene un inventario con la información requerida registrada.
Flujo principal.
    El inventarista selecciona la opción de finalizar inventario.
    La aplicación verifica que la información requerida esté completa.
    La aplicación marca el inventario como finalizado.
    La aplicación permite que el inventario sea enviado.
Excepción: Si falta información requerida, la aplicación no permite finalizar el inventario y muestra al inventarista qué información debe completar.
CU-08. Enviar inventario
Actor: Administrador-Inventarista.
Precondición. El inventario ya está finalizado.
Flujo principal.
    El administrador selecciona el inventario que desea enviar.
    El administrador selecciona el destinatario.
    La aplicación verifica que el inventario esté completo.
    La aplicación envía el inventario mediante la API de Gmail.
    La aplicación informa al administrador que el inventario fue enviado.
Excepción: Si el inventario está incompleto, la aplicación no permite enviarlo y solicita completar la información faltante.

## Flujo de pantallas

## Propuestas de diseno y mockups

