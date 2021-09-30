part of doseform;

class InheritedLayer extends InheritedWidget {
  final List<DoseTextField> _fields = [];
  InheritedLayer({required Widget child}) : super(child: child);

  static InheritedLayer? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<InheritedLayer>();

  register(DoseTextField state) {
    _fields.add(state);
  }

  bool validate() {
    for (var state in _fields) {
      if (state.isRequired && state.controller!.text.isEmpty) {
        state.currentNode!.requestFocus();
        return false;
      }
    }
    return true;
  }

  void reset() {
    _fields.forEach((state) {
      state.controller!.text = "Sam";
    });
  }

  @override
  bool updateShouldNotify(InheritedLayer heera) => heera.child != child;
}
