import 'package:flutter/material.dart';
import 'package:flutter_auth/src/exceptions/error/not_found_page.dart';
import 'package:flutter_auth/src/features/bottom_nav/presentation/states/bloc/bottom_nav_bloc.dart';
import 'package:flutter_auth/src/features/bottom_nav/presentation/widgets/bottom_nav_page.dart';
import 'package:flutter_auth/src/features/login/presentation/widget/login_page.dart';
import 'package:flutter_auth/src/profile/presentation/widgets/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutePages {
  final myBottomNavBloc = BottomNavBloc();

  Route onRoute(RouteSettings routePages) {
    switch (routePages.name) {
      case '/bottomNav':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myBottomNavBloc),
            ],
            child: BottomNavPage(),
          ),
        );
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }
}
