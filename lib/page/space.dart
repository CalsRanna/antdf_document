import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class SpaceDocument extends StatelessWidget {
  const SpaceDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Space 间距', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('设置组件之间的间距。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('避免组件紧贴在一起，拉开统一的空间。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('适合行内元素的水平间距。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('可以设置各种水平对齐方式。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '相邻组件水平间距。',
          name: '基本用法',
          snippet: 'space.basic',
          child: Space(children: [
            Text('Space'),
            Button(type: ButtonType.primary, child: Text('Button')),
            Button(child: Text('Click to Upload')),
            Button(child: Text('Confirm')),
          ]),
        ),
      ]),
    );
  }
}
