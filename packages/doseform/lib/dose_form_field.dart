part of doseform;

class DoseFormField extends StatefulWidget {
  final Widget child;
  final String? Function()? validator;
  final FocusNode focusNode;

  DoseFormField({
    required this.child,
    required this.validator,
    FocusNode? focusNode,
  }) : focusNode = focusNode ?? FocusNode();

  @override
  DoseFormFieldState createState() => DoseFormFieldState();
}

class DoseFormFieldState extends State<DoseFormField> {
  @override
  Widget build(BuildContext context) {
    InheritedLayer.of(context)!.register(this);
    return widget.child;
  }
}
