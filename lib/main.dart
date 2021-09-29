import 'package:flutter/material.dart';
import 'package:validator/dose_form.dart';

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
      key: _formKey,
      child: Column(
        children: [
          DoseTextField(),
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
    );
  }
}