import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:style_ai/screens/%20profile/profile_screen.dart';
import 'package:style_ai/screens/auth/splash_screen.dart';
import 'package:style_ai/screens/auth/stylist_screen.dart';
import 'package:style_ai/screens/home_screen.dart';
import 'package:style_ai/widgets/place_holder_screen.dart';
import 'package:style_ai/screens/wardrobe_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/shell/main_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
    GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
    GoRoute(
        path: '/forgot-password',
        builder: (_, __) => const ForgotPasswordScreen()),

    // Bottom navigation: Home, Wardrobe, AI Stylist, Profile
    StatefulShellRoute.indexedStack(
      builder: (_, __, shell) => MainShell(navigationShell: shell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/wardrobe', builder: (_, __) => const WardrobeScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/stylist', builder: (_, __) => const StylistScreen()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: '/profile', builder: (_, __) => const ProfileScreen()),
        ]),
      ],
    ),

    // Pushed screens opened from Home (built in later steps)
    GoRoute(
      path: '/scanner',
      builder: (_, __) => const PlaceholderScreen(
          title: 'Scan Clothes',
          icon: Icons.document_scanner_outlined,
          message: 'Camera & gallery arrive in step 10'),
    ),
    GoRoute(
      path: '/outfit',
      builder: (_, __) => const PlaceholderScreen(
          title: "Today's Outfit",
          icon: Icons.style_outlined,
          message: 'Outfit generator arrives in step 19'),
    ),
    GoRoute(
      path: '/saved-looks',
      builder: (_, __) => const PlaceholderScreen(
          title: 'Saved Looks',
          icon: Icons.bookmark_border_rounded,
          message: 'Saved looks arrive in step 24'),
    ),
  ],
);