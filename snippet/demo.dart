import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: ModalBasicDemo()));
}

class ModalBasicDemo extends StatelessWidget {
  const ModalBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Button(
        child: const Text('Open Modal'),
        onClick: () => _handleClick(context),
        type: ButtonType.primary,
      ),
    );
  }

  void _handleClick(BuildContext context) {
    Modal(
      context,
      content: Column(
        children: const [
          Text('Some contents...'),
          Text('Some contents...'),
          Text('Some contents...'),
        ],
      ),
      title: const Text('Basic Modal'),
    );
  }
}
