import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: InputNumberBasicDemo()));
}

class InputNumberBasicDemo extends StatelessWidget {
  const InputNumberBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: InputNumber(controller: InputNumberController.fromValue(3)),
    );
  }
}
