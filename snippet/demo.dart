import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: MessageBasicDemo()));
}

class MessageBasicDemo extends StatelessWidget {
  const MessageBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Button(
        child: const Text('Display normal message'),
        onClick: () => _handleClick(context),
        type: ButtonType.primary,
      ),
    );
  }

  void _handleClick(BuildContext context) {
    Message.info(context, content: const Text('This is a normal message'));
  }
}
