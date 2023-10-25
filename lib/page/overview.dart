import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/provider.dart/current_menu_name.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Overview extends ConsumerWidget {
  const Overview({Key? key}) : super(key: key);

  static const common = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/fNUKzY1sk/Button.svg',
      'title': 'Button 按钮',
      'href': 'button'
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/rrwbSt3FQ/Icon.svg',
      'title': 'Icon 图标',
      'href': 'icon'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/GOM1KQ24O/Typography.svg',
      'title': 'Typography 排版',
      'href': 'typography'
    },
  ];

  static const layout = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/5swjECahe/Divider.svg',
      'title': 'Divider 分割线',
      'href': 'divider'
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/5rWLU27so/Grid.svg',
      'title': 'Grid 栅格',
      'href': 'grid'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/hzEndUVEx/Layout.svg',
      'title': 'Layout 布局',
      'href': 'layout'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/wc6%263gJ0Y8/Space.svg',
      'title': 'Space 间距',
      'href': 'space'
    },
  ];

  static const navigation = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/tX6-md4H6/Affix.svg',
      'title': 'Affix 固钉',
      'href': 'affix'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/9Ltop8JwH/Breadcrumb.svg',
      'title': 'Breadcrumb 面包屑',
      'href': 'breadcrumb'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/eedWN59yJ/Dropdown.svg',
      'title': 'Dropdown 下拉菜单',
      'href': 'dropdown'
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/3XZcjGpvK/Menu.svg',
      'title': 'Menu 导航菜单',
      'href': 'menu'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/1vqv2bj68/Pagination.svg',
      'title': 'Pagination 分页',
      'href': 'pagination'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/6bKE0Cq0R/PageHeader.svg',
      'title': 'PageHeader 页头',
      'href': 'page-header'
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/UZYqMizXHaj/Steps.svg',
      'title': 'Steps 步骤条',
      'href': 'steps'
    },
  ];

  static const dataInput = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/qtJm4yt45/AutoComplete.svg',
      'title': 'AutoComplete 自动完成',
      'href': 'auto-complete',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/8nbVbHEm_/CheckBox.svg',
      'title': 'Checkbox 多选框',
      'href': 'checkbox',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/UdS8y8xyZ/Cascader.svg',
      'title': 'Cascader 级联选择',
      'href': 'cascader',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/RT_USzA48/DatePicker.svg',
      'title': 'DatePicker 日期选择框',
      'href': 'date-picker',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/ORmcdeaoO/Form.svg',
      'title': 'form 表单',
      'href': 'form',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/xS9YEJhfe/Input.svg',
      'title': 'Input 输入框',
      'href': 'input',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/XOS8qZ0kU/InputNumber.svg',
      'title': 'InputNumber 数字输入框',
      'href': 'input-number',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/jPE-itMFM/Mentions.svg',
      'title': 'Mentions 提及',
      'href': 'mentions',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/R5uiIWmxe/Rate.svg',
      'title': 'Rate 评分',
      'href': 'rate',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/8cYb5seNB/Radio.svg',
      'title': 'Radio 单选框',
      'href': 'radio',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/zNdJQMhfm/Switch.svg',
      'title': 'Switch 开关',
      'href': 'switch',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/HZ3meFc6W/Silder.svg',
      'title': 'Slider 滑动输入条',
      'href': 'slider',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/_0XzgOis7/Select.svg',
      'title': 'Select 选择器',
      'href': 'select',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/Ax4DA0njr/TreeSelect.svg',
      'title': 'TreeSelect 树选择',
      'href': 'tree-select',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/QAXskNI4G/Transfer.svg',
      'title': 'Transfer 穿梭框',
      'href': 'transfer',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/h04Zsl98I/TimePicker.svg',
      'title': 'TimePicker 时间选择框',
      'href': 'time-picker',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/QaeBt_ZMg/Upload.svg',
      'title': 'Upload 上传',
      'href': 'upload',
    },
  ];

  static const dataPresentation = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/aBcnbw68hP/Avatar.svg',
      'title': 'Avatar 头像',
      'href': 'avatar',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/6%26GF9WHwvY/Badge.svg',
      'title': 'Badge 徽标数',
      'href': 'badge',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/ILhxpGzBO/Comment.svg',
      'title': 'Comment 评论',
      'href': 'comment',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/IxH16B9RD/Collapse.svg',
      'title': 'Collapse 折叠面板',
      'href': 'collapse',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/%24C9tmj978R/Carousel.svg',
      'title': 'Carousel 走马灯',
      'href': 'carousel',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/NqXt8DJhky/Card.svg',
      'title': 'Card 卡片',
      'href': 'card',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/dPQmLq08DI/Calendar.svg',
      'title': 'Calendar 日历',
      'href': 'calendar',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/MjtG9_FOI/Descriptions.svg',
      'title': 'Descriptions 描述列表',
      'href': 'descriptions',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/MNbKfLBVb/Empty.svg',
      'title': 'Empty 空状态',
      'href': 'empty',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/D1dXz9PZqa/image.svg',
      'title': 'Image 图片',
      'href': 'image',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/5FrZKStG_/List.svg',
      'title': 'List 列表',
      'href': 'list',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/1PNL1p_cO/Popover.svg',
      'title': 'Popover 气泡卡片',
      'href': 'popover',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/rcBNhLBrKbE/Statistic.svg',
      'title': 'Statistic 统计数值',
      'href': 'statistic',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/bmw-prod/a3ff040f-24ba-43e0-92e9-c845df1612ad.svg',
      'title': 'Segmented 分段控制器',
      'href': 'segmented',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/Xh-oWqg9k/Tree.svg',
      'title': 'Tree 树形控件',
      'href': 'tree',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/Vyyeu8jq2/Tooltp.svg',
      'title': 'Tooltip 文字提示',
      'href': 'tooltip',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/vJmo00mmgR/Timeline.svg',
      'title': 'Timeline 时间轴',
      'href': 'timeline',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/cH1BOLfxC/Tag.svg',
      'title': 'Tag 标签',
      'href': 'tag',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/lkI2hNEDr2V/Tabs.svg',
      'title': 'Tabs 标签页',
      'href': 'tabs',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/f-SbcX2Lx/Table.svg',
      'title': 'Table 表格',
      'href': 'table',
    },
  ];

  static const feedback = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/8emPa3fjl/Alert.svg',
      'title': 'Alert 警告提示',
      'href': 'alert',
    },
    {
      'thumbnail':
          'https://img.alicdn.com/imgextra/i4/O1CN019djdZP1OHwXSRGCOW_!!6000000001681-55-tps-161-117.svg',
      'title': 'Drawer 抽屉',
      'href': 'drawer',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/3StSdUlSH/Modal.svg',
      'title': 'Modal 对话框',
      'href': 'modal',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/hAkKTIW0K/Message.svg',
      'title': 'Message 全局提示',
      'href': 'message',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/Jxm5nw61w/Notification.svg',
      'title': 'Notification 通知提醒框',
      'href': 'notification',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/xqsDu4ZyR/Progress.svg',
      'title': 'Progress 进度条',
      'href': 'progress',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/fjMCD9xRq/Popconfirm.svg',
      'title': 'Popconfirm 气泡确认框',
      'href': 'popconfirm',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/9nepwjaLa/Result.svg',
      'title': 'Result 结果',
      'href': 'result',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/LBcJqCPRv/Spin.svg',
      'title': 'Spin 加载中',
      'href': 'spin',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/KpcciCJgv/Skeleton.svg',
      'title': 'Skeleton 骨架屏',
      'href': 'skeleton',
    },
  ];

  static const other = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/_1-C1JwsC/Anchor.svg',
      'title': 'Anchor 锚点',
      'href': 'anchor',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/tJZ5jbTwX/BackTop.svg',
      'title': 'BackTop 回到顶部',
      'href': 'back-top',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/kegYxl1wj/ConfigProvider.svg',
      'title': 'ConfigProvider 全局化配置',
      'href': 'config-provider',
    },
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var title = const TypographyTitle('组件总览', level: 2);

    var description = const Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Text('antdf 为 PC 应用提供了丰富的基础 UI 组件，我们还将持续探索企业级应用的最佳 UI 实践。'),
    );

    var alert = const Alert(
      message: Text('并不建议在除 PC 和 Web 之外的平台使用 antdf ，即使是 Web 平台，也不是第一设计目标。'),
      icon: Icon(Icons.warning),
    );

    var tip = const Alert(
      message: Text('本站用 antdf 编写，并编译打包上传，未进行其他额外处理。'),
      icon: Icon(Icons.warning),
    );

    return MyScaffold(
      body: ListView(
        children: [
          title,
          description,
          alert,
          const SizedBox(height: 16),
          tip,
          const TypographyTitle('通用', level: 3),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 24,
            spacing: 24,
            children: common
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('布局', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: layout
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('导航', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: navigation
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('数据录入', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: dataInput
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('数据展示', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: dataPresentation
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('反馈', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: feedback
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
          const TypographyTitle('其他', level: 3),
          Wrap(
            runSpacing: 24,
            spacing: 24,
            children: other
                .map((widget) => _WidgetThumbnail(
                      onTap: () => _handleTap(context, ref, widget['href']!),
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  void _handleTap(BuildContext context, WidgetRef ref, String href) {
    ref.read(currentMenuNameProvider.state).state = href;
    context.go('/$href');
  }
}

class _WidgetThumbnail extends StatelessWidget {
  const _WidgetThumbnail({
    Key? key,
    this.onTap,
    required this.thumbnail,
    required this.title,
  }) : super(key: key);

  final void Function()? onTap;
  final String thumbnail;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 216,
        width: 320,
        child: Card(
          hoverable: true,
          size: Size.small,
          title: Text(title),
          child: Align(
              child: SvgPicture.network(
            thumbnail,
            height: 145,
            width: 182.5,
          )),
        ),
      ),
    );
  }
}
