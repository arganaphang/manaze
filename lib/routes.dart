import 'package:manaze/screens/analytic/analytic_screen.dart';
import 'package:manaze/screens/category/category_screen.dart';
import 'package:manaze/screens/create/create_screen.dart';
import 'package:manaze/screens/currency/currency_screen.dart';
import 'package:manaze/screens/home/home_screen.dart';
import 'package:manaze/screens/list/list_screen.dart';
import 'package:manaze/screens/setting/setting_screen.dart';

final routes = {
  AnalyticScreen.routeName: (ctx) => const AnalyticScreen(),
  CategoryScreen.routeName: (ctx) => const CategoryScreen(),
  CreateScreen.routeName: (ctx) => const CreateScreen(),
  CurrencyScreen.routeName: (ctx) => const CurrencyScreen(),
  HomeScreen.routeName: (ctx) => const HomeScreen(),
  ListScreen.routeName: (ctx) => const ListScreen(),
  SettingScreen.routeName: (ctx) => const SettingScreen(),
};
