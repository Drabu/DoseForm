part of doseform;

class MiddleWare extends StatefulWidget {
  final Widget child;
  const MiddleWare({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  DoseFormState createState() => DoseFormState();
}

class DoseFormState extends State<MiddleWare> {
  final _formKey = GlobalKey<FormState>();
  List<FocusNode?> foucNodeList = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child,
    );
  }

  bool validate() {
    return (_formKey.currentState?.validate() ?? true) &&
        (InheritedLayer.of(context)?.validate() ?? true);
  }

  void save() {
    _formKey.currentState!.save();
  }

  void reset() {
    InheritedLayer.of(context)?.reset();
  }

  @override
  void dispose() {
    super.dispose();
    for (var node in foucNodeList) {
      node?.dispose();
    }
  }
}
