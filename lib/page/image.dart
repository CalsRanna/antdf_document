import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ImageDocument extends StatelessWidget {
  const ImageDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Image 图片', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('可预览的图片。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('需要展示图片时使用。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('加载大图时显示 loading 或加载失败时容错处理。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '单击图像可以放大显示。',
          name: '基本用法',
          snippet: 'image.basic',
          child: Image(
            src:
                'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
            width: 200,
          ),
        ),
      ]),
    );
  }
}
