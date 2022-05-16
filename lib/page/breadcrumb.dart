import 'package:ant_design_flutter/ant_design_flutter.dart';
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
          description: '最简单的用法。',
          name: '基本',
          snippet: 'breadcrumb.basic',
          child: Breadcrumb(children: [
            BreadcrumbItem(
              href: '#1',
              child: Text('首页'),
            ),
            BreadcrumbItem(
              href: '#2',
              child: Text('列表页'),
            ),
            BreadcrumbItem(
              href: '#3',
              child: Text('详情页'),
            ),
          ]),
        ),
      ]),
    );
  }
}
