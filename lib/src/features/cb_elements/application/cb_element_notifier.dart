import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/infrastructure/cb_element.dart';
import '../infrastructure/cb_elements_repository.dart';

class CbElementNotifier extends StateNotifier<AsyncValue<List<CBElement>>> {
  final CBElementsRepository _cbElementsRepository;

  CbElementNotifier(this._cbElementsRepository)
      : super(const AsyncValue.loading());

  Future<void> getCBElements() async {
    state = const AsyncValue.loading();
    final result = await _cbElementsRepository.getCBElements();
    state = result.when(
      ok: (value) => AsyncValue.data(value),
      error: (error) => AsyncValue.error(error, StackTrace.current),
    );
  }
}

final cbElementNotifierProvider =
    StateNotifierProvider<CbElementNotifier, AsyncValue<List<CBElement>>>(
  (ref) => CbElementNotifier(ref.watch(cbElementsRepositoryProvider)),
);
