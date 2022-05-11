import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class NotificationDocument extends StatelessWidget {
  const NotificationDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Notification 通知提醒框', level: 2),
        const Padding(
          child: Text('全局展示通知提醒信息。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text('在系统四个角显示通知提醒信息。经常用于以下情况：'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('较为复杂的通知内容。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('带有交互的通知，给出用户下一步的行动点。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('系统主动推送。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Button(
            child: const Text('Open the notification box'),
            type: ButtonType.primary,
            onClick: () => _handleClick(context),
          ),
          description: '最简单的用法，4.5 秒后自动关闭。',
          name: '基本',
          snippet: 'notification.basic',
        ),
      ]),
    );
  }

  void _handleClick(BuildContext context) {
    AntNotification.open(
      context,
      description: const Text(
          'This is the content of the notification. This is the content of the notification. This is the content of the notification.'),
      message: const Text('Notification Title'),
    );
  }
}
