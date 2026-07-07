import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/events/presentation/events_screen.dart';
import '../../features/gameplay/presentation/gameplay_screen_v2.dart';
import '../../features/gameplay/presentation/level_select_screen.dart';
import '../../features/gameplay/presentation/lose_screen.dart';
import '../../features/gameplay/presentation/victory_screen.dart';
import '../../features/heroes/presentation/heroes_screen.dart';
import '../../features/home/presentation/animated_home_screen.dart';
import '../../features/home/presentation/splash_screen.dart';
import '../../features/inventory/presentation/inventory_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/shop/presentation/shop_screen.dart';
import '../../features/world/presentation/world_map_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/home', builder: (context, state) => const AnimatedHomeScreen()),
      GoRoute(path: '/world-map', builder: (context, state) => const WorldMapScreen()),
      GoRoute(path: '/level-select', builder: (context, state) => const LevelSelectScreen()),
      GoRoute(path: '/gameplay', builder: (context, state) => const GameplayScreenV2()),
      GoRoute(path: '/victory', builder: (context, state) => const VictoryScreen()),
      GoRoute(path: '/lose', builder: (context, state) => const LoseScreen()),
      GoRoute(path: '/heroes', builder: (context, state) => const HeroesScreen()),
      GoRoute(path: '/inventory', builder: (context, state) => const InventoryScreen()),
      GoRoute(path: '/shop', builder: (context, state) => const ShopScreen()),
      GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(path: '/events', builder: (context, state) => const EventsScreen()),
    ],
  );
});
