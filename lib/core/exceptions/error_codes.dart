class ErrorCodes {
  ErrorCodes._();

  // == Default error ====================================
  static const int defaultError = 10000;
  static const int unknownError = 10001;
  static const int defaultApiError = 10002;
  static const int defaultParseApiError = 10003;

  // == Dio error ========================================
  static const int dioTimeout = -1;
  static const int dioBadCertificate = -2;
  static const int dioBadResponse = -3;
  static const int dioCancel = -4;
  static const int dioConnectionError = -5;
  static const int dioUnknown = -6;

  // == Auth error =======================================
  static const int loginError = 1300;
  static const int forgotPasswordError = 1310;
  static const int verifyOtpError = 1320;
  static const int resetPasswordError = 1330;
}
