import 'package:otp/otp.dart';

class TOTP {
  static String getToken(String key) {
    return OTP.generateTOTPCodeString(
        key, DateTime.now().millisecondsSinceEpoch,
        algorithm: Algorithm.SHA1, isGoogle: true);
  }
}
