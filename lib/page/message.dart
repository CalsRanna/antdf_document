import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class MessageDocument extends StatelessWidget {
  const MessageDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Message 全局提示', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('全局展示操作反馈信息。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('可提供成功、警告和错误等反馈信息。'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('顶部居中显示并自动消失，是一种不打断用户操作的轻量级提示方式。'),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '信息提醒反馈。',
          name: '普通提示',
          snippet: 'message.basic',
          child: Button(
            onClick: () => _handleClick(context),
            type: ButtonType.primary,
            child: const Text('Display normal message'),
          ),
        ),
      ]),
    );
  }

  void _handleClick(BuildContext context) {
    Message.info(context, content: const Text('This is a normal message'));
  }
}
