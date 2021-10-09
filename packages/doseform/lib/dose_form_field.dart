part of doseform;

class DoseFormField extends StatefulWidget {
  final Widget child;
  final String? Function()? validator;
  final FocusNode focusNode;
  final GlobalKey<DoseFormFieldState> fieldKey;

  DoseFormField({
    required this.fieldKey,
    required this.child,
    required this.validator,
    FocusNode? focusNode,
  })  : focusNode = focusNode ?? FocusNode(),
        super(key: fieldKey);

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

// class DoseValidatorError {
//   String title,
//   String
// }
