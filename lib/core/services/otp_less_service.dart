import 'package:real_state/injection_container.dart';
import 'package:logger/logger.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

abstract class OtpLessService {
  Future<void> signUpWithWhatsapp({
    required void Function(String? token, String? errorMessage) onReceiveResult,
  });
}

class OtpLessServiceImpl extends OtpLessService {
  static final _otpLessFlutterPlugin = Otpless();
  static const _appId = 'QX7X2GAZ83S9UL7110ZX';

  @override
  Future<void> signUpWithWhatsapp({
    required void Function(String? token, String? errorMessage) onReceiveResult,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `signUpWithWhatsapp` in |OtpLessService|");

      final arg = {'appId': _appId};
      await _otpLessFlutterPlugin.openLoginPage((result) {
        _onReceiveResult(result, onReceiveSuccessResult: onReceiveResult);
      }, arg);

      InjectionContainer.getIt<Logger>().w("End `signUpWithWhatsapp` in |OtpLessService|");
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        "End `signUpWithWhatsapp` in |OtpLessService| Error:$e",
      );
    }
  }

  Future<void> _onReceiveResult(
    result, {
    required void Function(String? token, String? errorMessage) onReceiveSuccessResult,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `_onReceiveResult` in |OtpLessService|");
      if (result['data'] != null) {
        onReceiveSuccessResult(result['data']['token'], null);
      } else {
        onReceiveSuccessResult(null, result['errorMessage']);
      }
      InjectionContainer.getIt<Logger>().w(
        "End `_onReceiveResult` in |OtpLessService| ",
      );
    } catch (e) {
      InjectionContainer.getIt<Logger>().e(
        "End `_onReceiveResult` in |OtpLessService| Error:$e",
      );
    }
  }
}
