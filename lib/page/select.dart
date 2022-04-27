import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:antdf_document/widget/widget_demo.dart';

class SelectDocument extends StatelessWidget {
  const SelectDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(children: [
        const TypographyTitle('Select 选择器', level: 2),
        const Padding(
          child: Text('下拉选择器。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('何时使用', level: 3),
        const Padding(
          child: Text('弹出一个下拉菜单给用户选择操作，用于代替原生的选择器，或者需要一个更优雅的多选器时。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const Padding(
          child: Text('当选项少时（少于 5 项），建议直接将选项平铺，使用 Radio 是更好的选择。'),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        const TypographyTitle('代码演示', level: 3),
        WidgetDemo(
          child: Row(
            children: [
              Expanded(
                child: Select(
                    controller: SelectController()..selected = ['lucy'],
                    children: const [
                      Option<String>(value: 'jack'),
                      Option<String>(value: 'lucy'),
                      Option<String>(disabled: true, value: 'disabled'),
                      Option<String>(value: 'Yiminghe'),
                    ]),
              ),
              Expanded(
                child: Padding(
                  child: Select(
                    controller: SelectController()..selected = ['lucy'],
                    children: const [Option<String>(value: 'lucy')],
                    disabled: true,
                  ),
                  padding: const EdgeInsets.only(left: 8.0),
                ),
              ),
              Expanded(
                child: Padding(
                  child: Select(
                    controller: SelectController()..selected = ['lucy'],
                    children: const [
                      Option<String>(child: Text('Lucy'), value: 'lucy')
                    ],
                    loading: true,
                  ),
                  padding: const EdgeInsets.only(left: 8.0),
                ),
              ),
              Expanded(
                child: Padding(
                  child: Select(
                    controller: SelectController()..selected = ['lucy'],
                    allowClear: true,
                    children: const [
                      Option<String>(child: Text('Lucy'), value: 'lucy')
                    ],
                  ),
                  padding: const EdgeInsets.only(left: 8.0),
                ),
              ),
            ],
          ),
          description: '基本使用。',
          name: '基本使用',
          snippet: 'select.basic',
        ),
      ]),
    );
  }
}
