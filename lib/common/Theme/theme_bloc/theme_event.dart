abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}
class LoadThemeEvent extends ThemeEvent {}
class ThemeChangedEvent extends ThemeEvent {
  ThemeChangedEvent(newThemeData);
}  // Add this line
