import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class TypographyDocument extends StatelessWidget {
  const TypographyDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(
        children: [
          const TypographyTitle('Typography 排版', level: 2),
          const TypographyParagraph('文本的基本格式。'),
          const TypographyTitle('何时使用', level: 3),
          const TypographyTitle('代码演示', level: 3),
          WidgetDemo(
              child: Column(
                children: const [
                  TypographyTitle('h1.Ant Design'),
                  TypographyTitle('h2.Ant Design', level: 2),
                  TypographyTitle('h3.Ant Design', level: 3),
                  TypographyTitle('h4.Ant Design', level: 4),
                  TypographyTitle('h5.Ant Design', level: 5),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              name: '标题组件',
              description: '展示不同级别的标题。',
              snippet: 'typography.title'),
        ],
      ),
    );
  }
}
