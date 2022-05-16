import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class TabsDocument extends StatelessWidget {
  const TabsDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Tabs 标签页', level: 2),
        Padding(
          child: Text('选项卡切换组件。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('提供平级的区域将大块内容进行收纳和展现，保持界面整洁。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('Ant Design 依次提供了三级选项卡，分别用于不同的场景。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('卡片式的页签，提供可关闭的样式，常用于容器顶部。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('既可用于容器顶部，也可用于容器内部，是最通用的 Tabs。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('Radio.Button 可作为更次级的页签来使用。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Tabs(children: [
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
          description: '默认选中第一项。',
          name: '基本',
          snippet: 'tabs.basic',
        ),
      ]),
    );
  }
}
