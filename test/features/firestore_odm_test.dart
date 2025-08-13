import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firestore_odm/firestore_odm.dart';
import 'package:flutter_test/flutter_test.dart';

import 'model.dart';
import 'schema.dart';

void main() {
  test('user operations work correctly', () async {
    final firestore = FakeFirebaseFirestore();
    final db = FirestoreODM(appSchema, firestore: firestore);

    await db.users.insert(const User(id: 'test', posts: []));
    await db
        .users('test')
        .posts
        .upsert(
          Post(
            id: 'post1',
            title: 'Test Post 1',
            updatedAt: FirestoreODM.serverTimestamp,
          ),
        );
    await Future<void>.delayed(const Duration(seconds: 2));
    await db
        .users('test')
        .posts
        .upsert(
          Post(
            id: 'post2',
            title: 'Test Post 2',
            updatedAt: FirestoreODM.serverTimestamp,
          ),
        );

    final allPosts = await db.users('test').posts.get();
    final sortedPosts = await db
        .users('test')
        .posts
        .orderBy(($) => ($.updatedAt(),))
        .get();

    expect(allPosts.length, 2);
    expect(sortedPosts.length, 2);
  });
}
