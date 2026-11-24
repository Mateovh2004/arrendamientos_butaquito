import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/usuario.dart';
import '../data/services/auth_service.dart';
import 'datos_exception.dart';

class CuentaRepository {
  CuentaRepository(this._servicio);
  final AuthService _servicio;

  Stream<Usuario?> sesion() => _servicio
      .cambiosDeSesion()
      .asyncMap((u) async => u == null ? null : await _cargarUsuario(u.uid, u.email ?? ''));

  Future<void> registrar(String correo, String clave) =>
      _traducir(() => _servicio.registrar(correo.trim(), clave));

  Future<void> iniciar(String correo, String clave) =>
      _traducir(() => _servicio.iniciar(correo.trim(), clave));

  Future<void> cerrarSesion() => _servicio.cerrarSesion();

  Future<Usuario> _cargarUsuario(String uid, String correo) async {
    try {
      final datos = await _servicio.leerPerfil(uid).timeout(const Duration(seconds: 10));
      if (datos == null) {
        await _servicio.crearPerfil(uid, correo);
        return Usuario(uid: uid, correo: correo, rol: Rol.inventarista);
      }
      return Usuario.desdeMapa(uid, datos);
    } on TimeoutException {
      throw const DatosException('El servidor tardó demasiado. Revisa tu internet e inténtalo de nuevo.');
    } on FirebaseException catch (e) {
      throw DatosException(e.code == 'unavailable'
          ? 'Sin conexión: revisa tu internet'
          : 'No se pudo cargar tu perfil (${e.code})');
    }
  }

  Future<void> _traducir(Future<Object?> Function() accion) async {
    try {
      await accion();
    } on FirebaseAuthException catch (e) {
      throw DatosException(_mensaje(e.code));
    }
  }

  String _mensaje(String codigo) {
    switch (codigo) {
      case 'email-already-in-use':
        return 'Ese correo ya tiene una cuenta';
      case 'weak-password':
        return 'La contraseña es muy corta: usa al menos 6 caracteres';
      case 'invalid-email':
        return 'El correo no tiene un formato válido';
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'Correo o contraseña incorrectos';
      case 'user-disabled':
        return 'Esta cuenta fue deshabilitada';
      case 'too-many-requests':
        return 'Demasiados intentos: espera un momento';
      case 'network-request-failed':
        return 'Sin conexión: revisa tu internet';
      default:
        return 'Error: $codigo';
    }
  }
}