import 'package:firestore_odm/firestore_odm.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/services/firestore/model.dart';

part 'schema.odm.dart';

@Schema()
@Collection<Env>('env')
@Collection<User>('env/*/users')
@Collection<MindMap>('env/*/users/*/mind_maps')
const AppSchema appSchema = _$AppSchema;
