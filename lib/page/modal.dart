import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ModalDocument extends StatelessWidget {
  const ModalDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Modal 对话框', level: 2),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('模态对话框。'),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
              '需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Modal 在当前页面正中打开一个浮层，承载相应的操作。'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text('另外当需要一个简洁的确认框询问用户时，可以使用 Modal.confirm() 等语法糖方法。'),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          description: '最简单的用法，适用于简短的警告提示。',
          name: '基本',
          snippet: 'modal.basic',
          child: Button(
            type: ButtonType.primary,
            onClick: () => _handleClick(context),
            child: const Text('Open Modal'),
          ),
        ),
      ]),
    );
  }

  void _handleClick(BuildContext context) {
    Modal(
      context,
      content: const Column(
        children: [
          Text('Some contents...'),
          Text('Some contents...'),
          Text('Some contents...'),
        ],
      ),
      title: const Text('Basic Modal'),
    );
  }
}
