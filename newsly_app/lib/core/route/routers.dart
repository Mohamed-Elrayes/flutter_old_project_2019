import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../data/models/generate/article/article_item_model.dart';
import '../../presentation/screens/details_article_item_screen.dart';
import '../../presentation/screens/initial_screen.dart';
import '../../presentation/screens/web_view_screen.dart';
import '../../presentation/screens/auth/sign_up_screen.dart';
import '../../presentation/screens/bottom_nav_screen.dart';
import '../../presentation/screens/auth/log_in_screen.dart';
import '../../presentation/screens/auth/terms_and_conditions.dart';

class RoutesName {
  static const String initialScreen = '/';
  static const String logInPath = '/login';
  static const String signUpPath = '/signUp_screen';
  static const String signInPath = '/signIn_screen';
  static const String bottomNavPath = 'bottom_nav_screen';
  static const String homeNavPath = 'home_nav_page';
  static const String searchNavPath = '/search_nav_page';
  static const String seatingNavPath = '/seating_nav_page';
  static const String favoriteNavPath = '/favorite_nav_page';
  static const String webViewPath = '/web_view';
  static const String detailArticleItemPath = '/details_article_item_screen';
  static const String termsAndConditionPath = '/terms_and_conditions_screen';
}

class RouteGenerator {
  static List<Route> generateInitialRoute(String settings) => [
        _GeneratePageRoute(
            widget: const InitialScreen(), routeName: RoutesName.initialScreen),
      ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.logInPath:
        return _GeneratePageRoute(
            widget: const LoginScreen(), routeName: settings.name!);

      case RoutesName.signUpPath:
        return _GeneratePageRoute(
            widget: const SignUpScreen(), routeName: settings.name!);

      case RoutesName.signInPath:
        return _GeneratePageRoute(
            widget: const SignUpScreen(), routeName: settings.name!);

      case RoutesName.termsAndConditionPath:
        return _GeneratePageRoute(
            widget: const TermsAndConditions(), routeName: settings.name!);

      case RoutesName.bottomNavPath:
        return _GeneratePageRoute(
            widget:  BottomNavScreen(), routeName: settings.name!);

      case RoutesName.detailArticleItemPath:
        return _GeneratePageRoute(
            widget:  DetailsArticleItemScreen(articleItemModel: settings.arguments as ArticleItem  ), routeName: settings.name!);

      case RoutesName.webViewPath:
        return _GeneratePageRoute(
            widget: WebViewScreen(
              url: settings.arguments as String,
            ),
            routeName: settings.name!);

      default:
        return _GeneratePageRoute(
            widget: const SignUpScreen(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return RepaintBoundary(child: widget);
            },
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
