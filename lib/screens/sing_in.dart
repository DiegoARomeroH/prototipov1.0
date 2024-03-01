import 'package:flutter/material.dart';
import 'package:prototipo_v1/screens/home_screen.dart';

void main() {
  runApp(const SingIn());
}

class SingIn extends StatelessWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In Form',
      debugShowCheckedModeBanner: false, // Oculta la barra de depuración
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Cambio de color de la AppBar
        title: const Text('Sign In Form'),
        leading: IconButton( // Añadir un botón de retroceso
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
                    final ruta = MaterialPageRoute(builder: (context){
                      return const MyApp();
                    });
                    Navigator.push(context, ruta);
                  },
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 550,
          decoration: BoxDecoration(
            color: Colors.blue, // Color del fondo
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 230, // Ajuste de la altura del cuadro blanco
                  decoration: BoxDecoration(
                    color: Colors.white, // Color del cuadrado interior
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
