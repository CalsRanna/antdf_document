import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class SliderDocument extends StatelessWidget {
  const SliderDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Slider滑动输入条', level: 2),
        const Padding(
          child: Text('滑动型输入器，展示当前值和可选范围。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text('当用户需要在数值区间/自定义区间内进行选择时，可为连续或离散值。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Column(
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
          description:
              '基本滑动条。当 range 为 true 时，渲染为双滑块。当 disabled 为 true 时，滑块处于不可用状态。',
          name: '基本',
          snippet: 'slider.basic',
        ),
      ]),
    );
  }
}
