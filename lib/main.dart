import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/page/alert.dart';
import 'package:antdf_document/page/breadcrumb.dart';
import 'package:antdf_document/page/button.dart';
import 'package:antdf_document/page/card.dart';
import 'package:antdf_document/page/checkbox.dart';
import 'package:antdf_document/page/divider.dart';
import 'package:antdf_document/page/image.dart';
import 'package:antdf_document/page/input.dart';
import 'package:antdf_document/page/input_number.dart';
import 'package:antdf_document/page/menu.dart';
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
    errorBuilder: (context, state) => MyScaffold(
      body: Center(
        child: Text(
          state.error.toString(),
          style: const TextStyle(color: Colors.red_6),
        ),
      ),
    ),
    routes: <GoRoute>[
      GoRoute(path: '/', redirect: (_) => '/overview'),
      GoRoute(builder: (_, __) => const AlertDocument(), path: '/alert'),
      GoRoute(
        path: '/breadcrumb',
        builder: (context, state) => const BreadcrumbDocument(),
      ),
      GoRoute(path: '/button', builder: (_, __) => const ButtonDocument()),
      GoRoute(path: '/card', builder: (context, state) => const CardDocument()),
      GoRoute(builder: (_, __) => const CheckboxDocument(), path: '/checkbox'),
      GoRoute(
        path: '/divider',
        builder: (context, state) => const DividerDocument(),
      ),
      GoRoute(builder: (_, __) => const ImageDocument(), path: '/image'),
      GoRoute(builder: (_, __) => const InputDocument(), path: '/input'),
      GoRoute(
        builder: (_, __) => const InputNumberDocument(),
        path: '/input-number',
      ),
      GoRoute(path: '/menu', builder: (context, state) => const MenuDocument()),
      GoRoute(path: '/overview', builder: (context, state) => const Overview()),
      GoRoute(
        path: '/page-header',
        builder: (context, state) => const PageHeaderDocument(),
      ),
      GoRoute(
        builder: (_, __) => const PaginationDocument(),
        path: '/pagination',
      ),
      GoRoute(builder: (_, __) => const RadioDocument(), path: '/radio'),
      GoRoute(builder: (_, __) => const SelectDocument(), path: '/select'),
      GoRoute(builder: (_, __) => const SliderDocument(), path: '/slider'),
      GoRoute(
        path: '/space',
        builder: (context, state) => const SpaceDocument(),
      ),
      GoRoute(builder: (_, __) => const SwitchDocument(), path: '/switch'),
      GoRoute(builder: (_, __) => const TableDocument(), path: '/table'),
      GoRoute(builder: (_, __) => const TabsDocument(), path: '/tabs'),
      GoRoute(path: '/tag', builder: (context, state) => const TagDocument()),
      GoRoute(
        path: '/tooltip',
        builder: (context, state) => const TooltipDocument(),
      ),
      GoRoute(
        path: '/typography',
        builder: (context, state) => const TypographyDocument(),
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
    return AntScaffold(
      body: Row(
        children: <Widget>[
          SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
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
                        Text('Ant Design Flutter',
                            style: GoogleFonts.righteous(color: Colors.blue_6))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: Colors.gray_4)),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  Menu(
                    children: const [
                      MenuItem(child: Text('组件总览'), name: 'overview'),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Button 按钮'), name: 'button'),
                          MenuItem(child: Text('Icon 图标'), name: 'icon'),
                          MenuItem(
                            child: Text('Typography 排版'),
                            name: 'typography',
                          ),
                        ],
                        label: Text('通用'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Divider 分割线'), name: 'divider'),
                          MenuItem(child: Text('Grid 栅格'), name: 'grid'),
                          MenuItem(child: Text('Layout 布局'), name: 'layout'),
                          MenuItem(child: Text('Space 间隔'), name: 'space'),
                        ],
                        label: Text('布局'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Affix 固钉'), name: 'affix'),
                          MenuItem(
                            child: Text('Breadcrumb 面包屑'),
                            name: 'breadcrumb',
                          ),
                          MenuItem(
                              child: Text('Dropdown 下拉菜单'), name: 'dropdown'),
                          MenuItem(child: Text('Menu 导航菜单'), name: 'menu'),
                          MenuItem(
                            child: Text('PageHeader 页头'),
                            name: 'page-header',
                          ),
                          MenuItem(
                            child: Text('Pagination 分页'),
                            name: 'pagination',
                          ),
                          MenuItem(child: Text('Steps 步骤条'), name: 'steps'),
                        ],
                        label: Text('导航'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(
                            child: Text('AutoComplete 自动完成'),
                            name: 'auto-complete',
                          ),
                          MenuItem(
                              child: Text('Cascader 级联选择'), name: 'cascader'),
                          MenuItem(
                              child: Text('Checkbox 多选款'), name: 'checkbox'),
                          MenuItem(
                              child: Text('DatePicker 日期选择器'),
                              name: 'date-picker'),
                          MenuItem(child: Text('Form 表单'), name: 'form'),
                          MenuItem(child: Text('Input 输入框'), name: 'input'),
                          MenuItem(
                            child: Text('InputNumber 数字输入框'),
                            name: 'input-number',
                          ),
                          MenuItem(
                              child: Text('Mentions 提及'), name: 'mentions'),
                          MenuItem(child: Text('Radio 单选框'), name: 'radio'),
                          MenuItem(child: Text('Rate 评分'), name: 'rate'),
                          MenuItem(child: Text('Select 选择器'), name: 'select'),
                          MenuItem(child: Text('Slider 滑动输入条'), name: 'slider'),
                          MenuItem(child: Text('Switch 开关'), name: 'switch'),
                          MenuItem(
                            child: Text('TimePicker 时间选择器'),
                            name: 'time-picker',
                          ),
                          MenuItem(
                              child: Text('Transfer 穿梭框'), name: 'transfer'),
                          MenuItem(
                            child: Text('TreeSelect 树选择器'),
                            name: 'tree-select',
                          ),
                          MenuItem(child: Text('Upload 上传'), name: 'upload'),
                        ],
                        label: Text('数据录入'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Avatar 头像'), name: 'avatar'),
                          MenuItem(child: Text('Badge 徽标数'), name: 'badge'),
                          MenuItem(
                              child: Text('Calendar 日历'), name: 'calendar'),
                          MenuItem(child: Text('Card 卡片'), name: 'card'),
                          MenuItem(
                              child: Text('Carousel 走马灯'), name: 'carousel'),
                          MenuItem(
                              child: Text('Collapse 折叠面板'), name: 'collapse'),
                          MenuItem(child: Text('Comment 评论'), name: 'comment'),
                          MenuItem(
                            child: Text('Descriptions 描述列表'),
                            name: 'descriptions',
                          ),
                          MenuItem(child: Text('Empty 空状态'), name: 'empty'),
                          MenuItem(child: Text('Image 图片'), name: 'image'),
                          MenuItem(child: Text('List 列表'), name: 'list'),
                          MenuItem(
                              child: Text('Popover 气泡卡片'), name: 'popover'),
                          MenuItem(
                            child: Text('Segmented 分段控制器'),
                            name: 'segmented',
                          ),
                          MenuItem(
                            child: Text('Statistic 统计数值'),
                            name: 'statistic',
                          ),
                          MenuItem(child: Text('Table 表格'), name: 'table'),
                          MenuItem(child: Text('Tabs 标签页'), name: 'tabs'),
                          MenuItem(child: Text('Tag 标签'), name: 'tag'),
                          MenuItem(
                              child: Text('Timeline 时间轴'), name: 'timeline'),
                          MenuItem(
                              child: Text('Tooltip 文字提示'), name: 'tooltip'),
                          MenuItem(child: Text('Tree 树形控件'), name: 'tree'),
                        ],
                        label: Text('数据展示'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Alert 警告提示'), name: 'alert'),
                          MenuItem(child: Text('Drawer 抽屉'), name: 'drawer'),
                          MenuItem(
                              child: Text('Message 全局提示'), name: 'message'),
                          MenuItem(child: Text('Modal 对话框'), name: 'modal'),
                          MenuItem(
                            child: Text('Notification 通知提醒框'),
                            name: 'notification',
                          ),
                          MenuItem(
                            child: Text('Popconfirm 气泡确认框'),
                            name: 'popconfirm',
                          ),
                          MenuItem(
                              child: Text('Progress 进度条'), name: 'progress'),
                          MenuItem(child: Text('Result 结果'), name: 'result'),
                          MenuItem(
                              child: Text('Skeleton 骨架屏'), name: 'skeleton'),
                          MenuItem(child: Text('Spin 加载中'), name: 'spin'),
                        ],
                        label: Text('反馈'),
                      ),
                      MenuItemGroup(
                        children: [
                          MenuItem(child: Text('Anchor 锚点'), name: 'anchor'),
                          MenuItem(
                              child: Text('BackTop 回到顶部'), name: 'back-top'),
                          MenuItem(
                            child: Text('ConfigProvider 全局化配置'),
                            name: 'config-provider',
                          ),
                        ],
                        label: Text('其他'),
                      ),
                    ],
                    onClick: (item, name) {
                      ref.read(currentMenuNameProvider.state).state = name;
                      ref.read(menuOffsetProvider.state).state =
                          scrollController.offset;
                      context.go('/$name');
                    },
                    selectedKeys: [current],
                  ),
                ],
              ),
              controller: scrollController,
            ),
            width: 300,
          ),
          Expanded(
            child: Container(
              child: body,
              color: Colors.white,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
      floatingActionButton: !inProduction
          ? FloatingActionButton(
              backgroundColor: debug ? Colors.red_6 : Colors.blue_6,
              child: const Icon(Icons.debug),
              onPressed: () => ref.read(debugProvider.state).state = !debug,
              tooltip: 'Toggle Performance Overlay',
            )
          : null,
    );
  }
}
