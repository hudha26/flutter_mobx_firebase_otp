import 'package:flutter/material.dart';
import 'package:otp_firebase/views/dashboard-page/DashboardPage.dart';
import 'package:otp_firebase/views/main-screen-page/MainScreen.dart';
import 'package:otp_firebase/views/otp-screen-page/OtpScreenPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => MainScreen());
      case '/otpscreen':
        if (arguments is String) {
          return SlideRightRoute(
            widget: OtpScreenPage(
              data: arguments,
            ),
          );
        }
        return _errorRoute(settings);
      case '/dashboard':
        return SlideRightRoute(widget: DashboardPage());
      default:
        return _errorRoute(settings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
