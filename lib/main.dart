import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'repositories/cuenta_repository.dart';
import 'data/services/auth_service.dart';
import 'domain/models/usuario.dart';
import 'firebase_options.dart';
import 'ui/cuenta/view_models/cuenta_view_model.dart';
import 'ui/cuenta/widgets/cuenta_pantalla.dart';
import 'ui/inventarios/widgets/lista_inventarios.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final cuenta = CuentaViewModel(CuentaRepository(AuthService()));
  runApp(MainApp(cuenta: cuenta));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.cuenta});
  final CuentaViewModel cuenta;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<Usuario?>(
        stream: cuenta.sesion,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(snapshot.error.toString(), textAlign: TextAlign.center),
                    FilledButton(onPressed: cuenta.cerrarSesion, child: const Text('Volver al inicio')),
                  ],
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          final usuario = snapshot.data;
          if (usuario == null) return CuentaPantalla(viewModel: cuenta);
          return ListaInventarios(usuario: usuario, onCerrarSesion: cuenta.cerrarSesion);
        },
      ),
    );
  }
}