import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: IconBasicDemo()));
}

class IconBasicDemo extends StatelessWidget {
  const IconBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Space(children: [
        Icon(Icons.success),
        Icon(Icons.info),
        Icon(Icons.loading, spin: true),
        Icon(Icons.check, rotate: 180),
      ]),
    );
  }
}
