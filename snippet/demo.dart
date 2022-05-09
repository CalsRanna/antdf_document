import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: ImageBasicDemo()));
}

class ImageBasicDemo extends StatelessWidget {
  const ImageBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AntScaffold(
      body: AntImage(
        src:
            'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
        width: 200,
      ),
    );
  }
}
