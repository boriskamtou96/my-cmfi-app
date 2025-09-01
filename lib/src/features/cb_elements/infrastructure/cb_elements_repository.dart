import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/infrastructure/cb_element.dart';
import '../../core/infrastructure/result.dart';
import '../../core/infrastructure/user_element_selections.dart';

final _logger = Logger('CBElementsRepository');

class CBElementsRepository {
  final _supabase = Supabase.instance.client;

  Future<Result<List<CBElement>>> getCBElements() async {
    try {
      final res = await _supabase.from('cb_elements').select();
      final elements = (res as List).cast<Map<String, dynamic>>();
      _logger.info('CBElements parsed: $elements');
      return Result.ok(res.map((e) => CBElement.fromJson(e)).toList());
    } on PostgrestException catch (e) {
      _logger.severe('Error getting CBElements: $e');
      return Result.error(e.toString());
    } catch (e) {
      _logger.severe('Unexpected error getting CBElements: $e');
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> setSelectedCBElements(List<int> selectedIndices) async {
    try {
      // Si l'utilisateur nest connecté on renvoie une erreur
      final uid = _supabase.auth.currentSession?.user.id;
      if (uid == null) return Result.error('User not authenticated');
      // On insère les éléments sélectionnés
      final selectedElements = selectedIndices
          .map((e) => UserElementSelections(userId: uid, cbElementId: e))
          .toList();

      _logger.info('Selected elements: $selectedElements');
      await _supabase
          .from('user_element_selections')
          .upsert([...selectedElements.map((e) => e.toJson())]);

      return Result.ok(null);
    } on PostgrestException catch (e) {
      _logger.severe('Error setting selected CBElements: $e');
      return Result.error(e.toString());
    } catch (e) {
      _logger.severe('Unexpected error setting selected CBElements: $e');
      return Result.error(e.toString());
    }
  }
}

final cbElementsRepositoryProvider = Provider<CBElementsRepository>((ref) {
  return CBElementsRepository();
});
