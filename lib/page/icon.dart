import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class IconDocument extends StatelessWidget {
  const IconDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const datas = [
      Icons.arrow_left,
      Icons.arrow_right,
      Icons.check,
      Icons.chevron_down,
      Icons.chevron_left,
      Icons.chevron_right,
      Icons.chevron_up,
      Icons.clear,
      Icons.close,
      Icons.code,
      Icons.copy,
      Icons.dart_pad,
      Icons.debug,
      Icons.error,
      Icons.info,
      Icons.loading,
      Icons.search,
      Icons.success,
      Icons.warning,
    ];
    const names = [
      'arrow_left',
      'arrow_right',
      'check',
      'chevron_down',
      'chevron_left',
      'chevron_right',
      'chevron_up',
      'clear',
      'close',
      'code',
      'copy',
      'dart_pad',
      'debug',
      'error',
      'info',
      'loading',
      'search',
      'success',
      'warning',
    ];

    var icons = <Widget>[];
    for (int i = 0; i < datas.length; i++) {
      icons.add(_IconCard(icon: datas[i], name: names[i]));
    }

    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Icon 图标', level: 2),
        const Padding(
          child: Text('语义化的矢量图形。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('图标列表', level: 3),
        GridView.count(
          childAspectRatio: 16 / 9,
          children: icons,
          crossAxisCount: 6,
          mainAxisSpacing: 4,
          shrinkWrap: true,
        ),
        const TypographyTitle('代码演示', level: 3),
        const WidgetDemo(
          child: Space(children: [
            Icon(Icons.success),
            Icon(Icons.info),
            Icon(Icons.loading, spin: true),
            Icon(Icons.debug, rotate: 180),
          ]),
          description: '最简单的用法，也可以通过设置spin属性来实现动画旋转效果。',
          name: '基本',
          snippet: 'icon.basic',
        ),
      ]),
    );
  }
}

class _IconCard extends StatefulWidget {
  const _IconCard({Key? key, required this.icon, required this.name})
      : super(key: key);

  final IconData icon;
  final String name;

  @override
  State<_IconCard> createState() => __IconCardState();
}

class __IconCardState extends State<_IconCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Container(
        child: Column(
          children: [
            Icon(
              widget.icon,
              color: hovered ? Colors.white : null,
              size: hovered ? 44 : 36,
            ),
            SizedBox(height: hovered ? 8 : 16),
            Text(
              widget.name,
              style: TextStyle(color: hovered ? Colors.white : null),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: hovered ? Colors.blue_6 : Colors.transparent,
        ),
      ),
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
    );
  }
}
