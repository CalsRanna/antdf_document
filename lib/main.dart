import 'package:ant_design_flutter/ant_design_flutter.dart';
import 'package:antdf_document/provider.dart/debug.dart';
import 'package:antdf_document/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var debug = ref.watch(debugProvider);
    return AntApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      showPerformanceOverlay: debug,
    );
  }
}
