import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class MenuDocument extends StatelessWidget {
  const MenuDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(
        children: const [
          TypographyTitle('Menu 导航菜单', level: 2),
          WidgetDemo(
            child: Menu(
              children: [
                MenuItem(child: Text('Option 1'), name: 'option-1'),
                MenuItem(child: Text('Option 2'), name: 'option-2'),
                MenuItem(child: Text('Option 3'), name: 'option-3'),
                MenuItem(child: Text('Option 4'), name: 'option-4'),
                MenuItem(child: Text('Option 5'), name: 'option-5'),
                MenuItem(child: Text('Option 6'), name: 'option-6'),
              ],
              inlineCollapsed: true,
              mode: MenuMode.inline,
              selectedKeys: ['option-1'],
              theme: Theme.dark,
            ),
            name: '缩起内嵌菜单',
            description: '内嵌菜单可以被缩起/展开。\n你可以在Layout里查看侧边栏布局结合的完整案例。',
            snippet: 'menu.inline_collapsed',
          )
        ],
      ),
    );
  }
}
