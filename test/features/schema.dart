import 'package:firestore_odm/firestore_odm.dart';

import 'model.dart';

part 'schema.odm.dart';

@Schema()
@Collection<User>('users')
@Collection<Post>('users/*/posts')
const AppSchema appSchema = _$AppSchema;
