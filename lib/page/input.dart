import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class InputDocument extends StatelessWidget {
  const InputDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Input 输入框', level: 2),
        Padding(
          child: Text('通过鼠标或键盘输入内容，是最基础的表单域的包装。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('需要用户输入表单域内容时。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('提供组合型输入框，带搜索的输入框，还可以进行大小选择。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Input(placeholder: 'Basic usage'),
          description: '基本使用。',
          name: '基本使用',
          snippet: 'input.basic',
        ),
      ]),
    );
  }
}
