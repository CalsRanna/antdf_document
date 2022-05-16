import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class CardDocument extends StatelessWidget {
  const CardDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Card 卡片', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('通用卡片容器。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('最基础的卡片容器，可承载文字、列表、图片、段落，常用于后台概览页面。'),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '包含标题、内容、操作区域。',
          name: '典型卡片',
          snippet: 'card.classic',
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Card(
                    extra: const Text('More'),
                    title: const Text('Default size card'),
                    child: Column(
                      children: const [
                        Text('Card content'),
                        Text('Card content'),
                        Text('Card content'),
                      ],
                    ),
                  ),
                ),
                Card(
                  extra: const Text('More'),
                  title: const Text('Small size card'),
                  size: Size.small,
                  child: Column(
                    children: const [
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
