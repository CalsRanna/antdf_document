import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: SliderBasicDemo()));
}

class SliderBasicDemo extends StatelessWidget {
  const SliderBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Column(
        children: [
          Slider(
            controller: SliderController()..value = 30,
          ),
          const SizedBox(height: 8),
          Slider(
            controller: SliderController()..value = 50,
          )
        ],
      ),
    );
  }
}
