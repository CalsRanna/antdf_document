import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/page/alert.dart';
import 'package:antdf_document/page/breadcrumb.dart';
import 'package:antdf_document/page/button.dart';
import 'package:antdf_document/page/card.dart';
import 'package:antdf_document/page/checkbox.dart';
import 'package:antdf_document/page/divider.dart';
import 'package:antdf_document/page/drawer.dart';
import 'package:antdf_document/page/icon.dart';
import 'package:antdf_document/page/image.dart';
import 'package:antdf_document/page/input.dart';
import 'package:antdf_document/page/input_number.dart';
import 'package:antdf_document/page/menu.dart';
import 'package:antdf_document/page/message.dart';
import 'package:antdf_document/page/modal.dart';
import 'package:antdf_document/page/notification.dart';
import 'package:antdf_document/page/overview.dart';
import 'package:antdf_document/page/page_header.dart';
import 'package:antdf_document/page/pagination.dart';
import 'package:antdf_document/page/radio.dart';
import 'package:antdf_document/page/select.dart';
import 'package:antdf_document/page/slider.dart';
import 'package:antdf_document/page/space.dart';
import 'package:antdf_document/page/switch.dart';
import 'package:antdf_document/page/table.dart';
import 'package:antdf_document/page/tabs.dart';
import 'package:antdf_document/page/tag.dart';
import 'package:antdf_document/page/tooltip.dart';
import 'package:antdf_document/page/typography.dart';
import 'package:flutter/material.dart' show FloatingActionButton, FlutterLogo;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

Page<void> _page(BuildContext context, GoRouterState state, Widget page) {
  return NoTransitionPage<void>(key: state.pageKey, child: page);
}

final debugProvider = StateProvider((ref) => false);

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var debug = ref.watch(debugProvider);
    return AntApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      showPerformanceOverlay: debug,
    );
  }

  final GoRouter _router = GoRouter(
    errorPageBuilder: (_, state) => _page(
      _,
      state,
      MyScaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.warning, color: Colors.orange_6, size: 24),
                  SizedBox(width: 8),
                  Text(
                    '尚未实现',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text('This widget is still working in progress'),
            ],
          ),
        ),
      ),
    ),
    routes: <GoRoute>[
      GoRoute(path: '/', redirect: (_) => '/overview'),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const AlertDocument()),
        path: '/alert',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const BreadcrumbDocument()),
        path: '/breadcrumb',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const ButtonDocument()),
        path: '/button',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const CardDocument()),
        path: '/card',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const CheckboxDocument()),
        path: '/checkbox',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const DividerDocument()),
        path: '/divider',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const DrawerDocument()),
        path: '/drawer',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const IconDocument()),
        path: '/icon',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const ImageDocument()),
        path: '/image',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const InputDocument()),
        path: '/input',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const InputNumberDocument()),
        path: '/input-number',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const ModalDocument()),
        path: '/modal',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const MenuDocument()),
        path: '/menu',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const MessageDocument()),
        path: '/message',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(
          _,
          state,
          const NotificationDocument(),
        ),
        path: '/notification',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const Overview()),
        path: '/overview',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const PageHeaderDocument()),
        path: '/page-header',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const PaginationDocument()),
        path: '/pagination',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const RadioDocument()),
        path: '/radio',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const SelectDocument()),
        path: '/select',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const SliderDocument()),
        path: '/slider',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const SpaceDocument()),
        path: '/space',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const SwitchDocument()),
        path: '/switch',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const TableDocument()),
        path: '/table',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const TabsDocument()),
        path: '/tabs',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const TagDocument()),
        path: '/tag',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const TooltipDocument()),
        path: '/tooltip',
      ),
      GoRoute(
        pageBuilder: (_, state) => _page(_, state, const TypographyDocument()),
        path: '/typography',
      ),
    ],
  );
}

final currentMenuNameProvider = StateProvider((ref) => 'overview');
final menuOffsetProvider = StateProvider((ref) => 0.0);

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
                      MenuItem(name: 'overview', child: Text('组件总览')),
                      MenuItemGroup(
                        label: Text('通用'),
                        children: [
                          MenuItem(name: 'button', child: Text('Button 按钮')),
                          MenuItem(name: 'icon', child: Text('Icon 图标')),
                          MenuItem(
                            name: 'typography',
                            child: Text('Typography 排版'),
                          ),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('布局'),
                        children: [
                          MenuItem(name: 'divider', child: Text('Divider 分割线')),
                          MenuItem(name: 'grid', child: Text('Grid 栅格')),
                          MenuItem(name: 'layout', child: Text('Layout 布局')),
                          MenuItem(name: 'space', child: Text('Space 间隔')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('导航'),
                        children: [
                          MenuItem(name: 'affix', child: Text('Affix 固钉')),
                          MenuItem(
                            name: 'breadcrumb',
                            child: Text('Breadcrumb 面包屑'),
                          ),
                          MenuItem(
                              name: 'dropdown',
                              child: Text('Dropdown 下拉菜单')),
                          MenuItem(name: 'menu', child: Text('Menu 导航菜单')),
                          MenuItem(
                            name: 'page-header',
                            child: Text('PageHeader 页头'),
                          ),
                          MenuItem(
                            name: 'pagination',
                            child: Text('Pagination 分页'),
                          ),
                          MenuItem(name: 'steps', child: Text('Steps 步骤条')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('数据录入'),
                        children: [
                          MenuItem(
                            name: 'auto-complete',
                            child: Text('AutoComplete 自动完成'),
                          ),
                          MenuItem(
                              name: 'cascader',
                              child: Text('Cascader 级联选择')),
                          MenuItem(
                              name: 'checkbox',
                              child: Text('Checkbox 多选款')),
                          MenuItem(
                              name: 'date-picker',
                              child: Text('DatePicker 日期选择器')),
                          MenuItem(name: 'form', child: Text('Form 表单')),
                          MenuItem(name: 'input', child: Text('Input 输入框')),
                          MenuItem(
                            name: 'input-number',
                            child: Text('InputNumber 数字输入框'),
                          ),
                          MenuItem(
                              name: 'mentions',
                              child: Text('Mentions 提及')),
                          MenuItem(name: 'radio', child: Text('Radio 单选框')),
                          MenuItem(name: 'rate', child: Text('Rate 评分')),
                          MenuItem(name: 'select', child: Text('Select 选择器')),
                          MenuItem(name: 'slider', child: Text('Slider 滑动输入条')),
                          MenuItem(name: 'switch', child: Text('Switch 开关')),
                          MenuItem(
                            name: 'time-picker',
                            child: Text('TimePicker 时间选择器'),
                          ),
                          MenuItem(
                              name: 'transfer',
                              child: Text('Transfer 穿梭框')),
                          MenuItem(
                            name: 'tree-select',
                            child: Text('TreeSelect 树选择器'),
                          ),
                          MenuItem(name: 'upload', child: Text('Upload 上传')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('数据展示'),
                        children: [
                          MenuItem(name: 'avatar', child: Text('Avatar 头像')),
                          MenuItem(name: 'badge', child: Text('Badge 徽标数')),
                          MenuItem(
                              name: 'calendar',
                              child: Text('Calendar 日历')),
                          MenuItem(name: 'card', child: Text('Card 卡片')),
                          MenuItem(
                              name: 'carousel',
                              child: Text('Carousel 走马灯')),
                          MenuItem(
                              name: 'collapse',
                              child: Text('Collapse 折叠面板')),
                          MenuItem(name: 'comment', child: Text('Comment 评论')),
                          MenuItem(
                            name: 'descriptions',
                            child: Text('Descriptions 描述列表'),
                          ),
                          MenuItem(name: 'empty', child: Text('Empty 空状态')),
                          MenuItem(name: 'image', child: Text('Image 图片')),
                          MenuItem(name: 'list', child: Text('List 列表')),
                          MenuItem(
                              name: 'popover',
                              child: Text('Popover 气泡卡片')),
                          MenuItem(
                            name: 'segmented',
                            child: Text('Segmented 分段控制器'),
                          ),
                          MenuItem(
                            name: 'statistic',
                            child: Text('Statistic 统计数值'),
                          ),
                          MenuItem(name: 'table', child: Text('Table 表格')),
                          MenuItem(name: 'tabs', child: Text('Tabs 标签页')),
                          MenuItem(name: 'tag', child: Text('Tag 标签')),
                          MenuItem(
                              name: 'timeline',
                              child: Text('Timeline 时间轴')),
                          MenuItem(
                              name: 'tooltip',
                              child: Text('Tooltip 文字提示')),
                          MenuItem(name: 'tree', child: Text('Tree 树形控件')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('反馈'),
                        children: [
                          MenuItem(name: 'alert', child: Text('Alert 警告提示')),
                          MenuItem(name: 'drawer', child: Text('Drawer 抽屉')),
                          MenuItem(
                              name: 'message',
                              child: Text('Message 全局提示')),
                          MenuItem(name: 'modal', child: Text('Modal 对话框')),
                          MenuItem(
                            name: 'notification',
                            child: Text('Notification 通知提醒框'),
                          ),
                          MenuItem(
                            name: 'popconfirm',
                            child: Text('Popconfirm 气泡确认框'),
                          ),
                          MenuItem(
                              name: 'progress',
                              child: Text('Progress 进度条')),
                          MenuItem(name: 'result', child: Text('Result 结果')),
                          MenuItem(
                              name: 'skeleton',
                              child: Text('Skeleton 骨架屏')),
                          MenuItem(name: 'spin', child: Text('Spin 加载中')),
                        ],
                      ),
                      MenuItemGroup(
                        label: Text('其他'),
                        children: [
                          MenuItem(name: 'anchor', child: Text('Anchor 锚点')),
                          MenuItem(
                              name: 'back-top',
                              child: Text('BackTop 回到顶部')),
                          MenuItem(
                            name: 'config-provider',
                            child: Text('ConfigProvider 全局化配置'),
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
              onPressed: () => ref.read(debugProvider.state).state = !debug,
              tooltip: 'Toggle Performance Overlay',
              child: const Icon(Icons.debug),
            )
          : null,
    );
  }
}
