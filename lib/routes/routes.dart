import 'package:bootcamp_utp/screens/home_screen.dart';
import 'package:bootcamp_utp/screens/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Routes {
  static const initial = '/';
  static const itemDetail = '/itemDetails';

  static Route routes(RouteSettings routeSettings) {
    print('Route name: ${routeSettings.name}');

    switch (routeSettings.name) {
      case initial:
        return _buildRoute(HomeScreen.create);
      case itemDetail:
        return _buildRoute(ItemDetailsScreen.create, routeSettings.arguments);
      default:
        throw PlatformException(
            code: 'ROUTE_ERROR', message: 'Route does not exists');
    }
  }

  static PageRouteBuilder _buildRoute(Function buildFunction, [Object? args]) {
    return PageRouteBuilder(
      pageBuilder: (context, _, __) =>
          args != null ? buildFunction(context, args) : buildFunction(context),
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
