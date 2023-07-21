import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LanguageChange(),
    );
  }
}
class LanguageChange extends StatefulWidget {
  const LanguageChange({super.key});

  @override
  State<LanguageChange> createState() => _LanguageChangeState();
}

class _LanguageChangeState extends State<LanguageChange> {
  String selectedValue='en';
  final Map<String,String>_translate={
    "en":"Hello,Welcome to our app",
    'es': 'Hello, bienvenido a nuestra aplicación!',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Language Change Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_translate[selectedValue]!),
            // type<T> is the value that each dropdown button represent
            DropdownButton<String>(
              //hold currently selected items
              value: selectedValue,
              items: const [
                DropdownMenuItem(
                    value:"en",
                    child: Text("English")),
                DropdownMenuItem(
                    value:'es',
                    child: Text("Spanish"))
              ],

              /*As the user interacts with the dropdown menu and selects an
               item, the onChanged callback is triggered. In the callback,
                the setState function is used to update the selectedValue with the new
                value that the user selected. This change triggers a rebuild of the UI,
                and the DropdownButton updates to show the newly selected item as the currently selected one.*/
              onChanged: (newValue) {
                setState(() {
                  selectedValue=newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

