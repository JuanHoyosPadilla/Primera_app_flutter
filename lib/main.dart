import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Primera App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textoController1 = TextEditingController();
  final TextEditingController _textoController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            widget.title,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textoController1,
                decoration:
                    const InputDecoration(labelText: 'Ingrese su Nombre'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textoController2,
                decoration:
                    const InputDecoration(labelText: 'Ingrese su Apellido'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                   showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Datos ingresados'),
                        content:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Hola ${_textoController1.text} ${_textoController2.text}'),
                          ],
                        ),
                        actions: [
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text('Cerrar'))
                        ],
                      );
                    },
                   );
                  },
                  child: const Text('Enviar'))
            ],
          ),
        ));
  }
}
