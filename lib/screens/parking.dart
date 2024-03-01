import 'package:flutter/material.dart';
import 'package:prototipo_v1/screens/home_screen.dart';

void main() {
  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // Color del fondo de la AppBar
        ),
      ),
      home: const ParkingScreen(),
    );
  }
}

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({Key? key}) : super(key: key);

  @override
  ParkingScreenState createState() => ParkingScreenState();
}

class ParkingScreenState extends State<ParkingScreen> {
  List<bool> parkingSpaces = List.generate(10, (index) => false);

  void toggleParkingSpace(int index) {
    setState(() {
      parkingSpaces[index] = !parkingSpaces[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Lot'),
        leading: IconButton(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Estado del parking:',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: List.generate(
                    5,
                    (index) => ParkingSpace(
                      index: index,
                      occupied: parkingSpaces[index],
                      onPressed: () => toggleParkingSpace(index),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    5,
                    (index) => ParkingSpace(
                      index: index + 5,
                      occupied: parkingSpaces[index + 5],
                      onPressed: () => toggleParkingSpace(index + 5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingSpace extends StatelessWidget {
  final int index;
  final bool occupied;
  final VoidCallback onPressed;

  const ParkingSpace({
    Key? key,
    required this.index,
    required this.occupied,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          occupied ? Icons.car_rental : Icons.local_parking,
          size: 50.0,
          color: occupied ? Colors.red : Colors.green,
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(occupied ? 'Ocupado' : 'Libre'),
        ),
      ],
    );
  }
}
