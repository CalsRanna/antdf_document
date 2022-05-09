import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: TabsBasicDemo()));
}

class TabsBasicDemo extends StatelessWidget {
  const TabsBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AntScaffold(
      body: Tabs(children: [
        TabPane(
          name: '1',
          tab: Text('Tab 1'),
          child: Text('Content of Tab Pane 1'),
        ),
        TabPane(
          name: '2',
          tab: Text('Tab 2'),
          child: Text('Content of Tab Pane 2'),
        ),
        TabPane(
          name: '3',
          tab: Text('Tab 3'),
          child: Text('Content of Tab Pane 3'),
        ),
      ]),
    );
  }
}
