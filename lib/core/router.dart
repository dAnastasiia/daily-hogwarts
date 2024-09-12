import 'package:daily_hogwarts/core/model/auth_view_model.dart';
import 'package:daily_hogwarts/core/ui/auth_scaffold.dart';
import 'package:daily_hogwarts/core/ui/error_page.dart';
import 'package:daily_hogwarts/core/utils/routes.dart';
import 'package:daily_hogwarts/features/auth/login_page.dart';
import 'package:daily_hogwarts/features/auth/signup_page.dart';
import 'package:daily_hogwarts/features/characters/character_details_page.dart';
import 'package:daily_hogwarts/features/characters/characters_page.dart';
import 'package:daily_hogwarts/features/house/house_page.dart';
import 'package:daily_hogwarts/features/settings/settings_page.dart';
import 'package:daily_hogwarts/features/spells/spells_page.dart';
import 'package:daily_hogwarts/features/start/start_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.home.path,
  redirect: (context, state) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final isAuthenticated = authViewModel.isAuthenticated;

    final bool isGuardedRoute = guardedRoutes.contains(state.fullPath);

    if (!isAuthenticated && isGuardedRoute) {
      return Routes.start.path;
    }

    return state.matchedLocation;
  },
  errorBuilder: (_, state) => ErrorPage(error: state.error),
  routes: [
    GoRoute(
      name: Routes.start.name,
      path: Routes.start.path,
      builder: (_, __) => const StartPage(),
    ),
    GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      name: Routes.signup.name,
      path: Routes.signup.path,
      builder: (_, __) => const SignupPage(),
    ),
    GoRoute(
      name: Routes.characterDetails.name,
      path: Routes.characterDetails.path,
      builder: (_, state) {
        final id = state.pathParameters['id']!;
        return CharacterDetailsPage(id: id);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => AuthScaffold(navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.home.name,
              path: Routes.home.path,
              builder: (_, __) => const HousePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.spells.name,
              path: Routes.spells.path,
              builder: (_, __) => const SpellsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.characters.name,
              path: Routes.characters.path,
              builder: (_, __) => const CharactersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Routes.settings.name,
              path: Routes.settings.path,
              builder: (_, __) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
