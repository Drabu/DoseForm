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
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: widget.child,
      );

  void save() => _formKey.currentState!.save();

  void reset() => InheritedLayer.of(context)?.reset();

  bool validate() {
    final _formInternalValidationResult = (_formKey.currentState?.validate() ?? true);
    final _focusValdiation = (InheritedLayer.of(context)?.validate() ?? true);
    return _formInternalValidationResult && _focusValdiation;
  }

  @override
  void dispose() {
    super.dispose();
    for (var node in foucNodeList) {
      node?.dispose();
    }
  }
}
