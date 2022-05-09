import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ImageDocument extends StatelessWidget {
  const ImageDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Image 图片', level: 2),
        const Padding(
          child: Text('可预览的图片。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text('需要展示图片时使用。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('加载大图时显示 loading 或加载失败时容错处理。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        const WidgetDemo(
          child: AntImage(
            src:
                'https://zos.alipayobjects.com/rmsportal/jkjgkEfvpUPVyRjUImniVslZfWPnJuuZ.png',
            width: 200,
          ),
          description: '单击图像可以放大显示。',
          name: '基本用法',
          snippet: 'image.basic',
        ),
      ]),
    );
  }
}
