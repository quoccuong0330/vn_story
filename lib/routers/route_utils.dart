enum PAGES {
  login,
  home,
  error,
  splash,
  register,
  otpRegister,
  forgot,
  otpForgot,
  resetPassword,
}

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
      case PAGES.forgot:
        return "/forgot";
      case PAGES.otpForgot:
        return "/otp-forgot";
      case PAGES.resetPassword:
        return "/reset-password";
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
      case PAGES.forgot:
        return "FORGOT";
      case PAGES.otpForgot:
        return "OTP FORGOT";
      case PAGES.resetPassword:
        return "RESET PASSWORD";
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
      case PAGES.forgot:
        return "Forgot";
      case PAGES.otpForgot:
        return "Otp Forgot";
      case PAGES.resetPassword:
        return "Reset password";
    }
  }
}
