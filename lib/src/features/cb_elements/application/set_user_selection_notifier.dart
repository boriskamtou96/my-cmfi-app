import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infrastructure/cb_elements_repository.dart';

class SetUserSelectionNotifier extends StateNotifier<AsyncValue<void>> {
  final CBElementsRepository _cbElementsRepository;

  SetUserSelectionNotifier(this._cbElementsRepository)
      : super(const AsyncValue.data(null));

  Future<void> setUserSelection(List<int> selectedIndices) async {
    state = const AsyncValue.loading();
    final result =
        await _cbElementsRepository.setSelectedCBElements(selectedIndices);
    state = result.when(
      ok: (value) => AsyncValue.data(null),
      error: (error) => AsyncValue.error(error, StackTrace.current),
    );
  }
}

final setUserSelectionNotifierProvider =
    StateNotifierProvider<SetUserSelectionNotifier, AsyncValue<void>>(
  (ref) => SetUserSelectionNotifier(ref.watch(cbElementsRepositoryProvider)),
);
