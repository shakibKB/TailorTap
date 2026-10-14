import '../../../../core/usecase/usecase.dart';
import '../entities/counter_entity.dart';
import '../repositories/counter_repository.dart';

class IncrementCounter implements UseCase<CounterEntity, int> {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  @override
  Future<CounterEntity> call(int current) {
    return repository.increment(current);
  }
}
