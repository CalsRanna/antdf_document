import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class RadioDocument extends StatelessWidget {
  const RadioDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Radio单选框', level: 2),
        Padding(
          child: Text('单选框。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('用于在多个备选项中选中单个状态。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('和 Select 的区别是，Radio 所有选项默认可见，方便用户在比较中选择，因此选项不宜过多。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Radio(child: Text('Radio')),
          description: '最简单的用法。',
          name: '基本',
          snippet: 'radio.basic',
        ),
      ]),
    );
  }
}
