import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/widget/my_scaffold.dart';
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
import 'package:go_router/go_router.dart';

Page<void> _page(BuildContext context, GoRouterState state, Widget page) {
  return NoTransitionPage<void>(key: state.pageKey, child: page);
}

final GoRouter router = GoRouter(
  errorPageBuilder: (_, state) => _page(
    _,
    state,
    const MyScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning, color: Colors.orange_6, size: 24),
                SizedBox(width: 8),
                Text(
                  '尚未实现',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('This widget is still working in progress'),
          ],
        ),
      ),
    ),
  ),
  routes: <GoRoute>[
    GoRoute(path: '/', redirect: (_, state) => '/overview'),
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
