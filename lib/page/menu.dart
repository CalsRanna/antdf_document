import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
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
            name: '缩起内嵌菜单',
            description: '内嵌菜单可以被缩起/展开。\n你可以在Layout里查看侧边栏布局结合的完整案例。',
            snippet: 'menu.inline_collapsed',
            child: Menu(
              inlineCollapsed: true,
              mode: MenuMode.inline,
              selectedKeys: ['option-1'],
              theme: Theme.dark,
              children: [
                MenuItem(name: 'option-1', child: Text('Option 1')),
                MenuItem(name: 'option-2', child: Text('Option 2')),
                MenuItem(name: 'option-3', child: Text('Option 3')),
                MenuItem(name: 'option-4', child: Text('Option 4')),
                MenuItem(name: 'option-5', child: Text('Option 5')),
                MenuItem(name: 'option-6', child: Text('Option 6')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
