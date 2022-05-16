import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class TooltipDocument extends StatelessWidget {
  const TooltipDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Tooltip 文字提示', level: 2),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('简单的文字提示气泡框。'),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('鼠标移入则显示提示，移出消失，气泡浮层不承载复杂文本和操作。'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text('可用来代替系统默认的 title 提示，提供一个 按钮/文字/操作 的文案解释。'),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '最简单的用法。',
          name: '基本',
          snippet: 'tooltip.basic',
          child: Tooltip(
            label: 'prompt text',
            child: Text('Tooltip will show on mouse enter.'),
          ),
        ),
      ]),
    );
  }
}
