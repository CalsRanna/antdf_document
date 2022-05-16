import 'dart:async';

import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/html_ul.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ButtonDocument extends StatelessWidget {
  const ButtonDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const types = <String>[
      '主按钮：用于主行动点，一个操作区域只能有一个主按钮。',
      '默认按钮：用于没有主次之分的一组行动点。',
      '虚线按钮：常用于添加操作。',
      '文本按钮：用于最次级的行动点。',
      '链接按钮：一般用于链接，即导航至某位置。'
    ];

    const padding = SizedBox(height: 14);

    const status = <String>[
      '危险：删除/移动/修改权限等危险操作，一般需要二次确认。',
      '幽灵：用于背景色比较复杂的地方，常用在首页/产品页等展示场景。',
      '禁用：行动点不可用的时候，一般需要文案解释。',
      '加载中：用于异步操作等待反馈的时候，也可以避免多次提交。',
    ];

    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Button 按钮', level: 2),
        padding,
        const Text('按钮用于开始一个即时操作。'),
        padding,
        const TypographyTitle('何时使用', level: 3),
        padding,
        const Text('标记了一个（或封装一组）操作命令，响应用户点击行为，触发相应的业务逻辑。'),
        padding,
        const Text('在 Ant Design 中我们提供了五种按钮。'),
        padding,
        const HtmlUl(li: types),
        padding,
        const Text('以及四种状态属性与上面配合使用。'),
        padding,
        const HtmlUl(li: status),
        padding,
        const TypographyTitle('代码演示', level: 3),
        Row(
          children: [
            Expanded(
              child: Column(
                children: const [
                  ButtonTypeDemo(),
                  SizedBox(height: 16),
                  ButtonSizeDemo(),
                  SizedBox(height: 16),
                  ButtonLoadingDemo(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(child: Container()),
          ],
        )
      ]),
    );
  }
}

class ButtonTypeDemo extends StatelessWidget {
  const ButtonTypeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WidgetDemo(
      description: '按钮有五种类型：主按钮、次按钮、虚线按钮、文本按钮和链接按钮。主按钮在同一个操作区域最多出现一次。',
      name: '按钮类型',
      snippet: 'button.type',
      child: Space(
        direction: Axis.vertical,
        children: [
          Space(children: [
            Button(type: ButtonType.primary, child: Text('Primary Button')),
            Button(child: Text('Default Button')),
            Button(
              type: ButtonType.dashed,
              child: Text('Dashed Button'),
            ),
          ]),
          Space(children: [
            Button(type: ButtonType.text, child: Text('Text Button')),
            Button(type: ButtonType.link, child: Text('Link Button')),
          ]),
        ],
      ),
    );
  }
}

class ButtonSizeDemo extends StatefulWidget {
  const ButtonSizeDemo({Key? key}) : super(key: key);

  @override
  State<ButtonSizeDemo> createState() => _ButtonSizeDemoState();
}

class _ButtonSizeDemoState extends State<ButtonSizeDemo> {
  Size size = Size.medium;

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      name: '按钮尺寸',
      description:
          '按钮有大、中、小三种尺寸。\n通过设置 size 为 large small 分别把按钮设为大、小尺寸。若不设置 size，则尺寸为中。',
      snippet: 'button.size',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Button(
                onClick: () => setState(() => size = Size.large),
                child: const Text('Large'),
              ),
              Button(
                onClick: () => setState(() => size = Size.medium),
                child: const Text('Medium'),
              ),
              Button(
                onClick: () => setState(() => size = Size.small),
                child: const Text('Small'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
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
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
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
        ],
      ),
    );
  }
}

class ButtonLoadingDemo extends StatefulWidget {
  const ButtonLoadingDemo({Key? key}) : super(key: key);

  @override
  State<ButtonLoadingDemo> createState() => _ButtonLoadingDemoState();
}

class _ButtonLoadingDemoState extends State<ButtonLoadingDemo> {
  List<bool> loading = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      name: '加载中状态',
      description: '添加 loading 属性即可让按钮处于加载状态，最后两个按钮演示点击后进入加载状态。',
      snippet: 'buttoin.loading',
      child: Column(
        children: [
          Row(
            children: const [
              Button(
                loading: true,
                type: ButtonType.primary,
                child: Text('Loading'),
              ),
              SizedBox(width: 16),
              Button(
                loading: true,
                size: Size.small,
                type: ButtonType.primary,
                child: Text('Loading'),
              ),
              SizedBox(width: 16),
              Button(
                icon: Icon(Icons.loading),
                loading: true,
                type: ButtonType.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Button(
                loading: loading[0],
                type: ButtonType.primary,
                onClick: () => _handleClick(0),
                child: const Text('Click me!'),
              ),
              const SizedBox(width: 16),
              Button(
                loading: loading[1],
                size: Size.small,
                type: ButtonType.primary,
                onClick: () => _handleClick(1),
                child: const Text('Click me!'),
              ),
              const SizedBox(width: 16),
              Button(
                icon: const Icon(Icons.power_off),
                loading: loading[2],
                type: ButtonType.primary,
                onClick: () => _handleClick(2),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _handleClick(int i) {
    setState(() {
      loading[i] = true;
    });
    Timer(const Duration(seconds: 6), () {
      setState(() {
        loading[i] = false;
      });
    });
  }
}
