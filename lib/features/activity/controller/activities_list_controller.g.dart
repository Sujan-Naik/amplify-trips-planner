// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activitiesListControllerHash() =>
    r'ae038e7c35dc7c13d1a90149735954d55c085436';

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

abstract class _$ActivitiesListController
    extends BuildlessAutoDisposeAsyncNotifier<List<Activity>> {
  late final String tripId;

  FutureOr<List<Activity>> build(String tripId);
}

/// See also [ActivitiesListController].
@ProviderFor(ActivitiesListController)
const activitiesListControllerProvider = ActivitiesListControllerFamily();

/// See also [ActivitiesListController].
class ActivitiesListControllerFamily
    extends Family<AsyncValue<List<Activity>>> {
  /// See also [ActivitiesListController].
  const ActivitiesListControllerFamily();

  /// See also [ActivitiesListController].
  ActivitiesListControllerProvider call(String tripId) {
    return ActivitiesListControllerProvider(tripId);
  }

  @override
  ActivitiesListControllerProvider getProviderOverride(
    covariant ActivitiesListControllerProvider provider,
  ) {
    return call(provider.tripId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'activitiesListControllerProvider';
}

/// See also [ActivitiesListController].
class ActivitiesListControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ActivitiesListController,
          List<Activity>
        > {
  /// See also [ActivitiesListController].
  ActivitiesListControllerProvider(String tripId)
    : this._internal(
        () => ActivitiesListController()..tripId = tripId,
        from: activitiesListControllerProvider,
        name: r'activitiesListControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$activitiesListControllerHash,
        dependencies: ActivitiesListControllerFamily._dependencies,
        allTransitiveDependencies:
            ActivitiesListControllerFamily._allTransitiveDependencies,
        tripId: tripId,
      );

  ActivitiesListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tripId,
  }) : super.internal();

  final String tripId;

  @override
  FutureOr<List<Activity>> runNotifierBuild(
    covariant ActivitiesListController notifier,
  ) {
    return notifier.build(tripId);
  }

  @override
  Override overrideWith(ActivitiesListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActivitiesListControllerProvider._internal(
        () => create()..tripId = tripId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tripId: tripId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ActivitiesListController,
    List<Activity>
  >
  createElement() {
    return _ActivitiesListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivitiesListControllerProvider && other.tripId == tripId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tripId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ActivitiesListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Activity>> {
  /// The parameter `tripId` of this provider.
  String get tripId;
}

class _ActivitiesListControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ActivitiesListController,
          List<Activity>
        >
    with ActivitiesListControllerRef {
  _ActivitiesListControllerProviderElement(super.provider);

  @override
  String get tripId => (origin as ActivitiesListControllerProvider).tripId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
