import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class DividerDocument extends StatelessWidget {
  const DividerDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Divider 分割线', level: 2),
        const Padding(
          child: Text('区隔内容的分割线。'),
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
        ),
        const TypographyTitle('何时使用', level: 3),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Column(
            children: const [
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
              Padding(
                child: Divider(),
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
              Padding(
                child: Divider(dashed: true),
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Sed nonne merninisti licere mihi ista probare, '
                  'quae sunt a te dicta? Refert tamen, quo modo.'),
            ],
          ),
          description: '默认为水平分割线，可在中间加入文字。',
          name: '水平分割线',
          snippet: 'divider.horizontal',
        ),
      ]),
    );
  }
}
