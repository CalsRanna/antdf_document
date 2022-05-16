import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class TagDocument extends StatelessWidget {
  const TagDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Tag 标签', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('进行标记和分类的小标签。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('用于标记事物的属性和维度。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('进行分类。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '基本标签的用法，可以通过添加 closable 变为可关闭标签。可关闭标签具有 onClose 事件。',
          name: '基本用法',
          snippet: 'tag.basic',
          child: Space(children: [
            Tag(child: Text('Tag 1')),
            Tag(child: Text('Link')),
            Tag(child: Text('Prevent Default')),
          ]),
        ),
      ]),
    );
  }
}
