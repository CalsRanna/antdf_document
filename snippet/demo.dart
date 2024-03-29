import 'package:ant_design_flutter/ant_design_flutter.dart';

void main() {
  runApp(const AntApp(home: ButtonSizeDemo()));
}

class ButtonSizeDemo extends StatefulWidget {
  const ButtonSizeDemo({Key? key}) : super(key: key);

  @override
  State<ButtonSizeDemo> createState() => _ButtonSizeDemoState();
}

class _ButtonSizeDemoState extends State<ButtonSizeDemo> {
  Size size = Size.middle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Button(
                onClick: () => setState(() => size = Size.large),
                child: const Text('Large'),
              ),
              Button(
                onClick: () => setState(() => size = Size.middle),
                child: const Text('Medium'),
              ),
              Button(
                onClick: () => setState(() => size = Size.small),
                child: const Text('Small'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Space(children: [
            Button(
              size: size,
              type: ButtonType.primary,
              child: const Text('Primary'),
            ),
            Button(
              size: size,
              child: const Text('Default'),
            ),
            Button(
              size: size,
              type: ButtonType.dashed,
              child: const Text('Dashed'),
            ),
            Button(
              size: size,
              type: ButtonType.link,
              child: const Text('Link'),
            ),
          ]),
          const SizedBox(height: 24),
          Space(children: [
            Button(
              icon: const Icon(Icons.download),
              size: size,
              type: ButtonType.primary,
            ),
            Button(
              icon: const Icon(Icons.download),
              shape: ButtonShape.circle,
              size: size,
              type: ButtonType.primary,
            ),
            Button(
              icon: const Icon(Icons.download),
              shape: ButtonShape.round,
              size: size,
              type: ButtonType.primary,
            ),
            Button(
              icon: const Icon(Icons.download),
              shape: ButtonShape.round,
              size: size,
              type: ButtonType.primary,
              child: const Text('Download'),
            ),
            Button(
              icon: const Icon(Icons.download),
              size: size,
              type: ButtonType.primary,
              child: const Text('Download'),
            ),
          ]),
        ],
      ),
    );
  }
}
