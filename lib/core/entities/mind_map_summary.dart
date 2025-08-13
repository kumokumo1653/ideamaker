import 'package:freezed_annotation/freezed_annotation.dart';

part 'mind_map_summary.freezed.dart';

@freezed
abstract class MindMapSummary with _$MindMapSummary {
  const factory MindMapSummary({
    required String id,
    required String title,
    required DateTime updatedAt,
    required int nodeCount,
  }) = _MindMapSummary;
}
