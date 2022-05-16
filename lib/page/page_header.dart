import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class PageHeaderDocument extends StatelessWidget {
  const PageHeaderDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('PageHeader 页头', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
              '页头位于页容器中，页容器顶部，起到了内容概览和引导页级操作的作用。包括由面包屑、标题、页面内容简介、页面级操作等、页面级导航组成。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('当需要使用户快速理解当前页是什么以及方便用户使用页面功能时使用，通常也可被用作页面间导航。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '标准页头，适合使用在需要简单描述的场景。',
          name: '标准样式',
          snippet: 'page_header.standard',
          child: Card(
            child: PageHeader(
              subtitle: Text('This is a subtitle'),
              title: Text('Title'),
            ),
          ),
        ),
      ]),
    );
  }
}
