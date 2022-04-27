import 'package:ant_design_flutter/antdf.dart';

void main() {
  runApp(const AntApp(home: SelectBasicDemo()));
}

class SelectBasicDemo extends StatelessWidget {
  const SelectBasicDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      body: Row(
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
    );
  }
}
