// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// FirestoreGenerator
// **************************************************************************

/// Identifiers for all Firestore collections in the schema
/// Used to map collection paths to their respective collection classes
/// By combining collection classes (e.g., as tuple types),
/// we can use extension methods with record types to reduce boilerplate
/// Example: (_$UsersCollection, _$PostsCollection)
final class _$UsersCollection {}

final class _$Mind_mapsCollection {}

/// Generated schema class - dummy class that only serves as type marker
class AppSchema extends FirestoreSchema {
  const AppSchema();
}

/// Generated schema instance
const AppSchema _$AppSchema = AppSchema();

/// Generated FilterSelector for `User`
extension AppSchemaUserFilterSelectorExtension on FilterSelector<User> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by mindMaps
  ArrayFieldFilter get mindMaps =>
      ArrayFieldFilter(name: 'mindMaps', parent: this);
}

/// Generated OrderByFieldSelector for `User`
extension AppSchemaUserOrderByFieldSelectorExtension
    on OrderByFieldSelector<User> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by mindMaps
  OrderByField<List<MindMap>> get mindMaps =>
      OrderByField(name: 'mindMaps', parent: this);
}

/// Generated AggregateFieldSelector for User
extension AppSchemaUserAggregateFieldSelectorExtension
    on AggregateFieldSelector<User> {}

extension AppSchemaUserPatchBuilder on PatchBuilder<User> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update mindMaps field `List<MindMap>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<MindMap>, MindMap> get mindMaps => ListFieldUpdate(
    name: 'mindMaps',
    parent: this,
    converter: /* {} */ ListConverter<MindMap>(const _$MindMapJsonConverter()),
    elementConverter: const _$MindMapJsonConverter(),
  );
}

/// Generated FilterSelector for `List<E>`
extension AppSchemaListFilterSelectorExtension<E> on FilterSelector<List<E>> {}

/// Generated OrderByFieldSelector for `List<E>`
extension AppSchemaListOrderByFieldSelectorExtension<E>
    on OrderByFieldSelector<List<E>> {}

/// Generated FilterSelector for `MindMap`
extension AppSchemaMindMapFilterSelectorExtension on FilterSelector<MindMap> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by tree
  ArrayFieldFilter get tree => ArrayFieldFilter(name: 'tree', parent: this);

  /// Filter by updatedAt
  DateTimeFieldFilter get updatedAt =>
      DateTimeFieldFilter(name: 'updatedAt', parent: this);
}

/// Generated OrderByFieldSelector for `MindMap`
extension AppSchemaMindMapOrderByFieldSelectorExtension
    on OrderByFieldSelector<MindMap> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by tree
  OrderByField<List<TreeNode>> get tree =>
      OrderByField(name: 'tree', parent: this);

  /// Order by updatedAt
  OrderByField<DateTime> get updatedAt =>
      OrderByField(name: 'updatedAt', parent: this);
}

/// Generated AggregateFieldSelector for MindMap
extension AppSchemaMindMapAggregateFieldSelectorExtension
    on AggregateFieldSelector<MindMap> {}

extension AppSchemaMindMapPatchBuilder on PatchBuilder<MindMap> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update tree field `List<TreeNode>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<TreeNode>, TreeNode> get tree => ListFieldUpdate(
    name: 'tree',
    parent: this,
    converter: /* {} */ ListConverter<TreeNode>(
      const _$TreeNodeJsonConverter(),
    ),
    elementConverter: const _$TreeNodeJsonConverter(),
  );

  /// Update updatedAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get updatedAt =>
      DateTimeFieldUpdate(name: 'updatedAt', parent: this);
}

/// Generated FilterSelector for `TreeNode`
extension AppSchemaTreeNodeFilterSelectorExtension on FilterSelector<TreeNode> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by title
  StringFieldFilter get title => StringFieldFilter(name: 'title', parent: this);

  /// Filter by parentId
  StringFieldFilter get parentId =>
      StringFieldFilter(name: 'parentId', parent: this);

  /// Filter by childrenId
  ArrayFieldFilter get childrenId =>
      ArrayFieldFilter(name: 'childrenId', parent: this);
}

/// Generated OrderByFieldSelector for `TreeNode`
extension AppSchemaTreeNodeOrderByFieldSelectorExtension
    on OrderByFieldSelector<TreeNode> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by title
  OrderByField<String> get title => OrderByField(name: 'title', parent: this);

  /// Order by parentId
  OrderByField<String?> get parentId =>
      OrderByField(name: 'parentId', parent: this);

  /// Order by childrenId
  OrderByField<List<String>> get childrenId =>
      OrderByField(name: 'childrenId', parent: this);
}

/// Generated AggregateFieldSelector for TreeNode
extension AppSchemaTreeNodeAggregateFieldSelectorExtension
    on AggregateFieldSelector<TreeNode> {}

extension AppSchemaTreeNodePatchBuilder on PatchBuilder<TreeNode> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
    name: 'id',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update title field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get title => PatchBuilder(
    name: 'title',
    parent: this,
    converter: const PrimitiveConverter(),
  );

  /// Update parentId field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get parentId => PatchBuilder(
    name: 'parentId',
    parent: this,
    converter: NullableConverter(const PrimitiveConverter()),
  );

  /// Update childrenId field `List<String>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<String>, String> get childrenId => ListFieldUpdate(
    name: 'childrenId',
    parent: this,
    converter: /* {} */ ListConverter<String>(const PrimitiveConverter()),
    elementConverter: const PrimitiveConverter(),
  );
}

/// Class to add collections to `FirestoreODM<AppSchema>`
extension AppSchemaODM on FirestoreODM<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      FirestoreCollection<AppSchema, User, (_$UsersCollection,)>(
        query: firestore.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to `TransactionContext<AppSchema>`
extension $AppSchemaTransactionContext on TransactionContext<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      TransactionCollection<AppSchema, User, (_$UsersCollection,)>(
        query: ref.collection('users'),
        context: this,
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for users collection
extension $AppSchemaUsersTransactionDocument
    on TransactionDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access mind_maps subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<
    AppSchema,
    MindMap,
    (_$UsersCollection, _$Mind_mapsCollection)
  >
  get mindMaps =>
      TransactionCollection<
        AppSchema,
        MindMap,
        (_$UsersCollection, _$Mind_mapsCollection)
      >(
        query: ref.collection('mind_maps'),
        context: context,
        converter: const _$MindMapJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on FirestoreDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access mind_maps subcollection
  FirestoreCollection<
    AppSchema,
    MindMap,
    (_$UsersCollection, _$Mind_mapsCollection)
  >
  get mindMaps =>
      FirestoreCollection<
        AppSchema,
        MindMap,
        (_$UsersCollection, _$Mind_mapsCollection)
      >(
        query: ref.collection('mind_maps'),
        converter: const _$MindMapJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to BatchContext<AppSchema>
extension AppSchemaBatchContextExtensions on BatchContext<AppSchema> {
  /// Access users collection
  BatchCollection<AppSchema, User, (_$UsersCollection,)> get users =>
      BatchCollection(
        collection: firestoreInstance.collection('users'),
        converter: const _$UserJsonConverter(),
        documentIdField: 'id',
        context: this,
      );
}

/// Batch document class for users collection
extension $AppSchemaUsersBatchDocument
    on BatchDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access mind_maps subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<
    AppSchema,
    MindMap,
    (_$UsersCollection, _$Mind_mapsCollection)
  >
  get mindMaps => getBatchCollection(
    parent: this,
    name: 'mind_maps',
    converter: const _$MindMapJsonConverter(),
    documentIdField: 'id',
  );
}

//Generated converter for `MindMap`
class _$MindMapJsonConverter
    implements FirestoreConverter<MindMap, Map<String, dynamic>> {
  const _$MindMapJsonConverter();

  @override
  MindMap fromJson(Map<String, dynamic> data) => MindMap.fromJson(data);

  @override
  Map<String, dynamic> toJson(MindMap value) => value.toJson();
}

//Generated converter for `TreeNode`
class _$TreeNodeJsonConverter
    implements FirestoreConverter<TreeNode, Map<String, dynamic>> {
  const _$TreeNodeJsonConverter();

  @override
  TreeNode fromJson(Map<String, dynamic> data) => TreeNode.fromJson(data);

  @override
  Map<String, dynamic> toJson(TreeNode value) => value.toJson();
}

//Generated converter for `User`
class _$UserJsonConverter
    implements FirestoreConverter<User, Map<String, dynamic>> {
  const _$UserJsonConverter();

  @override
  User fromJson(Map<String, dynamic> data) => User.fromJson(data);

  @override
  Map<String, dynamic> toJson(User value) => value.toJson();
}
