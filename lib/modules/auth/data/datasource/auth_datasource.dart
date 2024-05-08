import 'package:fpdart/fpdart.dart';

import '../../../../core/core.dart';

abstract class AuthDataSource {
  Future<Either<DataError, bool>> login();
}
