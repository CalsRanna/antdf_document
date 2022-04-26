import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class PaginationDocument extends StatelessWidget {
  const PaginationDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Pagination 分页', level: 2),
        Padding(
          child: Text('采用分页的形式分隔长列表，每次只加载一个页面。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('当加载/渲染所有数据将花费很多时间时；'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('可切换页码浏览数据。。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Pagination(total: 50),
          description: '基础分页。',
          name: '基本',
          snippet: 'pagination.basic',
        ),
      ]),
    );
  }
}