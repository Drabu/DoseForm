import 'package:doseform/doseform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<DoseFormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: doseForm,
        ),
      ),
    );
  }

  Widget get doseForm {
    return DoseForm(
      formKey: _formKey,
      child: Center(
        child: ListView(
          children: [
            DoseTextField(),
            StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Container(
                    child: DoseTextField(
                      isRequired: true,
                    ),
                  );
                }),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            DoseTextField(
              isRequired: true,
            ),
            ElevatedButton(
              child: const Text('Validate!'),
              onPressed: () {
                _formKey.currentState?.validate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
