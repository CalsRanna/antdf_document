import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class InputNumberDocument extends StatelessWidget {
  const InputNumberDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('InputNumber 数字输入框', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('通过鼠标或键盘，输入范围内的数值。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('当需要获取标准数值时。'),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '数字输入框。',
          name: '基本',
          snippet: 'input_number.basic',
          child: InputNumber(controller: InputNumberController.fromValue(3)),
        ),
      ]),
    );
  }
}
