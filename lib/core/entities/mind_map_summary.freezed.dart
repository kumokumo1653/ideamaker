// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mind_map_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MindMapSummary {

 String get id; String get title; DateTime get updatedAt; int get nodeCount;
/// Create a copy of MindMapSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MindMapSummaryCopyWith<MindMapSummary> get copyWith => _$MindMapSummaryCopyWithImpl<MindMapSummary>(this as MindMapSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MindMapSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nodeCount, nodeCount) || other.nodeCount == nodeCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAt,nodeCount);

@override
String toString() {
  return 'MindMapSummary(id: $id, title: $title, updatedAt: $updatedAt, nodeCount: $nodeCount)';
}


}

/// @nodoc
abstract mixin class $MindMapSummaryCopyWith<$Res>  {
  factory $MindMapSummaryCopyWith(MindMapSummary value, $Res Function(MindMapSummary) _then) = _$MindMapSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime updatedAt, int nodeCount
});




}
/// @nodoc
class _$MindMapSummaryCopyWithImpl<$Res>
    implements $MindMapSummaryCopyWith<$Res> {
  _$MindMapSummaryCopyWithImpl(this._self, this._then);

  final MindMapSummary _self;
  final $Res Function(MindMapSummary) _then;

/// Create a copy of MindMapSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? updatedAt = null,Object? nodeCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nodeCount: null == nodeCount ? _self.nodeCount : nodeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _MindMapSummary implements MindMapSummary {
  const _MindMapSummary({required this.id, required this.title, required this.updatedAt, required this.nodeCount});
  

@override final  String id;
@override final  String title;
@override final  DateTime updatedAt;
@override final  int nodeCount;

/// Create a copy of MindMapSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MindMapSummaryCopyWith<_MindMapSummary> get copyWith => __$MindMapSummaryCopyWithImpl<_MindMapSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MindMapSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nodeCount, nodeCount) || other.nodeCount == nodeCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAt,nodeCount);

@override
String toString() {
  return 'MindMapSummary(id: $id, title: $title, updatedAt: $updatedAt, nodeCount: $nodeCount)';
}


}

/// @nodoc
abstract mixin class _$MindMapSummaryCopyWith<$Res> implements $MindMapSummaryCopyWith<$Res> {
  factory _$MindMapSummaryCopyWith(_MindMapSummary value, $Res Function(_MindMapSummary) _then) = __$MindMapSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime updatedAt, int nodeCount
});




}
/// @nodoc
class __$MindMapSummaryCopyWithImpl<$Res>
    implements _$MindMapSummaryCopyWith<$Res> {
  __$MindMapSummaryCopyWithImpl(this._self, this._then);

  final _MindMapSummary _self;
  final $Res Function(_MindMapSummary) _then;

/// Create a copy of MindMapSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? updatedAt = null,Object? nodeCount = null,}) {
  return _then(_MindMapSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,nodeCount: null == nodeCount ? _self.nodeCount : nodeCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
