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

final class _$PostsCollection {}

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

  /// Filter by posts
  ArrayFieldFilter get posts => ArrayFieldFilter(name: 'posts', parent: this);
}

/// Generated OrderByFieldSelector for `User`
extension AppSchemaUserOrderByFieldSelectorExtension
    on OrderByFieldSelector<User> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by posts
  OrderByField<List<Post>> get posts =>
      OrderByField(name: 'posts', parent: this);
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

  /// Update posts field `List<Post>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<Post>, Post> get posts => ListFieldUpdate(
    name: 'posts',
    parent: this,
    converter: /* {} */ ListConverter<Post>(const _$PostJsonConverter()),
    elementConverter: const _$PostJsonConverter(),
  );
}

/// Generated FilterSelector for `List<E>`
extension AppSchemaListFilterSelectorExtension<E> on FilterSelector<List<E>> {}

/// Generated OrderByFieldSelector for `List<E>`
extension AppSchemaListOrderByFieldSelectorExtension<E>
    on OrderByFieldSelector<List<E>> {}

/// Generated FilterSelector for `Post`
extension AppSchemaPostFilterSelectorExtension on FilterSelector<Post> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id =>
      DocumentIdFieldFilter(name: 'id', parent: this);

  /// Filter by title
  StringFieldFilter get title => StringFieldFilter(name: 'title', parent: this);

  /// Filter by updatedAt
  DateTimeFieldFilter get updatedAt =>
      DateTimeFieldFilter(name: 'updatedAt', parent: this);
}

/// Generated OrderByFieldSelector for `Post`
extension AppSchemaPostOrderByFieldSelectorExtension
    on OrderByFieldSelector<Post> {
  /// Order by document ID (id field)
  OrderByField<String> get id =>
      OrderByField(name: 'id', parent: this, type: FieldPathType.documentId);

  /// Order by title
  OrderByField<String> get title => OrderByField(name: 'title', parent: this);

  /// Order by updatedAt
  OrderByField<DateTime> get updatedAt =>
      OrderByField(name: 'updatedAt', parent: this);
}

/// Generated AggregateFieldSelector for Post
extension AppSchemaPostAggregateFieldSelectorExtension
    on AggregateFieldSelector<Post> {}

extension AppSchemaPostPatchBuilder on PatchBuilder<Post> {
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

  /// Update updatedAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get updatedAt =>
      DateTimeFieldUpdate(name: 'updatedAt', parent: this);
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
  /// Access posts subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, Post, (_$UsersCollection, _$PostsCollection)>
  get posts =>
      TransactionCollection<
        AppSchema,
        Post,
        (_$UsersCollection, _$PostsCollection)
      >(
        query: ref.collection('posts'),
        context: context,
        converter: const _$PostJsonConverter(),
        documentIdField: 'id',
      );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on FirestoreDocument<AppSchema, User, (_$UsersCollection,)> {
  /// Access posts subcollection
  FirestoreCollection<AppSchema, Post, (_$UsersCollection, _$PostsCollection)>
  get posts =>
      FirestoreCollection<
        AppSchema,
        Post,
        (_$UsersCollection, _$PostsCollection)
      >(
        query: ref.collection('posts'),
        converter: const _$PostJsonConverter(),
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
  /// Access posts subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, Post, (_$UsersCollection, _$PostsCollection)>
  get posts => getBatchCollection(
    parent: this,
    name: 'posts',
    converter: const _$PostJsonConverter(),
    documentIdField: 'id',
  );
}

//Generated converter for `Post`
class _$PostJsonConverter
    implements FirestoreConverter<Post, Map<String, dynamic>> {
  const _$PostJsonConverter();

  @override
  Post fromJson(Map<String, dynamic> data) => Post.fromJson(data);

  @override
  Map<String, dynamic> toJson(Post value) => value.toJson();
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
