enum Rol {inventarista, administrador}

class Usuario {
  const Usuario({required this.uid, required this.correo, required this.rol});

  final String uid;
  final String correo;
  final Rol rol;

  bool get esAdmin => rol == Rol.administrador;

  factory Usuario.desdeMapa(String uid, Map<String, dynamic> m){
    final nombre = m['rol'] as String?;
    final rol = Rol.values.where((r) => r.name == nombre).firstOrNull ?? Rol.inventarista;
    return Usuario(uid: uid, correo: (m['correo'] ?? '') as String, rol: rol);
  }
}
