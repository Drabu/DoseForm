part of doseform;

class DoseTextField extends StatelessWidget {
  final bool isRequired;
  final FocusNode? currentNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;

  final ValueChanged<String>? onChanged;
  final String? hint;
  final String? error;
  final int? errorMaxLines;
  final InputDecoration? decoration;
  final int? maxLength;
  final FocusNode? nextNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final AutovalidateMode? autovalidateMode;
  final void Function(String?)? onFieldSubmitted;
  final TextStyle? style;
  final bool obscureText;
  final TextAlign? textAlign;
  final bool? autofocus;

//   final String heading;
//   final String value;

  DoseTextField({
    this.isRequired = false,
    this.onChanged,
    this.hint,
    this.error,
    this.errorMaxLines,
    this.maxLength,
    this.nextNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines,
    this.minLines,
    this.onSaved,
    this.formatters,
    FocusNode? currentNode,
    TextEditingController? controller,
    InputDecoration? decoration,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onFieldSubmitted,
    this.style,
    this.obscureText = false,
    this.textAlign,
    this.autofocus =false,
  })  : currentNode = currentNode ?? FocusNode(),
        controller = controller ?? TextEditingController(),
        decoration = decoration ??
            InputDecoration(
              hintText: hint,
              errorText: error,
              errorMaxLines: errorMaxLines,
            );

  @override
  Widget build(BuildContext context) {
    InheritedLayer.of(context)?.register(this);
    return TextFormField(
      controller: controller,
      autofocus:autofocus,
      focusNode: currentNode,
      onChanged: onChanged,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: decoration,
      textInputAction: nextNode != null ? TextInputAction.next : TextInputAction.done,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      inputFormatters: formatters,
      textCapitalization: textCapitalization,
      onSaved: onSaved,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      style: style,
      obscureText: obscureText,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
