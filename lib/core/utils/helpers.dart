import 'package:zupay_store/core/utils/failure.dart';

class Helpers {
  /// Returns String [message] from [failure] object.
  static String convertFailureToString(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    if (failure is LocalFailure) {
      return failure.message;
    }

    return "Unkown Error Occured";
  }
}
