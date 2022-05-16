import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class AlertDocument extends StatelessWidget {
  const AlertDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Alert 警告提示', level: 2),
        Padding(
          child: Text('警告提示，展现需要关注的信息。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('当某个页面需要向用户显示警告的信息时。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('非浮层的静态展现形式，始终展现，不会自动消失，用户可以点击关闭。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Alert(message: Text('Success Text'), type: Status.success),
          description: '最简单的用法，适用于简短的警告提示。',
          name: '基本',
          snippet: 'alert.basic',
        ),
      ]),
    );
  }
}
