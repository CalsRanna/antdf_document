import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class DividerDocument extends StatelessWidget {
  const DividerDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Divider 分割线', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('区隔内容的分割线。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '默认为水平分割线，可在中间加入文字。',
          name: '水平分割线',
          snippet: 'divider.horizontal',
          child: Column(
            children: const [
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Divider(dashed: true),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
            ],
          ),
        ),
      ]),
    );
  }
}
