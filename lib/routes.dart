import 'package:go_router/go_router.dart';
import 'package:procal/pages/food_search/food_search_page.dart';
import 'package:procal/pages/home/home_page.dart';
import 'package:procal/pages/intro/intro_page.dart';
import 'package:procal/pages/login/login_page.dart';

class Routes {
  static final home = GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  );
  static final intro = GoRoute(
    path: '/intro',
    builder: (context, state) => const IntroPage(),
  );
  static final login = GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  );

  static final search = GoRoute(
    path: '/search',
    builder: (context, state) => const FoodSearchPage(),
  );
}
