import 'dart:io';

import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/provider.dart/current_menu_name.dart';
import 'package:antdf_document/provider.dart/debug.dart';
import 'package:antdf_document/provider.dart/menu_offset.dart';
import 'package:flutter/material.dart' show FloatingActionButton, FlutterLogo;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyScaffold extends ConsumerWidget {
  const MyScaffold({Key? key, this.body}) : super(key: key);

  final Widget? body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var current = ref.watch(currentMenuNameProvider);
    var offset = ref.watch(menuOffsetProvider);
    var debug = ref.watch(debugProvider);
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: offset,
    );
    const bool inProduction = bool.fromEnvironment('dart.vm.product');
    return Scaffold.floatingActionButton(
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 300,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.gray_4)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.network(
                          'https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg',
                          height: 40,
                          width: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            '+',
                            style:
                                TextStyle(color: Colors.gray_6, fontSize: 28),
                          ),
                        ),
                        const FlutterLogo(
                          size: 40,
                        ),
                        Text(
                          'Ant Design Flutter',
                          style: GoogleFonts.staatliches(color: Colors.blue_6),
                        )
                      ],
                    ),
                  ),
                  Menu(
                    onClick: (item, name) {
                      ref.read(currentMenuNameProvider.state).state = name;
                      ref.read(menuOffsetProvider.state).state =
                          scrollController.offset;
                      context.go('/$name');
                    },
                    selectedKeys: [current],
                    children: const [
                      MenuItem(name: 'overview', child: Text('????????????')),
                      MenuItemGroup(
                        label: Text('??????'),
                        children: [
                          MenuItem(name: 'button', child: Text('Button ??????')),
                          MenuItem(name: 'icon', child: Text('Icon ??????')),
                          MenuItem(
                            name: 'typography',
                            child: Text('Typography ??????'),
                          ),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('??????'),
                        children: [
                          MenuItem(name: 'divider', child: Text('Divider ?????????')),
                          // MenuItem(name: 'grid', child: Text('Grid ??????')),
                          // MenuItem(name: 'layout', child: Text('Layout ??????')),
                          MenuItem(name: 'space', child: Text('Space ??????')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('??????'),
                        children: [
                          MenuItem(name: 'affix', child: Text('Affix ??????')),
                          MenuItem(
                            name: 'breadcrumb',
                            child: Text('Breadcrumb ?????????'),
                          ),
                          MenuItem(
                              name: 'dropdown', child: Text('Dropdown ????????????')),
                          MenuItem(name: 'menu', child: Text('Menu ????????????')),
                          MenuItem(
                            name: 'page-header',
                            child: Text('PageHeader ??????'),
                          ),
                          MenuItem(
                            name: 'pagination',
                            child: Text('Pagination ??????'),
                          ),
                          MenuItem(name: 'steps', child: Text('Steps ?????????')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('????????????'),
                        children: [
                          MenuItem(
                            name: 'auto-complete',
                            child: Text('AutoComplete ????????????'),
                          ),
                          MenuItem(
                              name: 'cascader', child: Text('Cascader ????????????')),
                          MenuItem(
                              name: 'checkbox', child: Text('Checkbox ?????????')),
                          MenuItem(
                              name: 'date-picker',
                              child: Text('DatePicker ???????????????')),
                          MenuItem(name: 'form', child: Text('Form ??????')),
                          MenuItem(name: 'input', child: Text('Input ?????????')),
                          MenuItem(
                            name: 'input-number',
                            child: Text('InputNumber ???????????????'),
                          ),
                          MenuItem(
                              name: 'mentions', child: Text('Mentions ??????')),
                          MenuItem(name: 'radio', child: Text('Radio ?????????')),
                          MenuItem(name: 'rate', child: Text('Rate ??????')),
                          MenuItem(name: 'select', child: Text('Select ?????????')),
                          MenuItem(name: 'slider', child: Text('Slider ???????????????')),
                          MenuItem(name: 'switch', child: Text('Switch ??????')),
                          MenuItem(
                            name: 'time-picker',
                            child: Text('TimePicker ???????????????'),
                          ),
                          MenuItem(
                              name: 'transfer', child: Text('Transfer ?????????')),
                          MenuItem(
                            name: 'tree-select',
                            child: Text('TreeSelect ????????????'),
                          ),
                          MenuItem(name: 'upload', child: Text('Upload ??????')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('????????????'),
                        children: [
                          MenuItem(name: 'avatar', child: Text('Avatar ??????')),
                          MenuItem(name: 'badge', child: Text('Badge ?????????')),
                          MenuItem(
                              name: 'calendar', child: Text('Calendar ??????')),
                          MenuItem(name: 'card', child: Text('Card ??????')),
                          MenuItem(
                              name: 'carousel', child: Text('Carousel ?????????')),
                          MenuItem(
                              name: 'collapse', child: Text('Collapse ????????????')),
                          MenuItem(name: 'comment', child: Text('Comment ??????')),
                          MenuItem(
                            name: 'descriptions',
                            child: Text('Descriptions ????????????'),
                          ),
                          MenuItem(name: 'empty', child: Text('Empty ?????????')),
                          MenuItem(name: 'image', child: Text('Image ??????')),
                          MenuItem(name: 'list', child: Text('List ??????')),
                          MenuItem(
                              name: 'popover', child: Text('Popover ????????????')),
                          MenuItem(
                            name: 'segmented',
                            child: Text('Segmented ???????????????'),
                          ),
                          MenuItem(
                            name: 'statistic',
                            child: Text('Statistic ????????????'),
                          ),
                          MenuItem(name: 'table', child: Text('Table ??????')),
                          MenuItem(name: 'tabs', child: Text('Tabs ?????????')),
                          MenuItem(name: 'tag', child: Text('Tag ??????')),
                          MenuItem(
                              name: 'timeline', child: Text('Timeline ?????????')),
                          MenuItem(
                              name: 'tooltip', child: Text('Tooltip ????????????')),
                          MenuItem(name: 'tree', child: Text('Tree ????????????')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('??????'),
                        children: [
                          MenuItem(name: 'alert', child: Text('Alert ????????????')),
                          MenuItem(name: 'drawer', child: Text('Drawer ??????')),
                          MenuItem(
                              name: 'message', child: Text('Message ????????????')),
                          MenuItem(name: 'modal', child: Text('Modal ?????????')),
                          MenuItem(
                            name: 'notification',
                            child: Text('Notification ???????????????'),
                          ),
                          MenuItem(
                            name: 'popconfirm',
                            child: Text('Popconfirm ???????????????'),
                          ),
                          MenuItem(
                              name: 'progress', child: Text('Progress ?????????')),
                          MenuItem(name: 'result', child: Text('Result ??????')),
                          MenuItem(
                              name: 'skeleton', child: Text('Skeleton ?????????')),
                          MenuItem(name: 'spin', child: Text('Spin ?????????')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('??????'),
                        children: [
                          MenuItem(name: 'anchor', child: Text('Anchor ??????')),
                          MenuItem(
                              name: 'back-top', child: Text('BackTop ????????????')),
                          MenuItem(
                            name: 'config-provider',
                            child: Text('ConfigProvider ???????????????'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
              child: body,
            ),
          ),
        ],
      ),
      floatingActionButton: !inProduction
          ? FloatingActionButton(
              backgroundColor: debug ? Colors.red_6 : Colors.blue_6,
              onPressed: () => _handlePress(ref),
              tooltip: 'Toggle Performance Overlay',
              child: const Icon(Icons.debug),
            )
          : null,
    );
  }

  void _handlePress(WidgetRef ref) {
    if (Platform.isWindows || Platform.isMacOS) {
      var debug = ref.watch(debugProvider);
      ref.read(debugProvider.state).state = !debug;
    }
  }
}
