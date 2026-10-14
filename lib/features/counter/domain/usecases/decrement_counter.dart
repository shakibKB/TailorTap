import '../../../../core/usecase/usecase.dart';
import '../entities/counter_entity.dart';
import '../repositories/counter_repository.dart';

class DecrementCounter implements UseCase<CounterEntity, int> {
  final CounterRepository repository;

  DecrementCounter(this.repository);

  @override
  Future<CounterEntity> call(int current) {
    return repository.decrement(current);
  }
}
