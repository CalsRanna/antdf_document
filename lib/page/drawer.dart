import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class DrawerDocument extends StatelessWidget {
  const DrawerDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Drawer 抽屉', level: 2),
        const Padding(
          child: Text('屏幕边缘滑出的浮层面板。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child:
              Text('抽屉从父窗体边缘滑入，覆盖住部分父窗体内容。用户在抽屉内操作时不必离开当前任务，操作完成后，可以平滑地回到原任务。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('当需要一个附加的面板来控制父窗体内容，这个面板在需要时呼出。比如，控制界面展示样式，往界面中添加内容。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('当需要在当前任务流中插入临时任务，创建或预览附加内容。比如展示协议条款，创建子对象。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Button(
            child: const Text('Open'),
            onClick: () => _handleClick(context),
            type: ButtonType.primary,
          ),
          description: '基础抽屉，点击触发按钮抽屉从右滑出，点击遮罩区关闭。',
          name: '基础抽屉',
          snippet: 'drawer.basic',
        ),
      ]),
    );
  }

  void _handleClick(BuildContext context) {
    Drawer(
      context,
      child: Column(
        children: const [
          Text('Some contents'),
          Text('Some contents'),
          Text('Some contents'),
        ],
      ),
      placement: Placement.right,
      title: const Text('Basic Drawer'),
    );
  }
}
