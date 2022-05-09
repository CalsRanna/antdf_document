import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: AlertBasicDemo()));
}

class AlertBasicDemo extends StatelessWidget {
  const AlertBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AntScaffold(
      body: Alert(message: Text('Success Text'), type: Status.success),
    );
  }
}
