class Endpoints {
  static const _apiVersion = "api/v1";
  static const baseUrl = "https://ini-story-api.dev.inisoft.vn/";
  // static const _baseAdminUrl = "$_baseUrl/admin/$_apiVersion";

  static const login = "$_apiVersion/token/";
  static const register = "$_apiVersion/register/";
  static const sendOtpRegister = "$_apiVersion/send-otp-register/";
  static const resetPassword = "$_apiVersion/forgot-password/";
  static const sendOtpForgotPassword = "$_apiVersion/send-otp-forgot-password/";
  static const me = "$_apiVersion/me/";
  static const updateProfile = "$_apiVersion/update-profile/";
  static const updateAvatar = "$_apiVersion/update-avatar/";
  static const refreshToken = "$_apiVersion/token/refresh/";
}
