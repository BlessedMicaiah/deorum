import 'package:flutter/material.dart';
import '../screens/login_page.dart';
import '../screens/signup_page.dart';
import '../screens/social_page.dart';
import '../screens/landlord_listing_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String social = '/social';
  static const String landlordListing = '/landlord-listing';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    signup: (context) => const SignupPage(),
    social: (context) => const SocialPage(),
    landlordListing: (context) => const LandlordListingPage(),
  };
}
