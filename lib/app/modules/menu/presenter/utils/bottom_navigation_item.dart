
import 'package:heroicons/heroicons.dart';

enum BottomNavigationItem {
  home('/home', HeroIcons.home, 'Home'),
  events('/events', HeroIcons.mapPin, 'Eventos'),
  friends('/friends', HeroIcons.userGroup, 'Amigos'),
  profile('/profile', HeroIcons.userCircle, 'Perfil');

  const BottomNavigationItem(this.route, this.icon, this.title);
  final String route;
  final HeroIcons icon;
  final String title;
}
