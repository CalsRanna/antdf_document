import 'package:ant_design_flutter/antdf.dart';
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
          child: Text('设置组件之间的间距。'),
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('避免组件紧贴在一起，拉开统一的空间。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('适合行内元素的水平间距。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('可以设置各种水平对齐方式。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Space(children: [
            Text('Space'),
            Button(child: Text('Button'), type: ButtonType.primary),
            Button(child: Text('Click to Upload')),
            Button(child: Text('Confirm')),
          ]),
          description: '相邻组件水平间距。',
          name: '基本用法',
          snippet: 'space.basic',
        ),
      ]),
    );
  }
}
