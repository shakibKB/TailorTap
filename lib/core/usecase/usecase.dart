import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {
  const NoParams();
}
