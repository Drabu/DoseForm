import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoseForm extends StatefulWidget {
  final Widget? child;
  const DoseForm({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  DoseFormState createState() => DoseFormState();
}

class DoseFormState extends State<DoseForm> {
  final _formKey = GlobalKey<FormState>();
  List<FocusNode?> foucNodeList = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: _extract(),
      ),
    );
  }

  List<Widget> _extract() {
    final widgetList = (widget.child as Column).children;
    for (var element in widgetList) {
      if (element is DoseTextField) {
        foucNodeList.add(element.currentNode);
      }
    }
    return widgetList;
  }

  bool validate() {
    final _formValidationState = _formKey.currentState?.validate();
    var _formFocusState = false;

    for (var element in (widget.child as Column).children) {
      if (element is DoseTextField && element.isRequired) {
        if (element.textEditingController!.text.isEmpty) {
          //request focus
          element.currentNode!.requestFocus();
          _formFocusState = true;
          break;
        }
      }
    }
    return _formValidationState ?? true && _formFocusState;
  }

  @override
  void dispose() {
    super.dispose();
    for (var node in foucNodeList) {
      node?.dispose();
    }
  }
}

class DoseTextField extends StatelessWidget {
  final bool isRequired;
  final FocusNode? currentNode;
  final TextEditingController? textEditingController;
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
  final String Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final void Function(String?)? onSaved;

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
    TextEditingController? textEditingController,
    InputDecoration? decoration,
  })  : currentNode = currentNode ?? FocusNode(),
        textEditingController = textEditingController ?? TextEditingController(),
        decoration = decoration ??
            InputDecoration(
              hintText: hint,
              errorText: error,
              errorMaxLines: errorMaxLines,
            );

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: textEditingController,
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
      );
}
