class DatosException implements Exception {
  const DatosException(this.mensaje);
  final String mensaje;

  @override
  String toString() => mensaje;
} 