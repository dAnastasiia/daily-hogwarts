enum Routes {
  home('home', '/'),
  start('start', '/start'),
  login('login', '/login'),
  signup('signup', '/signup'),
  spells('spells', '/spells'),
  characters('characters', '/characters'),
  settings('settings', '/settings'),
  characterDetails('characterDetails', '/characters/:id');

  final String name;
  final String path;

  const Routes(this.name, this.path);
}

final List<String> guardedRoutes = [
  Routes.home.path,
  Routes.spells.path,
  Routes.characters.path,
  Routes.settings.path,
  Routes.characterDetails.path,
];
