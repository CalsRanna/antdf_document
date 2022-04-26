import 'package:ant_design_flutter/antdf.dart';
import 'package:antdf_document/main.dart';
import 'package:flutter_svg/svg.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  static const common = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/fNUKzY1sk/Button.svg',
      'title': 'Button 按钮',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/rrwbSt3FQ/Icon.svg',
      'title': 'Icon 图标',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/GOM1KQ24O/Typography.svg',
      'title': 'Typography 排版',
    },
  ];

  static const layout = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/5swjECahe/Divider.svg',
      'title': 'Divider 分割线',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/5rWLU27so/Grid.svg',
      'title': 'Grid 栅格',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/hzEndUVEx/Layout.svg',
      'title': 'Layout 布局',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/wc6%263gJ0Y8/Space.svg',
      'title': 'Spacer 间距',
    },
  ];

  static const navigation = [
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/tX6-md4H6/Affix.svg',
      'title': 'Affix 固钉',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/9Ltop8JwH/Breadcrumb.svg',
      'title': 'Breadcrumb 面包屑',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/eedWN59yJ/Dropdown.svg',
      'title': 'Dropdown 下拉菜单',
    },
    {
      'thumbnail': 'https://gw.alipayobjects.com/zos/alicdn/3XZcjGpvK/Menu.svg',
      'title': 'Menu 导航菜单',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/1vqv2bj68/Pagination.svg',
      'title': 'Pagination 分页',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/alicdn/6bKE0Cq0R/PageHeader.svg',
      'title': 'PageHeader 页头',
    },
    {
      'thumbnail':
          'https://gw.alipayobjects.com/zos/antfincdn/UZYqMizXHaj/Steps.svg',
      'title': 'Steps 步骤条',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: ListView(
        children: [
          const TypographyTitle('组件总览', level: 2),
          const Padding(
            child: Text('antdf 为 Web 应用提供了丰富的基础 UI 组件，我们还将持续探索企业级应用的最佳 UI 实践。'),
            padding: EdgeInsets.symmetric(
              vertical: 14,
            ),
          ),
          const TypographyTitle('通用', level: 3),
          Wrap(
            children: common
                .map((widget) => _WidgetThumbnail(
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 24,
            spacing: 24,
          ),
          const TypographyTitle('布局', level: 3),
          Wrap(
            children: layout
                .map((widget) => _WidgetThumbnail(
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
            runSpacing: 24,
            spacing: 24,
          ),
          const TypographyTitle('导航', level: 3),
          Wrap(
            children: navigation
                .map((widget) => _WidgetThumbnail(
                      thumbnail: widget['thumbnail']!,
                      title: widget['title']!,
                    ))
                .toList(),
            runSpacing: 24,
            spacing: 24,
          ),
        ],
      ),
    );
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
      child: SizedBox(
        child: Card(
          child: Align(
              child: SvgPicture.network(
            thumbnail,
            height: 145,
            width: 182.5,
          )),
          size: AntSize.small,
          title: Text(title),
        ),
        height: 216,
        width: 182,
      ),
      onTap: onTap,
    );
  }
}
