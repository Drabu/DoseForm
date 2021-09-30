part of doseform;

class DoseForm extends StatelessWidget {
  final Widget child;
  final Key? formKey;
  const DoseForm({
    Key? key,
    required this.child,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) => InheritedLayer(
        child: MiddleWare(
          key: formKey,
          child: child,
        ),
      );
}
