import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class CardDocument extends StatelessWidget {
  const CardDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Card 卡片', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('通用卡片容器。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('最基础的卡片容器，可承载文字、列表、图片、段落，常用于后台概览页面。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '包含标题、内容、操作区域。',
          name: '典型卡片',
          snippet: 'card.classic',
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Card(
                    extra: Text('More'),
                    title: Text('Default size card'),
                    child: Column(
                      children: [
                        Text('Card content'),
                        Text('Card content'),
                        Text('Card content'),
                      ],
                    ),
                  ),
                ),
                Card(
                  extra: Text('More'),
                  title: Text('Small size card'),
                  size: Size.small,
                  child: Column(
                    children: [
                      Text('Card content'),
                      Text('Card content'),
                      Text('Card content'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
