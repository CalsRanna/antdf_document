import 'package:ant_design_flutter/ant_design_flutter.dart';

class ClickableIcon extends StatefulWidget {
  const ClickableIcon({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final Widget icon;
  final String label;
  final void Function()? onTap;

  @override
  State<ClickableIcon> createState() => _ClickableIconState();
}

class _ClickableIconState extends State<ClickableIcon> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      child: MouseRegion(
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconTheme.merge(
              child: widget.icon,
              data: IconThemeData(color: hovered ? Colors.black : null),
            ),
          ),
          onTap: widget.onTap,
        ),
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => hovered = true),
        onExit: (_) => setState(() => hovered = false),
      ),
      label: widget.label,
    );
  }
}
