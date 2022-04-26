import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class BreadcrumbDocument extends StatelessWidget {
  const BreadcrumbDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Breadcrumb 面包屑', level: 2),
        WidgetDemo(
          child: Breadcrumb(children: [
            BreadcrumbItem(
              child: Text('首页'),
              href: '#1',
            ),
            BreadcrumbItem(
              child: Text('列表页'),
              href: '#2',
            ),
            BreadcrumbItem(
              child: Text('详情页'),
              href: '#3',
            ),
          ]),
          description: '最简单的用法。',
          name: '基本',
          snippet: 'breadcrumb.basic',
        ),
      ]),
    );
  }
}
