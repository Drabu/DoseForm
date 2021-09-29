part of doseform;

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