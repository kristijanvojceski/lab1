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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const CoursesScreen(),
    );
  }
}

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  List<String> _courses = [];

  void addCourse(){
    showDialog(context: context, builder: (BuildContext context){
      String newCourse = "";
      return AlertDialog(
        title : const Text("Add new Course"),
        content: TextField(
          onChanged: (value){
          newCourse = value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed:(){
                setState(() {
                  if(newCourse.isNotEmpty){
                    _courses.add(newCourse);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Add Course"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("181208"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary ,
      ),
      body: ListView.builder(
        itemCount: _courses.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title:Text(_courses[index],style: const TextStyle(fontSize: 18),),
              trailing: IconButton(icon:
                const Icon(Icons.delete_rounded),onPressed: (){
                setState(() {
                  _courses.removeAt(index);
                });
                }
              ,)
            ),
          );
        }),
      floatingActionButton: FloatingActionButton(onPressed: addCourse,
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}


