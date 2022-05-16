import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class RadioDocument extends StatelessWidget {
  const RadioDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Radio单选框', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('单选框。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('用于在多个备选项中选中单个状态。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('和 Select 的区别是，Radio 所有选项默认可见，方便用户在比较中选择，因此选项不宜过多。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '最简单的用法。',
          name: '基本',
          snippet: 'radio.basic',
          child: Radio(child: Text('Radio')),
        ),
      ]),
    );
  }
}
