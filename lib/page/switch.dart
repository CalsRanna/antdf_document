import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class SwitchDocument extends StatelessWidget {
  const SwitchDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Switch开关', level: 2),
        const Padding(
          child: Text('开关选择器。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text('需要表示开关状态/两种状态之间的切换时；'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text(
              '和 checkbox 的区别是，切换 switch 会直接触发状态改变，而 checkbox 一般用于状态标记，需要和提交操作配合。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Switch(controller: SwitchController()..checked = true),
          description: '最简单的用法。',
          name: '基本',
          snippet: 'switch.basic',
        ),
      ]),
    );
  }
}