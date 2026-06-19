import '../repositories/pace_repository.dart';

class SubmitPaceUseCase {
  final PaceRepository repository;

  SubmitPaceUseCase(this.repository);

  Future<void> call(int paceSeconds) async {
    return await repository.submitPace(paceSeconds);
  }
}
