import 'package:flutter/foundation.dart';
import '../../../data/services/auth_service.dart';
import '../../../repositories/datos_exception.dart';
import '../../../repositories/cuenta_repository.dart';
import '../../../domain/models/usuario.dart';

class CuentaViewModel extends ChangeNotifier {
  CuentaViewModel(this._repo);
  final CuentaRepository _repo;

  late final Stream<Usuario?> sesion = _repo.sesion();
  bool cargando = false;
  String? error;

  Future<void> iniciar(String correo, String clave) =>
      _ejecutar(correo, clave, () => _repo.iniciar(correo, clave));

  Future<void> registrar(String correo, String clave) =>
      _ejecutar(correo, clave, () => _repo.registrar(correo, clave));

  Future<void> cerrarSesion() => _repo.cerrarSesion();

  Future<void> _ejecutar(String correo, String clave, Future<void> Function() accion) async {
    if (correo.trim().isEmpty || clave.isEmpty) {
      error = 'Escribe tu correo y tu contraseña';
      notifyListeners();
      return;
    }
    cargando = true;
    error = null;
    notifyListeners();
    try {
      await accion();
    } on DatosException catch (e) {
      error = e.mensaje;
    } finally {
      cargando = false;
      notifyListeners();
    }
  }
}