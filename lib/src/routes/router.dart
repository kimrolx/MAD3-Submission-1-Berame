import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../screens/account_screen.dart';
import '../screens/counter_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/wrapper.dart';

class GlobalRouter {
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();

  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _rootNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  GlobalRouter() {
    _rootNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();

    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: HomeScreen.route,
      redirect: (context, state) {
        return null;
      },
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                path: HomeScreen.route,
                name: HomeScreen.name,
                builder: (context, _) {
                  return const HomeScreen();
                }),
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: "/account",
              name: "Wrapped Account",
              builder: (context, _) {
                return const AccountScreen();
              },
            ),
          ],
          builder: (context, state, child) {
            return HomeWrapper(
              child: child,
            );
          },
        ),
        GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: AccountScreen.route,
            name: AccountScreen.name,
            builder: (context, _) {
              return const AccountScreen();
            },
            routes: [
              GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: CounterScreen.route,
                  name: CounterScreen.name,
                  builder: (context, _) {
                    return const CounterScreen();
                  }),
            ]),
      ],
    );
  }
}
