import 'package:des_movil_in_vul/Student.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  int age = 21;
  String name = "Vulmaro";
  String id = "";
  bool programing = true;

  final List<String> students = ["", "", ""];
  final Student student1 = Student("Student 1", "S001");
  final Student student2 = Student("Student 2", "S002");

  List<Student> studentList = [];

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtId = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _addStudent() {
    final name = _txtName.text.trim();
    final id = _txtId.text.trim();
    if (name.isEmpty || id.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("El nombre o Id no puede estar vacío")));
      return;
    }
    ;
    setState(() {
      studentList.add(Student(name, id));
      _txtName.clear();
      _txtId.clear();
    });
  }

  Widget _getAllStudents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          "Students:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        ...studentList.map((student) => Text("${student.name} - ${student.id}")).toList(),],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: TextField(
                controller: _txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese su nombre',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: TextField(
                controller: _txtId,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese su Id',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: ElevatedButton(
                onPressed: () {
                  _addStudent();
                },
                child: Text("Agregar estudiante"),
              ),
            ),
            SizedBox(height: 24),
            Text('Nombre : $name'),
            Text('Edad: $age'),
            Text('Malo programando?: $programing'),
            Text("Student 1: ${student1.name} - ${student1.id}"),
            _getAllStudents(),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
