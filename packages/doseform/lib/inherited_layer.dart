part of doseform;

class InheritedLayer extends InheritedWidget {
  final List<Object> _fields = [];
  InheritedLayer({required Widget child}) : super(child: child);

  static InheritedLayer? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<InheritedLayer>();

  register(dynamic state) {
    _fields.add(state);
  }

  bool validate() {
    for (var state in _fields) {
      if (state is DoseTextField && state.isRequired) {
        state.validator!.call(state.controller?.text) != null
            ? state.focusNode!.requestFocus()
            : print('');
        return false;
      } else if (state is DoseFormFieldState && state.widget.validator != null) {
        state.widget.validator!();
        Scrollable.ensureVisible(state.context);
        return false;
      }
    }
    return true;
  }

  void reset() {
    _fields.forEach((state) {
      state is DoseTextField ? state.controller!.clear() : print('');
    });
  }

  @override
  bool updateShouldNotify(InheritedLayer heera) => heera.child != child;
}
