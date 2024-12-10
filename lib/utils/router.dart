import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nba_highlights/models/category_model.dart';
import 'package:nba_highlights/pages/categories_screen.dart';
import 'package:nba_highlights/pages/category_detail.dart';
import 'package:nba_highlights/pages/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    // debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      // default screen
      GoRoute(
        name: "splash",
        path: '/',
        builder: (context, state) {
          return SplashScreen();
        },
      ),

      // Categories Screen
      GoRoute(
        name: "Categories",
        path: '/categories',
        builder: (context, state) {
          return const CategoriesScreen();
        },
      ),

      // Category detail screen
      GoRoute(
        name: "Single Category",
        path: '/singleCategory',
        builder: (context, state) {
          final Category id = state.extra as Category;
          return CategoryDetailScreen(category: id);
        },
      ),
    ],
  );
}
