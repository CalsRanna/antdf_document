import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class InputDocument extends StatelessWidget {
  const InputDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Input 输入框', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('通过鼠标或键盘输入内容，是最基础的表单域的包装。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('需要用户输入表单域内容时。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('提供组合型输入框，带搜索的输入框，还可以进行大小选择。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '基本使用。',
          name: '基本使用',
          snippet: 'input.basic',
          child: Input(placeholder: 'Basic usage'),
        ),
      ]),
    );
  }
}
