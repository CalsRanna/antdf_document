import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: TableBasicDemo()));
}

class TableBasicDemo extends StatelessWidget {
  const TableBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var columns = [
      const AntTableColumn(title: 'Name', dataIndex: 'name'),
      const AntTableColumn(title: 'Age', dataIndex: 'age'),
      const AntTableColumn(title: 'Address', dataIndex: 'address'),
      AntTableColumn(
        title: 'Tags',
        dataIndex: 'tags',
        render: (record) => Row(
          children: const [SizedBox()],
        ),
      ),
      AntTableColumn(
        title: 'Action',
        render: (record) => Row(
          children: const [
            SizedBox(),
            Button(
              child: Text('Delete'),
              type: ButtonType.link,
            )
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

    return AntScaffold(
      body: AntTable<_TableData>(columns: columns, dataSource: data),
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
