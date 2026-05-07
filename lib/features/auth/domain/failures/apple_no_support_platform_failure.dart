import '../../../../core/models/failures.dart';
import 'auth_failures.dart';

class AppleNoSupportPlatformFailure extends AuthFailure {
  const AppleNoSupportPlatformFailure({
    super.message = 'Apple Sign-In is not supported on this platform',
  });
}
