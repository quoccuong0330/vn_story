enum PAGES { login, home, error, splash, register, otpRegister }

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.home:
        return "/home";
      case PAGES.login:
        return "/login";
      case PAGES.error:
        return "/error";
      case PAGES.register:
        return "/register";
      case PAGES.otpRegister:
        return "/otp-register";
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
      case PAGES.register:
        return "REGISTER";
      case PAGES.otpRegister:
        return "OTP REGISTER";
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
      case PAGES.register:
        return "Register";
      case PAGES.otpRegister:
        return "Otp Register";
    }
  }
}
