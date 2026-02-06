import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contador")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contador", style: TextStyle(fontSize: 20)),
            Text(
              "$contador",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
              child: Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  String nombre = "";
  String email = "";
  int edad = 18;
  bool aceptarTerminos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario con estado")),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  nombre = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Text("Edad", style: TextStyle(fontWeight: FontWeight.bold)),
                Slider(
                  value: edad.toDouble(),
                  min: 18,
                  max: 100,
                  divisions: 82,
                  label: "$edad años",

                  onChanged: (value) {
                    setState(() {
                      edad = value.toInt();
                    });
                  },
                ),
                SizedBox(height: 16),
                CheckboxListTile(
                  title: Text("Acepto términos y condiciones"),
                  value: aceptarTerminos,
                  onChanged: (valor) {
                    setState(() {
                      aceptarTerminos = valor ?? false;
                    });
                  },
                ),
                SizedBox(height: 24),
                Card(
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DefaultTextStyle(
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DATOS DEL FORMULARIO",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text("Nombre: $nombre"),
                          Text("Email: $email"),
                          Text("Edad: $edad años"),
                          Text(
                            "Términos aceptados:  ${aceptarTerminos ? "Sí" : "No"}",
                          ),
                        ],
                      ),
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

//Lista dinámica para agregar y eliminar items

class ListaDinamica extends StatefulWidget {
  const ListaDinamica({super.key});

  @override
  State<ListaDinamica> createState() => _ListaDinamicaState();
}

class _ListaDinamicaState extends State<ListaDinamica> {
  List<String> tareas = [];
  late TextEditingController _controllerTarea;

  @override
  void initState() {
    super.initState();
    _controllerTarea = TextEditingController();
    // tareas = ['Tarea1', 'Tarea2', 'Tarea3'];
  }

  @override
  void dispose() {
    _controllerTarea.dispose();
    super.dispose();
  }

  void agregarTarea() {
    if (_controllerTarea.text.isNotEmpty) {
      setState(() {
        tareas.add(_controllerTarea.text);
        _controllerTarea.clear();
      });
      // _controller.clear();
    }
  }

  void eliminarTarea(int index) {
    setState(() {
      tareas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista dinámica")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controllerTarea,
                  decoration: InputDecoration(
                    hintText: "Nueva tarea ...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                onPressed: agregarTarea,
                child: Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: tareas.isEmpty
                ? Text(
                    "No hay tareas",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                : ListView.builder(
                    itemCount: tareas.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text("${index + 1}")),
                        title: Text(tareas[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // IconButton(onPressed: (){}, icon: Icon(Icons.abc, color: Colors.green)),
                            IconButton(
                              onPressed: () => eliminarTarea(index),
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
