import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/util/snippet.dart';
import 'package:antdf_document/widget/clickable_icon.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({
    Key? key,
    required this.child,
    required this.name,
    required this.description,
    required this.snippet,
  }) : super(key: key);

  final Widget child;
  final String name;
  final String description;
  final String snippet;

  @override
  State<WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  bool active = false;
  String _snippet = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.child,
          ),
          Divider(
            child: Text(widget.name),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.description),
          ),
          Container(
            child: Row(
              children: [
                const ClickableIcon(
                  label: '在DarPad中打开',
                  icon: Icon(Icons.dart_pad),
                ),
                const ClickableIcon(label: '复制代码', icon: Icon(Icons.copy)),
                ClickableIcon(
                  label: active ? '收起代码' : '显示代码',
                  icon: const Icon(Icons.code),
                  onTap: _handleShowSnippet,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.gray_4),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          active
              ? Container(
                  child: HighlightView(
                    _snippet,
                    language: 'dart',
                    padding: const EdgeInsets.all(24),
                    textStyle: GoogleFonts.sourceCodePro(),
                    theme: atomOneLightTheme,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.gray_4),
                    ),
                  ),
                  width: double.infinity,
                )
              : const SizedBox(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: active ? Colors.blue_6 : Colors.gray_4),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  void _handleShowSnippet() async {
    if (_snippet == '') {
      try {
        var code = await Snippet.get(widget.snippet);
        setState(() {
          _snippet = code;
        });
      } catch (error) {
        setState(() {
          _snippet = error.toString();
        });
      }
    }
    setState(() {
      active = !active;
    });
  }
}
