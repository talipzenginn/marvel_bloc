// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:marvel_bloc/view/detail/view/detail_view.dart' as _i3;
import 'package:marvel_bloc/view/detail/viewmodel/detail_viewmodel.dart'
    as _i7;
import 'package:marvel_bloc/view/home/model/character_model.dart' as _i6;
import 'package:marvel_bloc/view/home/view/home_view.dart' as _i2;
import 'package:marvel_bloc/view/splash/view/splash_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashView());
    },
    HomeRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomeView());
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.DetailView(
              key: args.key,
              characterModel: args.characterModel,
              detailViewmodel: args.detailViewmodel));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-view'),
        _i4.RouteConfig(DetailRoute.name, path: '/detail-view')
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-view');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.DetailView]
class DetailRoute extends _i4.PageRouteInfo<DetailRouteArgs> {
  DetailRoute(
      {_i5.Key? key,
      required _i6.CharacterModel characterModel,
      required _i7.DetailViewmodel detailViewmodel})
      : super(DetailRoute.name,
            path: '/detail-view',
            args: DetailRouteArgs(
                key: key,
                characterModel: characterModel,
                detailViewmodel: detailViewmodel));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs(
      {this.key, required this.characterModel, required this.detailViewmodel});

  final _i5.Key? key;

  final _i6.CharacterModel characterModel;

  final _i7.DetailViewmodel detailViewmodel;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, characterModel: $characterModel, detailViewmodel: $detailViewmodel}';
  }
}
