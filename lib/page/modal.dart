import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ModalDocument extends StatelessWidget {
  const ModalDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Modal 对话框', level: 2),
        const Padding(
          child: Text('模态对话框。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text(
              '需要用户处理事务，又不希望跳转页面以致打断工作流程时，可以使用 Modal 在当前页面正中打开一个浮层，承载相应的操作。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('另外当需要一个简洁的确认框询问用户时，可以使用 Modal.confirm() 等语法糖方法。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Button(
            child: const Text('Open Modal'),
            type: ButtonType.primary,
            onClick: () => _handleClick(context),
          ),
          description: '最简单的用法，适用于简短的警告提示。',
          name: '基本',
          snippet: 'modal.basic',
        ),
      ]),
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
