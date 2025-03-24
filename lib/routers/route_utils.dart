enum PAGES { login, home, error, splash }

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.home:
        return "/";
      case PAGES.login:
        return "/login";
      case PAGES.error:
        return "/error";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return "SPLASH";
      case PAGES.home:
        return "HOME";
      case PAGES.login:
        return "LOGIN";
      case PAGES.error:
        return "ERROR";
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGES.splash:
        return "Splash";
      case PAGES.home:
        return "Home";
      case PAGES.login:
        return "Login";
      case PAGES.error:
        return "Error";
    }
  }
}
