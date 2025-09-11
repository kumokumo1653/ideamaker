import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/utils/utils.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
abstract class Env with _$Env {
  const factory Env({
    @DocumentIdField() required String id,
  }) = _Env;

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);

  static const Env dev = Env(id: 'dev');
  static const Env prd = Env(id: 'prd');
}

Env getEnv(Flavor flavor) {
  return switch (flavor) {
    Flavor.dev => Env.dev,
    Flavor.prd => Env.prd,
  };
}

@freezed
abstract class User with _$User {
  const factory User({
    @DocumentIdField() required String id,
    required List<MindMap> mindMaps,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class MindMap with _$MindMap {
  const factory MindMap({
    @DocumentIdField() required String id,
    required List<TreeNode> tree,
    required DateTime updatedAt,
  }) = _MindMap;

  factory MindMap.fromJson(Map<String, dynamic> json) =>
      _$MindMapFromJson(json);
}
