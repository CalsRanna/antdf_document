import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:google_fonts/google_fonts.dart';

class TableDocument extends StatelessWidget {
  const TableDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var columns = [
      const TableColumn(title: 'Name', dataIndex: 'name', width: 128),
      const TableColumn(title: 'Age', dataIndex: 'age', width: 64),
      const TableColumn(title: 'Address', dataIndex: 'address'),
      TableColumn(
        title: 'Tags',
        dataIndex: 'tags',
        render: (record) {
          var tags = record.tags as List<String>;

          return Space(
            children: tags
                .map((tag) => Tag(
                      color: tag == 'loser'
                          ? Colors.volcano_1
                          : tag.length > 5
                              ? Colors.geekblue_1
                              : Colors.green_1,
                      child: Text(tag.toUpperCase()),
                    ))
                .toList(),
          );
        },
      ),
      TableColumn(
        title: 'Action',
        render: (record) => Space(
          children: [
            Button(
              size: Size.small,
              type: ButtonType.text,
              child: Text('Invite ${record.name}'),
            ),
            const Button(
              size: Size.small,
              type: ButtonType.text,
              child: Text('Delete'),
            ),
          ],
        ),
      )
    ];

    var data = const <_TableData>[
      _TableData(
        key: '1',
        name: 'John Brown',
        age: 32,
        address: 'New York No. 1 Lake Park',
        tags: ['nice', 'developer'],
      ),
      _TableData(
        key: '2',
        name: 'Jim Green',
        age: 42,
        address: 'London No. 1 Lake Park',
        tags: ['loser'],
      ),
    ];

    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Table 表格', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('展示行列数据。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('当有大量结构化的数据需要展现时；'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('当需要对数据进行排序、搜索、分页、自定义操作等复杂行为时。'),
        ),
        const TypographyTitle('如何使用', level: 3),
        HighlightView(
          '',
          language: 'dart',
          padding: const EdgeInsets.all(24),
          textStyle: GoogleFonts.sourceCodePro(),
          theme: atomOneLightTheme,
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '简单的表格，最后一列是各种操作。',
          name: '基本用法',
          snippet: 'table.basic',
          child: Table<_TableData>(columns: columns, dataSource: data),
        ),
      ]),
    );
  }
}

class _TableData {
  const _TableData({
    required this.key,
    required this.name,
    required this.age,
    required this.address,
    required this.tags,
  });

  final String key;
  final String name;
  final int age;
  final String address;
  final List<String> tags;

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'age': age,
      'address': address,
      'tags': tags,
    };
  }
}
