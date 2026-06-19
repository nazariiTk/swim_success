import 'package:go_router/go_router.dart';
import '../../features/users/domain/entities/user.dart';
import '../../features/users/presentation/pages/user_detail_page.dart';
import '../../features/pace_selector/presentation/pages/pace_selector_page.dart';
import '../../main_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/user-detail',
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetailPage(user: user);
      },
    ),
    GoRoute(
      path: '/pace-selector',
      builder: (context, state) => const PaceSelectorPage(),
    ),
  ],
);
