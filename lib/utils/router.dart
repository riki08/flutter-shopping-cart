import 'package:k11/home/home_page.dart';
import 'package:k11/onboarding/onboarding_page.dart';
import 'package:k11/user-list/user_list_page.dart';
import 'package:k11/user-list/widgets/details_user.dart';

class MyRoutes {
  static final routes = {
    'home': (context) => const HomePage(),
    'onboard': (context) => const OnboardingPage(),
    'users': (context) => const UserListPage(),
    'details': (context) => const DetailsUser(),
  };
}
