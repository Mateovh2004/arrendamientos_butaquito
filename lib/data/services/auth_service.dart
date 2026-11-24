import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService({FirebaseAuth? auth, FirebaseFirestore? db})
      : _auth = auth ?? FirebaseAuth.instance,
        _db = db ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _db;

  Stream<User?> cambiosDeSesion() => _auth.authStateChanges();

  Future<UserCredential> registrar(String correo, String clave) =>
      _auth.createUserWithEmailAndPassword(email: correo, password: clave);

  Future<UserCredential> iniciar(String correo, String clave) =>
      _auth.signInWithEmailAndPassword(email: correo, password: clave);

  Future<void> cerrarSesion() => _auth.signOut();

  Future<Map<String, dynamic>?> leerPerfil(String uid) async {
    final d = await _db.collection('usuarios').doc(uid).get();
    return d.data();
  }

  Future<void> crearPerfil(String uid, String correo) =>
      _db.collection('usuarios').doc(uid).set({'correo': correo, 'rol': 'inventarista'});
}