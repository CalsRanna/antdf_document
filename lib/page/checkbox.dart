import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class CheckboxDocument extends StatelessWidget {
  const CheckboxDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CheckboxController();
    controller.checked = false;
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Checkbox 多选框', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('多选框。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('在一组可选项中进行多项选择时；'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('单独使用可以表示两种状态之间的切换，和 switch 类似。区别在于切换 switch 会'
              '直接触发状态改变，而 checkbox 一般用于状态标记，需要和提交操作配合。'),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '简单的 checkbox。',
          name: '基本用法',
          snippet: 'checkbox.basic',
          child: Checkbox(
            controller: controller,
            child: const Text('Checkbox'),
          ),
        ),
      ]),
    );
  }
}
