import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: SwitchBasicDemo()));
}

class SwitchBasicDemo extends StatelessWidget {
  const SwitchBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Switch(controller: SwitchController()..checked = true),
    );
  }
}
