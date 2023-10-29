import 'package:dial_zero/routes/call_screen_page.dart';
import 'package:dial_zero/routes/dialer_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => DialerPageWidget(),
    ),
    GoRoute(
      path: '/dial',
      builder: (context, state) => CallScreenPageWidget(),
    ),
  ],
);