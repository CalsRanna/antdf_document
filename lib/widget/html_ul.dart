import 'package:ant_design_flutter/ant_design_flutter.dart';

class HtmlUl extends StatelessWidget {
  const HtmlUl({Key? key, required this.li}) : super(key: key);

  final List<String> li;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: ScrollController(),
      itemBuilder: (context, index) => Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle),
            height: 6,
            width: 6,
          ),
          const SizedBox(width: 16),
          Text(li[index])
        ],
      ),
      itemCount: li.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      shrinkWrap: true,
    );
  }
}
