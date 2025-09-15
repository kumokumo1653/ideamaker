// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mind_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mindMapControllerHash() => r'37a0c31b050bfd9d38ae1b9120773b741db9affc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MindMapController
    extends BuildlessAutoDisposeAsyncNotifier<MindMapState> {
  late final String? treeId;

  FutureOr<MindMapState> build(String? treeId);
}

/// See also [MindMapController].
@ProviderFor(MindMapController)
const mindMapControllerProvider = MindMapControllerFamily();

/// See also [MindMapController].
class MindMapControllerFamily extends Family<AsyncValue<MindMapState>> {
  /// See also [MindMapController].
  const MindMapControllerFamily();

  /// See also [MindMapController].
  MindMapControllerProvider call(String? treeId) {
    return MindMapControllerProvider(treeId);
  }

  @override
  MindMapControllerProvider getProviderOverride(
    covariant MindMapControllerProvider provider,
  ) {
    return call(provider.treeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mindMapControllerProvider';
}

/// See also [MindMapController].
class MindMapControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<MindMapController, MindMapState> {
  /// See also [MindMapController].
  MindMapControllerProvider(String? treeId)
    : this._internal(
        () => MindMapController()..treeId = treeId,
        from: mindMapControllerProvider,
        name: r'mindMapControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$mindMapControllerHash,
        dependencies: MindMapControllerFamily._dependencies,
        allTransitiveDependencies:
            MindMapControllerFamily._allTransitiveDependencies,
        treeId: treeId,
      );

  MindMapControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.treeId,
  }) : super.internal();

  final String? treeId;

  @override
  FutureOr<MindMapState> runNotifierBuild(
    covariant MindMapController notifier,
  ) {
    return notifier.build(treeId);
  }

  @override
  Override overrideWith(MindMapController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MindMapControllerProvider._internal(
        () => create()..treeId = treeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        treeId: treeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MindMapController, MindMapState>
  createElement() {
    return _MindMapControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MindMapControllerProvider && other.treeId == treeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, treeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MindMapControllerRef
    on AutoDisposeAsyncNotifierProviderRef<MindMapState> {
  /// The parameter `treeId` of this provider.
  String? get treeId;
}

class _MindMapControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<MindMapController, MindMapState>
    with MindMapControllerRef {
  _MindMapControllerProviderElement(super.provider);

  @override
  String? get treeId => (origin as MindMapControllerProvider).treeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
