import 'package:firestore_odm/firestore_odm.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/services/firestore/model.dart';

part 'schema.odm.dart';

@Schema()
@Collection<User>('users')
@Collection<MindMap>('users/*/mind_maps')
const AppSchema appSchema = _$AppSchema;
