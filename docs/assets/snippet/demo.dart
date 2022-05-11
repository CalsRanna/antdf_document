import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: NotificationBasicDemo()));
}

class NotificationBasicDemo extends StatelessWidget {
  const NotificationBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Button(
        child: const Text('Open the notification box'),
        onClick: () => _handleClick(context),
        type: ButtonType.primary,
      ),
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
