import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: InputBasicDemo()));
}

class InputBasicDemo extends StatelessWidget {
  const InputBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AntScaffold(
      body: Input(placeholder: 'Basic usage'),
    );
  }
}