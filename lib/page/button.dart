import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class ButtonDocument extends StatelessWidget {
  const ButtonDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: const [
        TypographyTitle('Button 按钮', level: 2),
        Padding(
          child: Text('按钮用于开始一个即时操作。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('何时使用', level: 3),
        Padding(
          child: Text('标记了一个（或封装一组）操作命令，响应用户点击行为，触发相应的业务逻辑。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('在 Ant Design 中我们提供了五种按钮。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('主按钮：用于主行动点，一个操作区域只能有一个主按钮。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('默认按钮：用于没有主次之分的一组行动点。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('虚线按钮：常用于添加操作。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('文本按钮：用于最次级的行动点。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('链接按钮：一般用于链接，即导航至某位置。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('以及四种状态属性与上面配合使用。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('危险：删除/移动/修改权限等危险操作，一般需要二次确认。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('幽灵：用于背景色比较复杂的地方，常用在首页/产品页等展示场景。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('禁用：行动点不可用的时候，一般需要文案解释。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('加载中：用于异步操作等待反馈的时候，也可以避免多次提交。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        Padding(
          child: Text('完整设计指南'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Space(
            direction: Axis.vertical,
            children: [
              Space(children: [
                Button(child: Text('Primary Button'), type: ButtonType.primary),
                Button(child: Text('Default Button')),
                Button(
                  child: Text('Dashed Button'),
                  type: ButtonType.dashed,
                ),
              ]),
              Space(children: [
                Button(child: Text('Text Button'), type: ButtonType.text),
                Button(child: Text('Link Button'), type: ButtonType.link),
              ]),
            ],
          ),
          description: '按钮有五种类型：主按钮、次按钮、虚线按钮、文本按钮和链接按钮。主按钮在同一个操作区域最多出现一次。',
          name: '按钮类型',
          snippet: 'button.type',
        ),
      ]),
    );
  }
}
