import 'package:flutter/material.dart';
import 'package:doseform/main.dart';

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
        floatingActionButton: ElevatedButton(
          child: Text('Refresh'),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget get doseForm {
    return DoseForm(
      formKey: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Validate!'),
                onPressed: () {
                  _formKey.currentState?.validate();
                },
              ),
              StreamBuilder<Object>(
                stream: null,
                builder: (context, snapshot) {
                  return Container(
                    child: DoseTextField(
                      validator: (String? v) {
                        if (v!.contains('other') || v.isEmpty)
                          return "some validation";
                        else
                          return null;
                      },
                      isRequired: true,
                    ),
                  );
                },
              ),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              DoseTextField(),
              SizedBox(
                height: 1000,
              ),
              DoseFormField(
                child: Text(
                  'Focus here ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                validator: () => null,
              ),
              DoseTextField(
                isRequired: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
