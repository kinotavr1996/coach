// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _visionMeta = const VerificationMeta('vision');
  @override
  late final GeneratedColumn<String> vision = GeneratedColumn<String>(
    'vision',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _responsibilityMeta = const VerificationMeta(
    'responsibility',
  );
  @override
  late final GeneratedColumn<String> responsibility = GeneratedColumn<String>(
    'responsibility',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _missionMeta = const VerificationMeta(
    'mission',
  );
  @override
  late final GeneratedColumn<String> mission = GeneratedColumn<String>(
    'mission',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _kpisMeta = const VerificationMeta('kpis');
  @override
  late final GeneratedColumn<String> kpis = GeneratedColumn<String>(
    'kpis',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _stakeholdersMeta = const VerificationMeta(
    'stakeholders',
  );
  @override
  late final GeneratedColumn<String> stakeholders = GeneratedColumn<String>(
    'stakeholders',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _valuesMeta = const VerificationMeta('values');
  @override
  late final GeneratedColumn<String> values = GeneratedColumn<String>(
    'values',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    role,
    scope,
    vision,
    responsibility,
    mission,
    kpis,
    stakeholders,
    values,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    }
    if (data.containsKey('vision')) {
      context.handle(
        _visionMeta,
        vision.isAcceptableOrUnknown(data['vision']!, _visionMeta),
      );
    }
    if (data.containsKey('responsibility')) {
      context.handle(
        _responsibilityMeta,
        responsibility.isAcceptableOrUnknown(
          data['responsibility']!,
          _responsibilityMeta,
        ),
      );
    }
    if (data.containsKey('mission')) {
      context.handle(
        _missionMeta,
        mission.isAcceptableOrUnknown(data['mission']!, _missionMeta),
      );
    }
    if (data.containsKey('kpis')) {
      context.handle(
        _kpisMeta,
        kpis.isAcceptableOrUnknown(data['kpis']!, _kpisMeta),
      );
    }
    if (data.containsKey('stakeholders')) {
      context.handle(
        _stakeholdersMeta,
        stakeholders.isAcceptableOrUnknown(
          data['stakeholders']!,
          _stakeholdersMeta,
        ),
      );
    }
    if (data.containsKey('values')) {
      context.handle(
        _valuesMeta,
        values.isAcceptableOrUnknown(data['values']!, _valuesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      vision: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vision'],
      )!,
      responsibility: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}responsibility'],
      )!,
      mission: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mission'],
      )!,
      kpis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kpis'],
      )!,
      stakeholders: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stakeholders'],
      )!,
      values: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}values'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String role;
  final String scope;
  final String vision;
  final String responsibility;
  final String mission;
  final String kpis;
  final String stakeholders;
  final String values;
  final DateTime updatedAt;
  const Profile({
    required this.id,
    required this.role,
    required this.scope,
    required this.vision,
    required this.responsibility,
    required this.mission,
    required this.kpis,
    required this.stakeholders,
    required this.values,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['role'] = Variable<String>(role);
    map['scope'] = Variable<String>(scope);
    map['vision'] = Variable<String>(vision);
    map['responsibility'] = Variable<String>(responsibility);
    map['mission'] = Variable<String>(mission);
    map['kpis'] = Variable<String>(kpis);
    map['stakeholders'] = Variable<String>(stakeholders);
    map['values'] = Variable<String>(values);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      role: Value(role),
      scope: Value(scope),
      vision: Value(vision),
      responsibility: Value(responsibility),
      mission: Value(mission),
      kpis: Value(kpis),
      stakeholders: Value(stakeholders),
      values: Value(values),
      updatedAt: Value(updatedAt),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      role: serializer.fromJson<String>(json['role']),
      scope: serializer.fromJson<String>(json['scope']),
      vision: serializer.fromJson<String>(json['vision']),
      responsibility: serializer.fromJson<String>(json['responsibility']),
      mission: serializer.fromJson<String>(json['mission']),
      kpis: serializer.fromJson<String>(json['kpis']),
      stakeholders: serializer.fromJson<String>(json['stakeholders']),
      values: serializer.fromJson<String>(json['values']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'role': serializer.toJson<String>(role),
      'scope': serializer.toJson<String>(scope),
      'vision': serializer.toJson<String>(vision),
      'responsibility': serializer.toJson<String>(responsibility),
      'mission': serializer.toJson<String>(mission),
      'kpis': serializer.toJson<String>(kpis),
      'stakeholders': serializer.toJson<String>(stakeholders),
      'values': serializer.toJson<String>(values),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Profile copyWith({
    int? id,
    String? role,
    String? scope,
    String? vision,
    String? responsibility,
    String? mission,
    String? kpis,
    String? stakeholders,
    String? values,
    DateTime? updatedAt,
  }) => Profile(
    id: id ?? this.id,
    role: role ?? this.role,
    scope: scope ?? this.scope,
    vision: vision ?? this.vision,
    responsibility: responsibility ?? this.responsibility,
    mission: mission ?? this.mission,
    kpis: kpis ?? this.kpis,
    stakeholders: stakeholders ?? this.stakeholders,
    values: values ?? this.values,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      role: data.role.present ? data.role.value : this.role,
      scope: data.scope.present ? data.scope.value : this.scope,
      vision: data.vision.present ? data.vision.value : this.vision,
      responsibility: data.responsibility.present
          ? data.responsibility.value
          : this.responsibility,
      mission: data.mission.present ? data.mission.value : this.mission,
      kpis: data.kpis.present ? data.kpis.value : this.kpis,
      stakeholders: data.stakeholders.present
          ? data.stakeholders.value
          : this.stakeholders,
      values: data.values.present ? data.values.value : this.values,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('scope: $scope, ')
          ..write('vision: $vision, ')
          ..write('responsibility: $responsibility, ')
          ..write('mission: $mission, ')
          ..write('kpis: $kpis, ')
          ..write('stakeholders: $stakeholders, ')
          ..write('values: $values, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    role,
    scope,
    vision,
    responsibility,
    mission,
    kpis,
    stakeholders,
    values,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.role == this.role &&
          other.scope == this.scope &&
          other.vision == this.vision &&
          other.responsibility == this.responsibility &&
          other.mission == this.mission &&
          other.kpis == this.kpis &&
          other.stakeholders == this.stakeholders &&
          other.values == this.values &&
          other.updatedAt == this.updatedAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> role;
  final Value<String> scope;
  final Value<String> vision;
  final Value<String> responsibility;
  final Value<String> mission;
  final Value<String> kpis;
  final Value<String> stakeholders;
  final Value<String> values;
  final Value<DateTime> updatedAt;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.role = const Value.absent(),
    this.scope = const Value.absent(),
    this.vision = const Value.absent(),
    this.responsibility = const Value.absent(),
    this.mission = const Value.absent(),
    this.kpis = const Value.absent(),
    this.stakeholders = const Value.absent(),
    this.values = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String role,
    this.scope = const Value.absent(),
    this.vision = const Value.absent(),
    this.responsibility = const Value.absent(),
    this.mission = const Value.absent(),
    this.kpis = const Value.absent(),
    this.stakeholders = const Value.absent(),
    this.values = const Value.absent(),
    required DateTime updatedAt,
  }) : role = Value(role),
       updatedAt = Value(updatedAt);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? role,
    Expression<String>? scope,
    Expression<String>? vision,
    Expression<String>? responsibility,
    Expression<String>? mission,
    Expression<String>? kpis,
    Expression<String>? stakeholders,
    Expression<String>? values,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (role != null) 'role': role,
      if (scope != null) 'scope': scope,
      if (vision != null) 'vision': vision,
      if (responsibility != null) 'responsibility': responsibility,
      if (mission != null) 'mission': mission,
      if (kpis != null) 'kpis': kpis,
      if (stakeholders != null) 'stakeholders': stakeholders,
      if (values != null) 'values': values,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? role,
    Value<String>? scope,
    Value<String>? vision,
    Value<String>? responsibility,
    Value<String>? mission,
    Value<String>? kpis,
    Value<String>? stakeholders,
    Value<String>? values,
    Value<DateTime>? updatedAt,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      role: role ?? this.role,
      scope: scope ?? this.scope,
      vision: vision ?? this.vision,
      responsibility: responsibility ?? this.responsibility,
      mission: mission ?? this.mission,
      kpis: kpis ?? this.kpis,
      stakeholders: stakeholders ?? this.stakeholders,
      values: values ?? this.values,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (vision.present) {
      map['vision'] = Variable<String>(vision.value);
    }
    if (responsibility.present) {
      map['responsibility'] = Variable<String>(responsibility.value);
    }
    if (mission.present) {
      map['mission'] = Variable<String>(mission.value);
    }
    if (kpis.present) {
      map['kpis'] = Variable<String>(kpis.value);
    }
    if (stakeholders.present) {
      map['stakeholders'] = Variable<String>(stakeholders.value);
    }
    if (values.present) {
      map['values'] = Variable<String>(values.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('scope: $scope, ')
          ..write('vision: $vision, ')
          ..write('responsibility: $responsibility, ')
          ..write('mission: $mission, ')
          ..write('kpis: $kpis, ')
          ..write('stakeholders: $stakeholders, ')
          ..write('values: $values, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RoleContextsTable extends RoleContexts
    with TableInfo<$RoleContextsTable, RoleContext> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoleContextsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    name,
    description,
    isActive,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'role_contexts';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoleContext> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoleContext map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoleContext(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RoleContextsTable createAlias(String alias) {
    return $RoleContextsTable(attachedDatabase, alias);
  }
}

class RoleContext extends DataClass implements Insertable<RoleContext> {
  final int id;
  final int profileId;
  final String name;
  final String description;
  final bool isActive;
  final DateTime updatedAt;
  const RoleContext({
    required this.id,
    required this.profileId,
    required this.name,
    required this.description,
    required this.isActive,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['is_active'] = Variable<bool>(isActive);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RoleContextsCompanion toCompanion(bool nullToAbsent) {
    return RoleContextsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      name: Value(name),
      description: Value(description),
      isActive: Value(isActive),
      updatedAt: Value(updatedAt),
    );
  }

  factory RoleContext.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoleContext(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RoleContext copyWith({
    int? id,
    int? profileId,
    String? name,
    String? description,
    bool? isActive,
    DateTime? updatedAt,
  }) => RoleContext(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    name: name ?? this.name,
    description: description ?? this.description,
    isActive: isActive ?? this.isActive,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RoleContext copyWithCompanion(RoleContextsCompanion data) {
    return RoleContext(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoleContext(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, name, description, isActive, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleContext &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.name == this.name &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.updatedAt == this.updatedAt);
}

class RoleContextsCompanion extends UpdateCompanion<RoleContext> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isActive;
  final Value<DateTime> updatedAt;
  const RoleContextsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RoleContextsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String name,
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime updatedAt,
  }) : profileId = Value(profileId),
       name = Value(name),
       updatedAt = Value(updatedAt);
  static Insertable<RoleContext> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RoleContextsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? name,
    Value<String>? description,
    Value<bool>? isActive,
    Value<DateTime>? updatedAt,
  }) {
    return RoleContextsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoleContextsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NorthStarsTable extends NorthStars
    with TableInfo<$NorthStarsTable, NorthStar> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NorthStarsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _roleContextIdMeta = const VerificationMeta(
    'roleContextId',
  );
  @override
  late final GeneratedColumn<int> roleContextId = GeneratedColumn<int>(
    'role_context_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES role_contexts (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _horizonMeta = const VerificationMeta(
    'horizon',
  );
  @override
  late final GeneratedColumn<String> horizon = GeneratedColumn<String>(
    'horizon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('year'),
  );
  static const VerificationMeta _keywordMeta = const VerificationMeta(
    'keyword',
  );
  @override
  late final GeneratedColumn<String> keyword = GeneratedColumn<String>(
    'keyword',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _emotionMeta = const VerificationMeta(
    'emotion',
  );
  @override
  late final GeneratedColumn<String> emotion = GeneratedColumn<String>(
    'emotion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roleContextId,
    title,
    description,
    horizon,
    keyword,
    emotion,
    imagePath,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'north_stars';
  @override
  VerificationContext validateIntegrity(
    Insertable<NorthStar> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('role_context_id')) {
      context.handle(
        _roleContextIdMeta,
        roleContextId.isAcceptableOrUnknown(
          data['role_context_id']!,
          _roleContextIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('horizon')) {
      context.handle(
        _horizonMeta,
        horizon.isAcceptableOrUnknown(data['horizon']!, _horizonMeta),
      );
    }
    if (data.containsKey('keyword')) {
      context.handle(
        _keywordMeta,
        keyword.isAcceptableOrUnknown(data['keyword']!, _keywordMeta),
      );
    }
    if (data.containsKey('emotion')) {
      context.handle(
        _emotionMeta,
        emotion.isAcceptableOrUnknown(data['emotion']!, _emotionMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NorthStar map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NorthStar(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      roleContextId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_context_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      horizon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}horizon'],
      )!,
      keyword: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keyword'],
      )!,
      emotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emotion'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $NorthStarsTable createAlias(String alias) {
    return $NorthStarsTable(attachedDatabase, alias);
  }
}

class NorthStar extends DataClass implements Insertable<NorthStar> {
  final int id;
  final int? roleContextId;
  final String title;
  final String description;
  final String horizon;
  final String keyword;
  final String emotion;
  final String? imagePath;
  final DateTime updatedAt;
  const NorthStar({
    required this.id,
    this.roleContextId,
    required this.title,
    required this.description,
    required this.horizon,
    required this.keyword,
    required this.emotion,
    this.imagePath,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || roleContextId != null) {
      map['role_context_id'] = Variable<int>(roleContextId);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['horizon'] = Variable<String>(horizon);
    map['keyword'] = Variable<String>(keyword);
    map['emotion'] = Variable<String>(emotion);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NorthStarsCompanion toCompanion(bool nullToAbsent) {
    return NorthStarsCompanion(
      id: Value(id),
      roleContextId: roleContextId == null && nullToAbsent
          ? const Value.absent()
          : Value(roleContextId),
      title: Value(title),
      description: Value(description),
      horizon: Value(horizon),
      keyword: Value(keyword),
      emotion: Value(emotion),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      updatedAt: Value(updatedAt),
    );
  }

  factory NorthStar.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NorthStar(
      id: serializer.fromJson<int>(json['id']),
      roleContextId: serializer.fromJson<int?>(json['roleContextId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      horizon: serializer.fromJson<String>(json['horizon']),
      keyword: serializer.fromJson<String>(json['keyword']),
      emotion: serializer.fromJson<String>(json['emotion']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roleContextId': serializer.toJson<int?>(roleContextId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'horizon': serializer.toJson<String>(horizon),
      'keyword': serializer.toJson<String>(keyword),
      'emotion': serializer.toJson<String>(emotion),
      'imagePath': serializer.toJson<String?>(imagePath),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NorthStar copyWith({
    int? id,
    Value<int?> roleContextId = const Value.absent(),
    String? title,
    String? description,
    String? horizon,
    String? keyword,
    String? emotion,
    Value<String?> imagePath = const Value.absent(),
    DateTime? updatedAt,
  }) => NorthStar(
    id: id ?? this.id,
    roleContextId: roleContextId.present
        ? roleContextId.value
        : this.roleContextId,
    title: title ?? this.title,
    description: description ?? this.description,
    horizon: horizon ?? this.horizon,
    keyword: keyword ?? this.keyword,
    emotion: emotion ?? this.emotion,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  NorthStar copyWithCompanion(NorthStarsCompanion data) {
    return NorthStar(
      id: data.id.present ? data.id.value : this.id,
      roleContextId: data.roleContextId.present
          ? data.roleContextId.value
          : this.roleContextId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      horizon: data.horizon.present ? data.horizon.value : this.horizon,
      keyword: data.keyword.present ? data.keyword.value : this.keyword,
      emotion: data.emotion.present ? data.emotion.value : this.emotion,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NorthStar(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('horizon: $horizon, ')
          ..write('keyword: $keyword, ')
          ..write('emotion: $emotion, ')
          ..write('imagePath: $imagePath, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roleContextId,
    title,
    description,
    horizon,
    keyword,
    emotion,
    imagePath,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NorthStar &&
          other.id == this.id &&
          other.roleContextId == this.roleContextId &&
          other.title == this.title &&
          other.description == this.description &&
          other.horizon == this.horizon &&
          other.keyword == this.keyword &&
          other.emotion == this.emotion &&
          other.imagePath == this.imagePath &&
          other.updatedAt == this.updatedAt);
}

class NorthStarsCompanion extends UpdateCompanion<NorthStar> {
  final Value<int> id;
  final Value<int?> roleContextId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> horizon;
  final Value<String> keyword;
  final Value<String> emotion;
  final Value<String?> imagePath;
  final Value<DateTime> updatedAt;
  const NorthStarsCompanion({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.horizon = const Value.absent(),
    this.keyword = const Value.absent(),
    this.emotion = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NorthStarsCompanion.insert({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    this.horizon = const Value.absent(),
    this.keyword = const Value.absent(),
    this.emotion = const Value.absent(),
    this.imagePath = const Value.absent(),
    required DateTime updatedAt,
  }) : title = Value(title),
       updatedAt = Value(updatedAt);
  static Insertable<NorthStar> custom({
    Expression<int>? id,
    Expression<int>? roleContextId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? horizon,
    Expression<String>? keyword,
    Expression<String>? emotion,
    Expression<String>? imagePath,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roleContextId != null) 'role_context_id': roleContextId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (horizon != null) 'horizon': horizon,
      if (keyword != null) 'keyword': keyword,
      if (emotion != null) 'emotion': emotion,
      if (imagePath != null) 'image_path': imagePath,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NorthStarsCompanion copyWith({
    Value<int>? id,
    Value<int?>? roleContextId,
    Value<String>? title,
    Value<String>? description,
    Value<String>? horizon,
    Value<String>? keyword,
    Value<String>? emotion,
    Value<String?>? imagePath,
    Value<DateTime>? updatedAt,
  }) {
    return NorthStarsCompanion(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      title: title ?? this.title,
      description: description ?? this.description,
      horizon: horizon ?? this.horizon,
      keyword: keyword ?? this.keyword,
      emotion: emotion ?? this.emotion,
      imagePath: imagePath ?? this.imagePath,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roleContextId.present) {
      map['role_context_id'] = Variable<int>(roleContextId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (horizon.present) {
      map['horizon'] = Variable<String>(horizon.value);
    }
    if (keyword.present) {
      map['keyword'] = Variable<String>(keyword.value);
    }
    if (emotion.present) {
      map['emotion'] = Variable<String>(emotion.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NorthStarsCompanion(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('horizon: $horizon, ')
          ..write('keyword: $keyword, ')
          ..write('emotion: $emotion, ')
          ..write('imagePath: $imagePath, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _roleContextIdMeta = const VerificationMeta(
    'roleContextId',
  );
  @override
  late final GeneratedColumn<int> roleContextId = GeneratedColumn<int>(
    'role_context_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES role_contexts (id)',
    ),
  );
  static const VerificationMeta _northStarIdMeta = const VerificationMeta(
    'northStarId',
  );
  @override
  late final GeneratedColumn<int> northStarId = GeneratedColumn<int>(
    'north_star_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES north_stars (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priorityMeta = const VerificationMeta(
    'priority',
  );
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
    'priority',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('p2'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _growGoalMeta = const VerificationMeta(
    'growGoal',
  );
  @override
  late final GeneratedColumn<String> growGoal = GeneratedColumn<String>(
    'grow_goal',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _growRealityMeta = const VerificationMeta(
    'growReality',
  );
  @override
  late final GeneratedColumn<String> growReality = GeneratedColumn<String>(
    'grow_reality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _growOptionsMeta = const VerificationMeta(
    'growOptions',
  );
  @override
  late final GeneratedColumn<String> growOptions = GeneratedColumn<String>(
    'grow_options',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _growWayForwardMeta = const VerificationMeta(
    'growWayForward',
  );
  @override
  late final GeneratedColumn<String> growWayForward = GeneratedColumn<String>(
    'grow_way_forward',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _smartSpecificMeta = const VerificationMeta(
    'smartSpecific',
  );
  @override
  late final GeneratedColumn<String> smartSpecific = GeneratedColumn<String>(
    'smart_specific',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _smartMeasurableMeta = const VerificationMeta(
    'smartMeasurable',
  );
  @override
  late final GeneratedColumn<String> smartMeasurable = GeneratedColumn<String>(
    'smart_measurable',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _smartAchievableMeta = const VerificationMeta(
    'smartAchievable',
  );
  @override
  late final GeneratedColumn<String> smartAchievable = GeneratedColumn<String>(
    'smart_achievable',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _smartRelevantMeta = const VerificationMeta(
    'smartRelevant',
  );
  @override
  late final GeneratedColumn<String> smartRelevant = GeneratedColumn<String>(
    'smart_relevant',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _smartTimeBoundMeta = const VerificationMeta(
    'smartTimeBound',
  );
  @override
  late final GeneratedColumn<String> smartTimeBound = GeneratedColumn<String>(
    'smart_time_bound',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resourcesMeta = const VerificationMeta(
    'resources',
  );
  @override
  late final GeneratedColumn<String> resources = GeneratedColumn<String>(
    'resources',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _obstaclesMeta = const VerificationMeta(
    'obstacles',
  );
  @override
  late final GeneratedColumn<String> obstacles = GeneratedColumn<String>(
    'obstacles',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roleContextId,
    northStarId,
    title,
    priority,
    status,
    growGoal,
    growReality,
    growOptions,
    growWayForward,
    smartSpecific,
    smartMeasurable,
    smartAchievable,
    smartRelevant,
    smartTimeBound,
    deadline,
    resources,
    obstacles,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('role_context_id')) {
      context.handle(
        _roleContextIdMeta,
        roleContextId.isAcceptableOrUnknown(
          data['role_context_id']!,
          _roleContextIdMeta,
        ),
      );
    }
    if (data.containsKey('north_star_id')) {
      context.handle(
        _northStarIdMeta,
        northStarId.isAcceptableOrUnknown(
          data['north_star_id']!,
          _northStarIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(
        _priorityMeta,
        priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('grow_goal')) {
      context.handle(
        _growGoalMeta,
        growGoal.isAcceptableOrUnknown(data['grow_goal']!, _growGoalMeta),
      );
    }
    if (data.containsKey('grow_reality')) {
      context.handle(
        _growRealityMeta,
        growReality.isAcceptableOrUnknown(
          data['grow_reality']!,
          _growRealityMeta,
        ),
      );
    }
    if (data.containsKey('grow_options')) {
      context.handle(
        _growOptionsMeta,
        growOptions.isAcceptableOrUnknown(
          data['grow_options']!,
          _growOptionsMeta,
        ),
      );
    }
    if (data.containsKey('grow_way_forward')) {
      context.handle(
        _growWayForwardMeta,
        growWayForward.isAcceptableOrUnknown(
          data['grow_way_forward']!,
          _growWayForwardMeta,
        ),
      );
    }
    if (data.containsKey('smart_specific')) {
      context.handle(
        _smartSpecificMeta,
        smartSpecific.isAcceptableOrUnknown(
          data['smart_specific']!,
          _smartSpecificMeta,
        ),
      );
    }
    if (data.containsKey('smart_measurable')) {
      context.handle(
        _smartMeasurableMeta,
        smartMeasurable.isAcceptableOrUnknown(
          data['smart_measurable']!,
          _smartMeasurableMeta,
        ),
      );
    }
    if (data.containsKey('smart_achievable')) {
      context.handle(
        _smartAchievableMeta,
        smartAchievable.isAcceptableOrUnknown(
          data['smart_achievable']!,
          _smartAchievableMeta,
        ),
      );
    }
    if (data.containsKey('smart_relevant')) {
      context.handle(
        _smartRelevantMeta,
        smartRelevant.isAcceptableOrUnknown(
          data['smart_relevant']!,
          _smartRelevantMeta,
        ),
      );
    }
    if (data.containsKey('smart_time_bound')) {
      context.handle(
        _smartTimeBoundMeta,
        smartTimeBound.isAcceptableOrUnknown(
          data['smart_time_bound']!,
          _smartTimeBoundMeta,
        ),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
      );
    }
    if (data.containsKey('resources')) {
      context.handle(
        _resourcesMeta,
        resources.isAcceptableOrUnknown(data['resources']!, _resourcesMeta),
      );
    }
    if (data.containsKey('obstacles')) {
      context.handle(
        _obstaclesMeta,
        obstacles.isAcceptableOrUnknown(data['obstacles']!, _obstaclesMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      roleContextId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_context_id'],
      ),
      northStarId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}north_star_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      priority: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}priority'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      growGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grow_goal'],
      )!,
      growReality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grow_reality'],
      )!,
      growOptions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grow_options'],
      )!,
      growWayForward: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grow_way_forward'],
      )!,
      smartSpecific: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smart_specific'],
      )!,
      smartMeasurable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smart_measurable'],
      )!,
      smartAchievable: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smart_achievable'],
      )!,
      smartRelevant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smart_relevant'],
      )!,
      smartTimeBound: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}smart_time_bound'],
      )!,
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      resources: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resources'],
      )!,
      obstacles: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}obstacles'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final int? roleContextId;
  final int? northStarId;
  final String title;
  final String priority;
  final String status;
  final String growGoal;
  final String growReality;
  final String growOptions;
  final String growWayForward;
  final String smartSpecific;
  final String smartMeasurable;
  final String smartAchievable;
  final String smartRelevant;
  final String smartTimeBound;
  final DateTime? deadline;
  final String resources;
  final String obstacles;
  final DateTime updatedAt;
  const Goal({
    required this.id,
    this.roleContextId,
    this.northStarId,
    required this.title,
    required this.priority,
    required this.status,
    required this.growGoal,
    required this.growReality,
    required this.growOptions,
    required this.growWayForward,
    required this.smartSpecific,
    required this.smartMeasurable,
    required this.smartAchievable,
    required this.smartRelevant,
    required this.smartTimeBound,
    this.deadline,
    required this.resources,
    required this.obstacles,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || roleContextId != null) {
      map['role_context_id'] = Variable<int>(roleContextId);
    }
    if (!nullToAbsent || northStarId != null) {
      map['north_star_id'] = Variable<int>(northStarId);
    }
    map['title'] = Variable<String>(title);
    map['priority'] = Variable<String>(priority);
    map['status'] = Variable<String>(status);
    map['grow_goal'] = Variable<String>(growGoal);
    map['grow_reality'] = Variable<String>(growReality);
    map['grow_options'] = Variable<String>(growOptions);
    map['grow_way_forward'] = Variable<String>(growWayForward);
    map['smart_specific'] = Variable<String>(smartSpecific);
    map['smart_measurable'] = Variable<String>(smartMeasurable);
    map['smart_achievable'] = Variable<String>(smartAchievable);
    map['smart_relevant'] = Variable<String>(smartRelevant);
    map['smart_time_bound'] = Variable<String>(smartTimeBound);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['resources'] = Variable<String>(resources);
    map['obstacles'] = Variable<String>(obstacles);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      roleContextId: roleContextId == null && nullToAbsent
          ? const Value.absent()
          : Value(roleContextId),
      northStarId: northStarId == null && nullToAbsent
          ? const Value.absent()
          : Value(northStarId),
      title: Value(title),
      priority: Value(priority),
      status: Value(status),
      growGoal: Value(growGoal),
      growReality: Value(growReality),
      growOptions: Value(growOptions),
      growWayForward: Value(growWayForward),
      smartSpecific: Value(smartSpecific),
      smartMeasurable: Value(smartMeasurable),
      smartAchievable: Value(smartAchievable),
      smartRelevant: Value(smartRelevant),
      smartTimeBound: Value(smartTimeBound),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      resources: Value(resources),
      obstacles: Value(obstacles),
      updatedAt: Value(updatedAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      roleContextId: serializer.fromJson<int?>(json['roleContextId']),
      northStarId: serializer.fromJson<int?>(json['northStarId']),
      title: serializer.fromJson<String>(json['title']),
      priority: serializer.fromJson<String>(json['priority']),
      status: serializer.fromJson<String>(json['status']),
      growGoal: serializer.fromJson<String>(json['growGoal']),
      growReality: serializer.fromJson<String>(json['growReality']),
      growOptions: serializer.fromJson<String>(json['growOptions']),
      growWayForward: serializer.fromJson<String>(json['growWayForward']),
      smartSpecific: serializer.fromJson<String>(json['smartSpecific']),
      smartMeasurable: serializer.fromJson<String>(json['smartMeasurable']),
      smartAchievable: serializer.fromJson<String>(json['smartAchievable']),
      smartRelevant: serializer.fromJson<String>(json['smartRelevant']),
      smartTimeBound: serializer.fromJson<String>(json['smartTimeBound']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      resources: serializer.fromJson<String>(json['resources']),
      obstacles: serializer.fromJson<String>(json['obstacles']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roleContextId': serializer.toJson<int?>(roleContextId),
      'northStarId': serializer.toJson<int?>(northStarId),
      'title': serializer.toJson<String>(title),
      'priority': serializer.toJson<String>(priority),
      'status': serializer.toJson<String>(status),
      'growGoal': serializer.toJson<String>(growGoal),
      'growReality': serializer.toJson<String>(growReality),
      'growOptions': serializer.toJson<String>(growOptions),
      'growWayForward': serializer.toJson<String>(growWayForward),
      'smartSpecific': serializer.toJson<String>(smartSpecific),
      'smartMeasurable': serializer.toJson<String>(smartMeasurable),
      'smartAchievable': serializer.toJson<String>(smartAchievable),
      'smartRelevant': serializer.toJson<String>(smartRelevant),
      'smartTimeBound': serializer.toJson<String>(smartTimeBound),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'resources': serializer.toJson<String>(resources),
      'obstacles': serializer.toJson<String>(obstacles),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Goal copyWith({
    int? id,
    Value<int?> roleContextId = const Value.absent(),
    Value<int?> northStarId = const Value.absent(),
    String? title,
    String? priority,
    String? status,
    String? growGoal,
    String? growReality,
    String? growOptions,
    String? growWayForward,
    String? smartSpecific,
    String? smartMeasurable,
    String? smartAchievable,
    String? smartRelevant,
    String? smartTimeBound,
    Value<DateTime?> deadline = const Value.absent(),
    String? resources,
    String? obstacles,
    DateTime? updatedAt,
  }) => Goal(
    id: id ?? this.id,
    roleContextId: roleContextId.present
        ? roleContextId.value
        : this.roleContextId,
    northStarId: northStarId.present ? northStarId.value : this.northStarId,
    title: title ?? this.title,
    priority: priority ?? this.priority,
    status: status ?? this.status,
    growGoal: growGoal ?? this.growGoal,
    growReality: growReality ?? this.growReality,
    growOptions: growOptions ?? this.growOptions,
    growWayForward: growWayForward ?? this.growWayForward,
    smartSpecific: smartSpecific ?? this.smartSpecific,
    smartMeasurable: smartMeasurable ?? this.smartMeasurable,
    smartAchievable: smartAchievable ?? this.smartAchievable,
    smartRelevant: smartRelevant ?? this.smartRelevant,
    smartTimeBound: smartTimeBound ?? this.smartTimeBound,
    deadline: deadline.present ? deadline.value : this.deadline,
    resources: resources ?? this.resources,
    obstacles: obstacles ?? this.obstacles,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      roleContextId: data.roleContextId.present
          ? data.roleContextId.value
          : this.roleContextId,
      northStarId: data.northStarId.present
          ? data.northStarId.value
          : this.northStarId,
      title: data.title.present ? data.title.value : this.title,
      priority: data.priority.present ? data.priority.value : this.priority,
      status: data.status.present ? data.status.value : this.status,
      growGoal: data.growGoal.present ? data.growGoal.value : this.growGoal,
      growReality: data.growReality.present
          ? data.growReality.value
          : this.growReality,
      growOptions: data.growOptions.present
          ? data.growOptions.value
          : this.growOptions,
      growWayForward: data.growWayForward.present
          ? data.growWayForward.value
          : this.growWayForward,
      smartSpecific: data.smartSpecific.present
          ? data.smartSpecific.value
          : this.smartSpecific,
      smartMeasurable: data.smartMeasurable.present
          ? data.smartMeasurable.value
          : this.smartMeasurable,
      smartAchievable: data.smartAchievable.present
          ? data.smartAchievable.value
          : this.smartAchievable,
      smartRelevant: data.smartRelevant.present
          ? data.smartRelevant.value
          : this.smartRelevant,
      smartTimeBound: data.smartTimeBound.present
          ? data.smartTimeBound.value
          : this.smartTimeBound,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      resources: data.resources.present ? data.resources.value : this.resources,
      obstacles: data.obstacles.present ? data.obstacles.value : this.obstacles,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('northStarId: $northStarId, ')
          ..write('title: $title, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('growGoal: $growGoal, ')
          ..write('growReality: $growReality, ')
          ..write('growOptions: $growOptions, ')
          ..write('growWayForward: $growWayForward, ')
          ..write('smartSpecific: $smartSpecific, ')
          ..write('smartMeasurable: $smartMeasurable, ')
          ..write('smartAchievable: $smartAchievable, ')
          ..write('smartRelevant: $smartRelevant, ')
          ..write('smartTimeBound: $smartTimeBound, ')
          ..write('deadline: $deadline, ')
          ..write('resources: $resources, ')
          ..write('obstacles: $obstacles, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roleContextId,
    northStarId,
    title,
    priority,
    status,
    growGoal,
    growReality,
    growOptions,
    growWayForward,
    smartSpecific,
    smartMeasurable,
    smartAchievable,
    smartRelevant,
    smartTimeBound,
    deadline,
    resources,
    obstacles,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.roleContextId == this.roleContextId &&
          other.northStarId == this.northStarId &&
          other.title == this.title &&
          other.priority == this.priority &&
          other.status == this.status &&
          other.growGoal == this.growGoal &&
          other.growReality == this.growReality &&
          other.growOptions == this.growOptions &&
          other.growWayForward == this.growWayForward &&
          other.smartSpecific == this.smartSpecific &&
          other.smartMeasurable == this.smartMeasurable &&
          other.smartAchievable == this.smartAchievable &&
          other.smartRelevant == this.smartRelevant &&
          other.smartTimeBound == this.smartTimeBound &&
          other.deadline == this.deadline &&
          other.resources == this.resources &&
          other.obstacles == this.obstacles &&
          other.updatedAt == this.updatedAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<int?> roleContextId;
  final Value<int?> northStarId;
  final Value<String> title;
  final Value<String> priority;
  final Value<String> status;
  final Value<String> growGoal;
  final Value<String> growReality;
  final Value<String> growOptions;
  final Value<String> growWayForward;
  final Value<String> smartSpecific;
  final Value<String> smartMeasurable;
  final Value<String> smartAchievable;
  final Value<String> smartRelevant;
  final Value<String> smartTimeBound;
  final Value<DateTime?> deadline;
  final Value<String> resources;
  final Value<String> obstacles;
  final Value<DateTime> updatedAt;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    this.northStarId = const Value.absent(),
    this.title = const Value.absent(),
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.growGoal = const Value.absent(),
    this.growReality = const Value.absent(),
    this.growOptions = const Value.absent(),
    this.growWayForward = const Value.absent(),
    this.smartSpecific = const Value.absent(),
    this.smartMeasurable = const Value.absent(),
    this.smartAchievable = const Value.absent(),
    this.smartRelevant = const Value.absent(),
    this.smartTimeBound = const Value.absent(),
    this.deadline = const Value.absent(),
    this.resources = const Value.absent(),
    this.obstacles = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    this.northStarId = const Value.absent(),
    required String title,
    this.priority = const Value.absent(),
    this.status = const Value.absent(),
    this.growGoal = const Value.absent(),
    this.growReality = const Value.absent(),
    this.growOptions = const Value.absent(),
    this.growWayForward = const Value.absent(),
    this.smartSpecific = const Value.absent(),
    this.smartMeasurable = const Value.absent(),
    this.smartAchievable = const Value.absent(),
    this.smartRelevant = const Value.absent(),
    this.smartTimeBound = const Value.absent(),
    this.deadline = const Value.absent(),
    this.resources = const Value.absent(),
    this.obstacles = const Value.absent(),
    required DateTime updatedAt,
  }) : title = Value(title),
       updatedAt = Value(updatedAt);
  static Insertable<Goal> custom({
    Expression<int>? id,
    Expression<int>? roleContextId,
    Expression<int>? northStarId,
    Expression<String>? title,
    Expression<String>? priority,
    Expression<String>? status,
    Expression<String>? growGoal,
    Expression<String>? growReality,
    Expression<String>? growOptions,
    Expression<String>? growWayForward,
    Expression<String>? smartSpecific,
    Expression<String>? smartMeasurable,
    Expression<String>? smartAchievable,
    Expression<String>? smartRelevant,
    Expression<String>? smartTimeBound,
    Expression<DateTime>? deadline,
    Expression<String>? resources,
    Expression<String>? obstacles,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roleContextId != null) 'role_context_id': roleContextId,
      if (northStarId != null) 'north_star_id': northStarId,
      if (title != null) 'title': title,
      if (priority != null) 'priority': priority,
      if (status != null) 'status': status,
      if (growGoal != null) 'grow_goal': growGoal,
      if (growReality != null) 'grow_reality': growReality,
      if (growOptions != null) 'grow_options': growOptions,
      if (growWayForward != null) 'grow_way_forward': growWayForward,
      if (smartSpecific != null) 'smart_specific': smartSpecific,
      if (smartMeasurable != null) 'smart_measurable': smartMeasurable,
      if (smartAchievable != null) 'smart_achievable': smartAchievable,
      if (smartRelevant != null) 'smart_relevant': smartRelevant,
      if (smartTimeBound != null) 'smart_time_bound': smartTimeBound,
      if (deadline != null) 'deadline': deadline,
      if (resources != null) 'resources': resources,
      if (obstacles != null) 'obstacles': obstacles,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GoalsCompanion copyWith({
    Value<int>? id,
    Value<int?>? roleContextId,
    Value<int?>? northStarId,
    Value<String>? title,
    Value<String>? priority,
    Value<String>? status,
    Value<String>? growGoal,
    Value<String>? growReality,
    Value<String>? growOptions,
    Value<String>? growWayForward,
    Value<String>? smartSpecific,
    Value<String>? smartMeasurable,
    Value<String>? smartAchievable,
    Value<String>? smartRelevant,
    Value<String>? smartTimeBound,
    Value<DateTime?>? deadline,
    Value<String>? resources,
    Value<String>? obstacles,
    Value<DateTime>? updatedAt,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      northStarId: northStarId ?? this.northStarId,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      growGoal: growGoal ?? this.growGoal,
      growReality: growReality ?? this.growReality,
      growOptions: growOptions ?? this.growOptions,
      growWayForward: growWayForward ?? this.growWayForward,
      smartSpecific: smartSpecific ?? this.smartSpecific,
      smartMeasurable: smartMeasurable ?? this.smartMeasurable,
      smartAchievable: smartAchievable ?? this.smartAchievable,
      smartRelevant: smartRelevant ?? this.smartRelevant,
      smartTimeBound: smartTimeBound ?? this.smartTimeBound,
      deadline: deadline ?? this.deadline,
      resources: resources ?? this.resources,
      obstacles: obstacles ?? this.obstacles,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roleContextId.present) {
      map['role_context_id'] = Variable<int>(roleContextId.value);
    }
    if (northStarId.present) {
      map['north_star_id'] = Variable<int>(northStarId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (growGoal.present) {
      map['grow_goal'] = Variable<String>(growGoal.value);
    }
    if (growReality.present) {
      map['grow_reality'] = Variable<String>(growReality.value);
    }
    if (growOptions.present) {
      map['grow_options'] = Variable<String>(growOptions.value);
    }
    if (growWayForward.present) {
      map['grow_way_forward'] = Variable<String>(growWayForward.value);
    }
    if (smartSpecific.present) {
      map['smart_specific'] = Variable<String>(smartSpecific.value);
    }
    if (smartMeasurable.present) {
      map['smart_measurable'] = Variable<String>(smartMeasurable.value);
    }
    if (smartAchievable.present) {
      map['smart_achievable'] = Variable<String>(smartAchievable.value);
    }
    if (smartRelevant.present) {
      map['smart_relevant'] = Variable<String>(smartRelevant.value);
    }
    if (smartTimeBound.present) {
      map['smart_time_bound'] = Variable<String>(smartTimeBound.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (resources.present) {
      map['resources'] = Variable<String>(resources.value);
    }
    if (obstacles.present) {
      map['obstacles'] = Variable<String>(obstacles.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('northStarId: $northStarId, ')
          ..write('title: $title, ')
          ..write('priority: $priority, ')
          ..write('status: $status, ')
          ..write('growGoal: $growGoal, ')
          ..write('growReality: $growReality, ')
          ..write('growOptions: $growOptions, ')
          ..write('growWayForward: $growWayForward, ')
          ..write('smartSpecific: $smartSpecific, ')
          ..write('smartMeasurable: $smartMeasurable, ')
          ..write('smartAchievable: $smartAchievable, ')
          ..write('smartRelevant: $smartRelevant, ')
          ..write('smartTimeBound: $smartTimeBound, ')
          ..write('deadline: $deadline, ')
          ..write('resources: $resources, ')
          ..write('obstacles: $obstacles, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ActionItemsTable extends ActionItems
    with TableInfo<$ActionItemsTable, ActionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<int> goalId = GeneratedColumn<int>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('todo'),
  );
  static const VerificationMeta _blockersMeta = const VerificationMeta(
    'blockers',
  );
  @override
  late final GeneratedColumn<String> blockers = GeneratedColumn<String>(
    'blockers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    goalId,
    title,
    dueDate,
    status,
    blockers,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'action_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('blockers')) {
      context.handle(
        _blockersMeta,
        blockers.isAcceptableOrUnknown(data['blockers']!, _blockersMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActionItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      blockers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blockers'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ActionItemsTable createAlias(String alias) {
    return $ActionItemsTable(attachedDatabase, alias);
  }
}

class ActionItem extends DataClass implements Insertable<ActionItem> {
  final int id;
  final int goalId;
  final String title;
  final DateTime? dueDate;
  final String status;
  final String blockers;
  final DateTime updatedAt;
  const ActionItem({
    required this.id,
    required this.goalId,
    required this.title,
    this.dueDate,
    required this.status,
    required this.blockers,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['goal_id'] = Variable<int>(goalId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['status'] = Variable<String>(status);
    map['blockers'] = Variable<String>(blockers);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ActionItemsCompanion toCompanion(bool nullToAbsent) {
    return ActionItemsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      title: Value(title),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      status: Value(status),
      blockers: Value(blockers),
      updatedAt: Value(updatedAt),
    );
  }

  factory ActionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActionItem(
      id: serializer.fromJson<int>(json['id']),
      goalId: serializer.fromJson<int>(json['goalId']),
      title: serializer.fromJson<String>(json['title']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      status: serializer.fromJson<String>(json['status']),
      blockers: serializer.fromJson<String>(json['blockers']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'goalId': serializer.toJson<int>(goalId),
      'title': serializer.toJson<String>(title),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'status': serializer.toJson<String>(status),
      'blockers': serializer.toJson<String>(blockers),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ActionItem copyWith({
    int? id,
    int? goalId,
    String? title,
    Value<DateTime?> dueDate = const Value.absent(),
    String? status,
    String? blockers,
    DateTime? updatedAt,
  }) => ActionItem(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    title: title ?? this.title,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    status: status ?? this.status,
    blockers: blockers ?? this.blockers,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ActionItem copyWithCompanion(ActionItemsCompanion data) {
    return ActionItem(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      title: data.title.present ? data.title.value : this.title,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
      blockers: data.blockers.present ? data.blockers.value : this.blockers,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActionItem(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('title: $title, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('blockers: $blockers, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, goalId, title, dueDate, status, blockers, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionItem &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.title == this.title &&
          other.dueDate == this.dueDate &&
          other.status == this.status &&
          other.blockers == this.blockers &&
          other.updatedAt == this.updatedAt);
}

class ActionItemsCompanion extends UpdateCompanion<ActionItem> {
  final Value<int> id;
  final Value<int> goalId;
  final Value<String> title;
  final Value<DateTime?> dueDate;
  final Value<String> status;
  final Value<String> blockers;
  final Value<DateTime> updatedAt;
  const ActionItemsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.title = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.blockers = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ActionItemsCompanion.insert({
    this.id = const Value.absent(),
    required int goalId,
    required String title,
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.blockers = const Value.absent(),
    required DateTime updatedAt,
  }) : goalId = Value(goalId),
       title = Value(title),
       updatedAt = Value(updatedAt);
  static Insertable<ActionItem> custom({
    Expression<int>? id,
    Expression<int>? goalId,
    Expression<String>? title,
    Expression<DateTime>? dueDate,
    Expression<String>? status,
    Expression<String>? blockers,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (title != null) 'title': title,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
      if (blockers != null) 'blockers': blockers,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ActionItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? goalId,
    Value<String>? title,
    Value<DateTime?>? dueDate,
    Value<String>? status,
    Value<String>? blockers,
    Value<DateTime>? updatedAt,
  }) {
    return ActionItemsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      blockers: blockers ?? this.blockers,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<int>(goalId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (blockers.present) {
      map['blockers'] = Variable<String>(blockers.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActionItemsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('title: $title, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('blockers: $blockers, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CheckInsTable extends CheckIns with TableInfo<$CheckInsTable, CheckIn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckInsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _roleContextIdMeta = const VerificationMeta(
    'roleContextId',
  );
  @override
  late final GeneratedColumn<int> roleContextId = GeneratedColumn<int>(
    'role_context_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES role_contexts (id)',
    ),
  );
  static const VerificationMeta _cadenceMeta = const VerificationMeta(
    'cadence',
  );
  @override
  late final GeneratedColumn<String> cadence = GeneratedColumn<String>(
    'cadence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('weekly'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressPercentMeta = const VerificationMeta(
    'progressPercent',
  );
  @override
  late final GeneratedColumn<int> progressPercent = GeneratedColumn<int>(
    'progress_percent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _blockersMeta = const VerificationMeta(
    'blockers',
  );
  @override
  late final GeneratedColumn<String> blockers = GeneratedColumn<String>(
    'blockers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _lessonsMeta = const VerificationMeta(
    'lessons',
  );
  @override
  late final GeneratedColumn<String> lessons = GeneratedColumn<String>(
    'lessons',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roleContextId,
    cadence,
    date,
    progressPercent,
    blockers,
    lessons,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_ins';
  @override
  VerificationContext validateIntegrity(
    Insertable<CheckIn> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('role_context_id')) {
      context.handle(
        _roleContextIdMeta,
        roleContextId.isAcceptableOrUnknown(
          data['role_context_id']!,
          _roleContextIdMeta,
        ),
      );
    }
    if (data.containsKey('cadence')) {
      context.handle(
        _cadenceMeta,
        cadence.isAcceptableOrUnknown(data['cadence']!, _cadenceMeta),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('progress_percent')) {
      context.handle(
        _progressPercentMeta,
        progressPercent.isAcceptableOrUnknown(
          data['progress_percent']!,
          _progressPercentMeta,
        ),
      );
    }
    if (data.containsKey('blockers')) {
      context.handle(
        _blockersMeta,
        blockers.isAcceptableOrUnknown(data['blockers']!, _blockersMeta),
      );
    }
    if (data.containsKey('lessons')) {
      context.handle(
        _lessonsMeta,
        lessons.isAcceptableOrUnknown(data['lessons']!, _lessonsMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckIn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckIn(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      roleContextId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_context_id'],
      ),
      cadence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cadence'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      progressPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress_percent'],
      )!,
      blockers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blockers'],
      )!,
      lessons: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lessons'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CheckInsTable createAlias(String alias) {
    return $CheckInsTable(attachedDatabase, alias);
  }
}

class CheckIn extends DataClass implements Insertable<CheckIn> {
  final int id;
  final int? roleContextId;
  final String cadence;
  final DateTime date;
  final int progressPercent;
  final String blockers;
  final String lessons;
  final DateTime updatedAt;
  const CheckIn({
    required this.id,
    this.roleContextId,
    required this.cadence,
    required this.date,
    required this.progressPercent,
    required this.blockers,
    required this.lessons,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || roleContextId != null) {
      map['role_context_id'] = Variable<int>(roleContextId);
    }
    map['cadence'] = Variable<String>(cadence);
    map['date'] = Variable<DateTime>(date);
    map['progress_percent'] = Variable<int>(progressPercent);
    map['blockers'] = Variable<String>(blockers);
    map['lessons'] = Variable<String>(lessons);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CheckInsCompanion toCompanion(bool nullToAbsent) {
    return CheckInsCompanion(
      id: Value(id),
      roleContextId: roleContextId == null && nullToAbsent
          ? const Value.absent()
          : Value(roleContextId),
      cadence: Value(cadence),
      date: Value(date),
      progressPercent: Value(progressPercent),
      blockers: Value(blockers),
      lessons: Value(lessons),
      updatedAt: Value(updatedAt),
    );
  }

  factory CheckIn.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckIn(
      id: serializer.fromJson<int>(json['id']),
      roleContextId: serializer.fromJson<int?>(json['roleContextId']),
      cadence: serializer.fromJson<String>(json['cadence']),
      date: serializer.fromJson<DateTime>(json['date']),
      progressPercent: serializer.fromJson<int>(json['progressPercent']),
      blockers: serializer.fromJson<String>(json['blockers']),
      lessons: serializer.fromJson<String>(json['lessons']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roleContextId': serializer.toJson<int?>(roleContextId),
      'cadence': serializer.toJson<String>(cadence),
      'date': serializer.toJson<DateTime>(date),
      'progressPercent': serializer.toJson<int>(progressPercent),
      'blockers': serializer.toJson<String>(blockers),
      'lessons': serializer.toJson<String>(lessons),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CheckIn copyWith({
    int? id,
    Value<int?> roleContextId = const Value.absent(),
    String? cadence,
    DateTime? date,
    int? progressPercent,
    String? blockers,
    String? lessons,
    DateTime? updatedAt,
  }) => CheckIn(
    id: id ?? this.id,
    roleContextId: roleContextId.present
        ? roleContextId.value
        : this.roleContextId,
    cadence: cadence ?? this.cadence,
    date: date ?? this.date,
    progressPercent: progressPercent ?? this.progressPercent,
    blockers: blockers ?? this.blockers,
    lessons: lessons ?? this.lessons,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CheckIn copyWithCompanion(CheckInsCompanion data) {
    return CheckIn(
      id: data.id.present ? data.id.value : this.id,
      roleContextId: data.roleContextId.present
          ? data.roleContextId.value
          : this.roleContextId,
      cadence: data.cadence.present ? data.cadence.value : this.cadence,
      date: data.date.present ? data.date.value : this.date,
      progressPercent: data.progressPercent.present
          ? data.progressPercent.value
          : this.progressPercent,
      blockers: data.blockers.present ? data.blockers.value : this.blockers,
      lessons: data.lessons.present ? data.lessons.value : this.lessons,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckIn(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('cadence: $cadence, ')
          ..write('date: $date, ')
          ..write('progressPercent: $progressPercent, ')
          ..write('blockers: $blockers, ')
          ..write('lessons: $lessons, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roleContextId,
    cadence,
    date,
    progressPercent,
    blockers,
    lessons,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckIn &&
          other.id == this.id &&
          other.roleContextId == this.roleContextId &&
          other.cadence == this.cadence &&
          other.date == this.date &&
          other.progressPercent == this.progressPercent &&
          other.blockers == this.blockers &&
          other.lessons == this.lessons &&
          other.updatedAt == this.updatedAt);
}

class CheckInsCompanion extends UpdateCompanion<CheckIn> {
  final Value<int> id;
  final Value<int?> roleContextId;
  final Value<String> cadence;
  final Value<DateTime> date;
  final Value<int> progressPercent;
  final Value<String> blockers;
  final Value<String> lessons;
  final Value<DateTime> updatedAt;
  const CheckInsCompanion({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    this.cadence = const Value.absent(),
    this.date = const Value.absent(),
    this.progressPercent = const Value.absent(),
    this.blockers = const Value.absent(),
    this.lessons = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CheckInsCompanion.insert({
    this.id = const Value.absent(),
    this.roleContextId = const Value.absent(),
    this.cadence = const Value.absent(),
    required DateTime date,
    this.progressPercent = const Value.absent(),
    this.blockers = const Value.absent(),
    this.lessons = const Value.absent(),
    required DateTime updatedAt,
  }) : date = Value(date),
       updatedAt = Value(updatedAt);
  static Insertable<CheckIn> custom({
    Expression<int>? id,
    Expression<int>? roleContextId,
    Expression<String>? cadence,
    Expression<DateTime>? date,
    Expression<int>? progressPercent,
    Expression<String>? blockers,
    Expression<String>? lessons,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roleContextId != null) 'role_context_id': roleContextId,
      if (cadence != null) 'cadence': cadence,
      if (date != null) 'date': date,
      if (progressPercent != null) 'progress_percent': progressPercent,
      if (blockers != null) 'blockers': blockers,
      if (lessons != null) 'lessons': lessons,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CheckInsCompanion copyWith({
    Value<int>? id,
    Value<int?>? roleContextId,
    Value<String>? cadence,
    Value<DateTime>? date,
    Value<int>? progressPercent,
    Value<String>? blockers,
    Value<String>? lessons,
    Value<DateTime>? updatedAt,
  }) {
    return CheckInsCompanion(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      cadence: cadence ?? this.cadence,
      date: date ?? this.date,
      progressPercent: progressPercent ?? this.progressPercent,
      blockers: blockers ?? this.blockers,
      lessons: lessons ?? this.lessons,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roleContextId.present) {
      map['role_context_id'] = Variable<int>(roleContextId.value);
    }
    if (cadence.present) {
      map['cadence'] = Variable<String>(cadence.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (progressPercent.present) {
      map['progress_percent'] = Variable<int>(progressPercent.value);
    }
    if (blockers.present) {
      map['blockers'] = Variable<String>(blockers.value);
    }
    if (lessons.present) {
      map['lessons'] = Variable<String>(lessons.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckInsCompanion(')
          ..write('id: $id, ')
          ..write('roleContextId: $roleContextId, ')
          ..write('cadence: $cadence, ')
          ..write('date: $date, ')
          ..write('progressPercent: $progressPercent, ')
          ..write('blockers: $blockers, ')
          ..write('lessons: $lessons, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _cadenceMeta = const VerificationMeta(
    'cadence',
  );
  @override
  late final GeneratedColumn<String> cadence = GeneratedColumn<String>(
    'cadence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('daily'),
  );
  static const VerificationMeta _hourMeta = const VerificationMeta('hour');
  @override
  late final GeneratedColumn<int> hour = GeneratedColumn<int>(
    'hour',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(9),
  );
  static const VerificationMeta _minuteMeta = const VerificationMeta('minute');
  @override
  late final GeneratedColumn<int> minute = GeneratedColumn<int>(
    'minute',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    cadence,
    hour,
    minute,
    weekday,
    channel,
    isEnabled,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('cadence')) {
      context.handle(
        _cadenceMeta,
        cadence.isAcceptableOrUnknown(data['cadence']!, _cadenceMeta),
      );
    }
    if (data.containsKey('hour')) {
      context.handle(
        _hourMeta,
        hour.isAcceptableOrUnknown(data['hour']!, _hourMeta),
      );
    }
    if (data.containsKey('minute')) {
      context.handle(
        _minuteMeta,
        minute.isAcceptableOrUnknown(data['minute']!, _minuteMeta),
      );
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      cadence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cadence'],
      )!,
      hour: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hour'],
      )!,
      minute: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minute'],
      )!,
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      ),
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final String title;
  final String body;
  final String cadence;
  final int hour;
  final int minute;
  final int? weekday;
  final String channel;
  final bool isEnabled;
  final DateTime updatedAt;
  const Reminder({
    required this.id,
    required this.title,
    required this.body,
    required this.cadence,
    required this.hour,
    required this.minute,
    this.weekday,
    required this.channel,
    required this.isEnabled,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['cadence'] = Variable<String>(cadence);
    map['hour'] = Variable<int>(hour);
    map['minute'] = Variable<int>(minute);
    if (!nullToAbsent || weekday != null) {
      map['weekday'] = Variable<int>(weekday);
    }
    map['channel'] = Variable<String>(channel);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      cadence: Value(cadence),
      hour: Value(hour),
      minute: Value(minute),
      weekday: weekday == null && nullToAbsent
          ? const Value.absent()
          : Value(weekday),
      channel: Value(channel),
      isEnabled: Value(isEnabled),
      updatedAt: Value(updatedAt),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      cadence: serializer.fromJson<String>(json['cadence']),
      hour: serializer.fromJson<int>(json['hour']),
      minute: serializer.fromJson<int>(json['minute']),
      weekday: serializer.fromJson<int?>(json['weekday']),
      channel: serializer.fromJson<String>(json['channel']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'cadence': serializer.toJson<String>(cadence),
      'hour': serializer.toJson<int>(hour),
      'minute': serializer.toJson<int>(minute),
      'weekday': serializer.toJson<int?>(weekday),
      'channel': serializer.toJson<String>(channel),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Reminder copyWith({
    int? id,
    String? title,
    String? body,
    String? cadence,
    int? hour,
    int? minute,
    Value<int?> weekday = const Value.absent(),
    String? channel,
    bool? isEnabled,
    DateTime? updatedAt,
  }) => Reminder(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    cadence: cadence ?? this.cadence,
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
    weekday: weekday.present ? weekday.value : this.weekday,
    channel: channel ?? this.channel,
    isEnabled: isEnabled ?? this.isEnabled,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      cadence: data.cadence.present ? data.cadence.value : this.cadence,
      hour: data.hour.present ? data.hour.value : this.hour,
      minute: data.minute.present ? data.minute.value : this.minute,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      channel: data.channel.present ? data.channel.value : this.channel,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('cadence: $cadence, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute, ')
          ..write('weekday: $weekday, ')
          ..write('channel: $channel, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    body,
    cadence,
    hour,
    minute,
    weekday,
    channel,
    isEnabled,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.cadence == this.cadence &&
          other.hour == this.hour &&
          other.minute == this.minute &&
          other.weekday == this.weekday &&
          other.channel == this.channel &&
          other.isEnabled == this.isEnabled &&
          other.updatedAt == this.updatedAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<String> cadence;
  final Value<int> hour;
  final Value<int> minute;
  final Value<int?> weekday;
  final Value<String> channel;
  final Value<bool> isEnabled;
  final Value<DateTime> updatedAt;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.cadence = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
    this.weekday = const Value.absent(),
    this.channel = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.body = const Value.absent(),
    this.cadence = const Value.absent(),
    this.hour = const Value.absent(),
    this.minute = const Value.absent(),
    this.weekday = const Value.absent(),
    this.channel = const Value.absent(),
    this.isEnabled = const Value.absent(),
    required DateTime updatedAt,
  }) : title = Value(title),
       updatedAt = Value(updatedAt);
  static Insertable<Reminder> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? cadence,
    Expression<int>? hour,
    Expression<int>? minute,
    Expression<int>? weekday,
    Expression<String>? channel,
    Expression<bool>? isEnabled,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (cadence != null) 'cadence': cadence,
      if (hour != null) 'hour': hour,
      if (minute != null) 'minute': minute,
      if (weekday != null) 'weekday': weekday,
      if (channel != null) 'channel': channel,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  RemindersCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? body,
    Value<String>? cadence,
    Value<int>? hour,
    Value<int>? minute,
    Value<int?>? weekday,
    Value<String>? channel,
    Value<bool>? isEnabled,
    Value<DateTime>? updatedAt,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      cadence: cadence ?? this.cadence,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      weekday: weekday ?? this.weekday,
      channel: channel ?? this.channel,
      isEnabled: isEnabled ?? this.isEnabled,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (cadence.present) {
      map['cadence'] = Variable<String>(cadence.value);
    }
    if (hour.present) {
      map['hour'] = Variable<int>(hour.value);
    }
    if (minute.present) {
      map['minute'] = Variable<int>(minute.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('cadence: $cadence, ')
          ..write('hour: $hour, ')
          ..write('minute: $minute, ')
          ..write('weekday: $weekday, ')
          ..write('channel: $channel, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PartnerAccountsTable extends PartnerAccounts
    with TableInfo<$PartnerAccountsTable, PartnerAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnerAccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accessLevelMeta = const VerificationMeta(
    'accessLevel',
  );
  @override
  late final GeneratedColumn<String> accessLevel = GeneratedColumn<String>(
    'access_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('read'),
  );
  static const VerificationMeta _reportScheduleMeta = const VerificationMeta(
    'reportSchedule',
  );
  @override
  late final GeneratedColumn<String> reportSchedule = GeneratedColumn<String>(
    'report_schedule',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('weekly'),
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    email,
    accessLevel,
    reportSchedule,
    isEnabled,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partner_accounts';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartnerAccount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('access_level')) {
      context.handle(
        _accessLevelMeta,
        accessLevel.isAcceptableOrUnknown(
          data['access_level']!,
          _accessLevelMeta,
        ),
      );
    }
    if (data.containsKey('report_schedule')) {
      context.handle(
        _reportScheduleMeta,
        reportSchedule.isAcceptableOrUnknown(
          data['report_schedule']!,
          _reportScheduleMeta,
        ),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PartnerAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartnerAccount(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      accessLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}access_level'],
      )!,
      reportSchedule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}report_schedule'],
      )!,
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PartnerAccountsTable createAlias(String alias) {
    return $PartnerAccountsTable(attachedDatabase, alias);
  }
}

class PartnerAccount extends DataClass implements Insertable<PartnerAccount> {
  final int id;
  final String email;
  final String accessLevel;
  final String reportSchedule;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PartnerAccount({
    required this.id,
    required this.email,
    required this.accessLevel,
    required this.reportSchedule,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['access_level'] = Variable<String>(accessLevel);
    map['report_schedule'] = Variable<String>(reportSchedule);
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PartnerAccountsCompanion toCompanion(bool nullToAbsent) {
    return PartnerAccountsCompanion(
      id: Value(id),
      email: Value(email),
      accessLevel: Value(accessLevel),
      reportSchedule: Value(reportSchedule),
      isEnabled: Value(isEnabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PartnerAccount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartnerAccount(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      accessLevel: serializer.fromJson<String>(json['accessLevel']),
      reportSchedule: serializer.fromJson<String>(json['reportSchedule']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'accessLevel': serializer.toJson<String>(accessLevel),
      'reportSchedule': serializer.toJson<String>(reportSchedule),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PartnerAccount copyWith({
    int? id,
    String? email,
    String? accessLevel,
    String? reportSchedule,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PartnerAccount(
    id: id ?? this.id,
    email: email ?? this.email,
    accessLevel: accessLevel ?? this.accessLevel,
    reportSchedule: reportSchedule ?? this.reportSchedule,
    isEnabled: isEnabled ?? this.isEnabled,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PartnerAccount copyWithCompanion(PartnerAccountsCompanion data) {
    return PartnerAccount(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      accessLevel: data.accessLevel.present
          ? data.accessLevel.value
          : this.accessLevel,
      reportSchedule: data.reportSchedule.present
          ? data.reportSchedule.value
          : this.reportSchedule,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartnerAccount(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('accessLevel: $accessLevel, ')
          ..write('reportSchedule: $reportSchedule, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    email,
    accessLevel,
    reportSchedule,
    isEnabled,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartnerAccount &&
          other.id == this.id &&
          other.email == this.email &&
          other.accessLevel == this.accessLevel &&
          other.reportSchedule == this.reportSchedule &&
          other.isEnabled == this.isEnabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PartnerAccountsCompanion extends UpdateCompanion<PartnerAccount> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> accessLevel;
  final Value<String> reportSchedule;
  final Value<bool> isEnabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PartnerAccountsCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.accessLevel = const Value.absent(),
    this.reportSchedule = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PartnerAccountsCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    this.accessLevel = const Value.absent(),
    this.reportSchedule = const Value.absent(),
    this.isEnabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : email = Value(email),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PartnerAccount> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? accessLevel,
    Expression<String>? reportSchedule,
    Expression<bool>? isEnabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (accessLevel != null) 'access_level': accessLevel,
      if (reportSchedule != null) 'report_schedule': reportSchedule,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PartnerAccountsCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String>? accessLevel,
    Value<String>? reportSchedule,
    Value<bool>? isEnabled,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PartnerAccountsCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      accessLevel: accessLevel ?? this.accessLevel,
      reportSchedule: reportSchedule ?? this.reportSchedule,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (accessLevel.present) {
      map['access_level'] = Variable<String>(accessLevel.value);
    }
    if (reportSchedule.present) {
      map['report_schedule'] = Variable<String>(reportSchedule.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnerAccountsCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('accessLevel: $accessLevel, ')
          ..write('reportSchedule: $reportSchedule, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ActivityLogsTable extends ActivityLogs
    with TableInfo<$ActivityLogsTable, ActivityLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    actionType,
    entityType,
    entityId,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ActivityLogsTable createAlias(String alias) {
    return $ActivityLogsTable(attachedDatabase, alias);
  }
}

class ActivityLog extends DataClass implements Insertable<ActivityLog> {
  final int id;
  final String actionType;
  final String entityType;
  final int? entityId;
  final String status;
  final DateTime createdAt;
  const ActivityLog({
    required this.id,
    required this.actionType,
    required this.entityType,
    this.entityId,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['action_type'] = Variable<String>(actionType);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ActivityLogsCompanion toCompanion(bool nullToAbsent) {
    return ActivityLogsCompanion(
      id: Value(id),
      actionType: Value(actionType),
      entityType: Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ActivityLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityLog(
      id: serializer.fromJson<int>(json['id']),
      actionType: serializer.fromJson<String>(json['actionType']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int?>(json['entityId']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'actionType': serializer.toJson<String>(actionType),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int?>(entityId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ActivityLog copyWith({
    int? id,
    String? actionType,
    String? entityType,
    Value<int?> entityId = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => ActivityLog(
    id: id ?? this.id,
    actionType: actionType ?? this.actionType,
    entityType: entityType ?? this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  ActivityLog copyWithCompanion(ActivityLogsCompanion data) {
    return ActivityLog(
      id: data.id.present ? data.id.value : this.id,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityLog(')
          ..write('id: $id, ')
          ..write('actionType: $actionType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, actionType, entityType, entityId, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityLog &&
          other.id == this.id &&
          other.actionType == this.actionType &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ActivityLogsCompanion extends UpdateCompanion<ActivityLog> {
  final Value<int> id;
  final Value<String> actionType;
  final Value<String> entityType;
  final Value<int?> entityId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const ActivityLogsCompanion({
    this.id = const Value.absent(),
    this.actionType = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ActivityLogsCompanion.insert({
    this.id = const Value.absent(),
    required String actionType,
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime createdAt,
  }) : actionType = Value(actionType),
       createdAt = Value(createdAt);
  static Insertable<ActivityLog> custom({
    Expression<int>? id,
    Expression<String>? actionType,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actionType != null) 'action_type': actionType,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ActivityLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? actionType,
    Value<String>? entityType,
    Value<int?>? entityId,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return ActivityLogsCompanion(
      id: id ?? this.id,
      actionType: actionType ?? this.actionType,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityLogsCompanion(')
          ..write('id: $id, ')
          ..write('actionType: $actionType, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, type, title, content, tags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<Template> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Template(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
    );
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(attachedDatabase, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final String type;
  final String title;
  final String content;
  final String tags;
  const Template({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.tags,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['tags'] = Variable<String>(tags);
    return map;
  }

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      content: Value(content),
      tags: Value(tags),
    );
  }

  factory Template.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Template(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      tags: serializer.fromJson<String>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'tags': serializer.toJson<String>(tags),
    };
  }

  Template copyWith({
    int? id,
    String? type,
    String? title,
    String? content,
    String? tags,
  }) => Template(
    id: id ?? this.id,
    type: type ?? this.type,
    title: title ?? this.title,
    content: content ?? this.content,
    tags: tags ?? this.tags,
  );
  Template copyWithCompanion(TemplatesCompanion data) {
    return Template(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Template(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, title, content, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Template &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.content == this.content &&
          other.tags == this.tags);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> content;
  final Value<String> tags;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required String title,
    required String content,
    this.tags = const Value.absent(),
  }) : type = Value(type),
       title = Value(title),
       content = Value(content);
  static Insertable<Template> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? tags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (tags != null) 'tags': tags,
    });
  }

  TemplatesCompanion copyWith({
    Value<int>? id,
    Value<String>? type,
    Value<String>? title,
    Value<String>? content,
    Value<String>? tags,
  }) {
    return TemplatesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      tags: tags ?? this.tags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }
}

class $ExportReportsTable extends ExportReports
    with TableInfo<$ExportReportsTable, ExportReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExportReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<String> period = GeneratedColumn<String>(
    'period',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
    'format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pdf'),
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    period,
    format,
    filePath,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'export_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExportReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('period')) {
      context.handle(
        _periodMeta,
        period.isAcceptableOrUnknown(data['period']!, _periodMeta),
      );
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    if (data.containsKey('format')) {
      context.handle(
        _formatMeta,
        format.isAcceptableOrUnknown(data['format']!, _formatMeta),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExportReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExportReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      period: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period'],
      )!,
      format: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExportReportsTable createAlias(String alias) {
    return $ExportReportsTable(attachedDatabase, alias);
  }
}

class ExportReport extends DataClass implements Insertable<ExportReport> {
  final int id;
  final String period;
  final String format;
  final String filePath;
  final DateTime createdAt;
  const ExportReport({
    required this.id,
    required this.period,
    required this.format,
    required this.filePath,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['period'] = Variable<String>(period);
    map['format'] = Variable<String>(format);
    map['file_path'] = Variable<String>(filePath);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExportReportsCompanion toCompanion(bool nullToAbsent) {
    return ExportReportsCompanion(
      id: Value(id),
      period: Value(period),
      format: Value(format),
      filePath: Value(filePath),
      createdAt: Value(createdAt),
    );
  }

  factory ExportReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExportReport(
      id: serializer.fromJson<int>(json['id']),
      period: serializer.fromJson<String>(json['period']),
      format: serializer.fromJson<String>(json['format']),
      filePath: serializer.fromJson<String>(json['filePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'period': serializer.toJson<String>(period),
      'format': serializer.toJson<String>(format),
      'filePath': serializer.toJson<String>(filePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExportReport copyWith({
    int? id,
    String? period,
    String? format,
    String? filePath,
    DateTime? createdAt,
  }) => ExportReport(
    id: id ?? this.id,
    period: period ?? this.period,
    format: format ?? this.format,
    filePath: filePath ?? this.filePath,
    createdAt: createdAt ?? this.createdAt,
  );
  ExportReport copyWithCompanion(ExportReportsCompanion data) {
    return ExportReport(
      id: data.id.present ? data.id.value : this.id,
      period: data.period.present ? data.period.value : this.period,
      format: data.format.present ? data.format.value : this.format,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExportReport(')
          ..write('id: $id, ')
          ..write('period: $period, ')
          ..write('format: $format, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, period, format, filePath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportReport &&
          other.id == this.id &&
          other.period == this.period &&
          other.format == this.format &&
          other.filePath == this.filePath &&
          other.createdAt == this.createdAt);
}

class ExportReportsCompanion extends UpdateCompanion<ExportReport> {
  final Value<int> id;
  final Value<String> period;
  final Value<String> format;
  final Value<String> filePath;
  final Value<DateTime> createdAt;
  const ExportReportsCompanion({
    this.id = const Value.absent(),
    this.period = const Value.absent(),
    this.format = const Value.absent(),
    this.filePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExportReportsCompanion.insert({
    this.id = const Value.absent(),
    required String period,
    this.format = const Value.absent(),
    required String filePath,
    required DateTime createdAt,
  }) : period = Value(period),
       filePath = Value(filePath),
       createdAt = Value(createdAt);
  static Insertable<ExportReport> custom({
    Expression<int>? id,
    Expression<String>? period,
    Expression<String>? format,
    Expression<String>? filePath,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (period != null) 'period': period,
      if (format != null) 'format': format,
      if (filePath != null) 'file_path': filePath,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExportReportsCompanion copyWith({
    Value<int>? id,
    Value<String>? period,
    Value<String>? format,
    Value<String>? filePath,
    Value<DateTime>? createdAt,
  }) {
    return ExportReportsCompanion(
      id: id ?? this.id,
      period: period ?? this.period,
      format: format ?? this.format,
      filePath: filePath ?? this.filePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (period.present) {
      map['period'] = Variable<String>(period.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExportReportsCompanion(')
          ..write('id: $id, ')
          ..write('period: $period, ')
          ..write('format: $format, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $RoleContextsTable roleContexts = $RoleContextsTable(this);
  late final $NorthStarsTable northStars = $NorthStarsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $ActionItemsTable actionItems = $ActionItemsTable(this);
  late final $CheckInsTable checkIns = $CheckInsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $PartnerAccountsTable partnerAccounts = $PartnerAccountsTable(
    this,
  );
  late final $ActivityLogsTable activityLogs = $ActivityLogsTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  late final $ExportReportsTable exportReports = $ExportReportsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    roleContexts,
    northStars,
    goals,
    actionItems,
    checkIns,
    reminders,
    partnerAccounts,
    activityLogs,
    templates,
    exportReports,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      required String role,
      Value<String> scope,
      Value<String> vision,
      Value<String> responsibility,
      Value<String> mission,
      Value<String> kpis,
      Value<String> stakeholders,
      Value<String> values,
      required DateTime updatedAt,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String> role,
      Value<String> scope,
      Value<String> vision,
      Value<String> responsibility,
      Value<String> mission,
      Value<String> kpis,
      Value<String> stakeholders,
      Value<String> values,
      Value<DateTime> updatedAt,
    });

final class $$ProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $ProfilesTable, Profile> {
  $$ProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RoleContextsTable, List<RoleContext>>
  _roleContextsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.roleContexts,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.roleContexts.profileId),
  );

  $$RoleContextsTableProcessedTableManager get roleContextsRefs {
    final manager = $$RoleContextsTableTableManager(
      $_db,
      $_db.roleContexts,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roleContextsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vision => $composableBuilder(
    column: $table.vision,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responsibility => $composableBuilder(
    column: $table.responsibility,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mission => $composableBuilder(
    column: $table.mission,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kpis => $composableBuilder(
    column: $table.kpis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stakeholders => $composableBuilder(
    column: $table.stakeholders,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get values => $composableBuilder(
    column: $table.values,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> roleContextsRefs(
    Expression<bool> Function($$RoleContextsTableFilterComposer f) f,
  ) {
    final $$RoleContextsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableFilterComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vision => $composableBuilder(
    column: $table.vision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responsibility => $composableBuilder(
    column: $table.responsibility,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mission => $composableBuilder(
    column: $table.mission,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kpis => $composableBuilder(
    column: $table.kpis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stakeholders => $composableBuilder(
    column: $table.stakeholders,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get values => $composableBuilder(
    column: $table.values,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get vision =>
      $composableBuilder(column: $table.vision, builder: (column) => column);

  GeneratedColumn<String> get responsibility => $composableBuilder(
    column: $table.responsibility,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mission =>
      $composableBuilder(column: $table.mission, builder: (column) => column);

  GeneratedColumn<String> get kpis =>
      $composableBuilder(column: $table.kpis, builder: (column) => column);

  GeneratedColumn<String> get stakeholders => $composableBuilder(
    column: $table.stakeholders,
    builder: (column) => column,
  );

  GeneratedColumn<String> get values =>
      $composableBuilder(column: $table.values, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> roleContextsRefs<T extends Object>(
    Expression<T> Function($$RoleContextsTableAnnotationComposer a) f,
  ) {
    final $$RoleContextsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableAnnotationComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, $$ProfilesTableReferences),
          Profile,
          PrefetchHooks Function({bool roleContextsRefs})
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<String> vision = const Value.absent(),
                Value<String> responsibility = const Value.absent(),
                Value<String> mission = const Value.absent(),
                Value<String> kpis = const Value.absent(),
                Value<String> stakeholders = const Value.absent(),
                Value<String> values = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                role: role,
                scope: scope,
                vision: vision,
                responsibility: responsibility,
                mission: mission,
                kpis: kpis,
                stakeholders: stakeholders,
                values: values,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String role,
                Value<String> scope = const Value.absent(),
                Value<String> vision = const Value.absent(),
                Value<String> responsibility = const Value.absent(),
                Value<String> mission = const Value.absent(),
                Value<String> kpis = const Value.absent(),
                Value<String> stakeholders = const Value.absent(),
                Value<String> values = const Value.absent(),
                required DateTime updatedAt,
              }) => ProfilesCompanion.insert(
                id: id,
                role: role,
                scope: scope,
                vision: vision,
                responsibility: responsibility,
                mission: mission,
                kpis: kpis,
                stakeholders: stakeholders,
                values: values,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roleContextsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (roleContextsRefs) db.roleContexts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roleContextsRefs)
                    await $_getPrefetchedData<
                      Profile,
                      $ProfilesTable,
                      RoleContext
                    >(
                      currentTable: table,
                      referencedTable: $$ProfilesTableReferences
                          ._roleContextsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProfilesTableReferences(
                        db,
                        table,
                        p0,
                      ).roleContextsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.profileId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, $$ProfilesTableReferences),
      Profile,
      PrefetchHooks Function({bool roleContextsRefs})
    >;
typedef $$RoleContextsTableCreateCompanionBuilder =
    RoleContextsCompanion Function({
      Value<int> id,
      required int profileId,
      required String name,
      Value<String> description,
      Value<bool> isActive,
      required DateTime updatedAt,
    });
typedef $$RoleContextsTableUpdateCompanionBuilder =
    RoleContextsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> name,
      Value<String> description,
      Value<bool> isActive,
      Value<DateTime> updatedAt,
    });

final class $$RoleContextsTableReferences
    extends BaseReferences<_$AppDatabase, $RoleContextsTable, RoleContext> {
  $$RoleContextsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.roleContexts.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$NorthStarsTable, List<NorthStar>>
  _northStarsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.northStars,
    aliasName: $_aliasNameGenerator(
      db.roleContexts.id,
      db.northStars.roleContextId,
    ),
  );

  $$NorthStarsTableProcessedTableManager get northStarsRefs {
    final manager = $$NorthStarsTableTableManager(
      $_db,
      $_db.northStars,
    ).filter((f) => f.roleContextId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_northStarsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goals,
    aliasName: $_aliasNameGenerator(db.roleContexts.id, db.goals.roleContextId),
  );

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.roleContextId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CheckInsTable, List<CheckIn>> _checkInsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.checkIns,
    aliasName: $_aliasNameGenerator(
      db.roleContexts.id,
      db.checkIns.roleContextId,
    ),
  );

  $$CheckInsTableProcessedTableManager get checkInsRefs {
    final manager = $$CheckInsTableTableManager(
      $_db,
      $_db.checkIns,
    ).filter((f) => f.roleContextId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_checkInsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoleContextsTableFilterComposer
    extends Composer<_$AppDatabase, $RoleContextsTable> {
  $$RoleContextsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> northStarsRefs(
    Expression<bool> Function($$NorthStarsTableFilterComposer f) f,
  ) {
    final $$NorthStarsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.northStars,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NorthStarsTableFilterComposer(
            $db: $db,
            $table: $db.northStars,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> goalsRefs(
    Expression<bool> Function($$GoalsTableFilterComposer f) f,
  ) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> checkInsRefs(
    Expression<bool> Function($$CheckInsTableFilterComposer f) f,
  ) {
    final $$CheckInsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableFilterComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoleContextsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoleContextsTable> {
  $$RoleContextsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RoleContextsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoleContextsTable> {
  $$RoleContextsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> northStarsRefs<T extends Object>(
    Expression<T> Function($$NorthStarsTableAnnotationComposer a) f,
  ) {
    final $$NorthStarsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.northStars,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NorthStarsTableAnnotationComposer(
            $db: $db,
            $table: $db.northStars,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> goalsRefs<T extends Object>(
    Expression<T> Function($$GoalsTableAnnotationComposer a) f,
  ) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> checkInsRefs<T extends Object>(
    Expression<T> Function($$CheckInsTableAnnotationComposer a) f,
  ) {
    final $$CheckInsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.checkIns,
      getReferencedColumn: (t) => t.roleContextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CheckInsTableAnnotationComposer(
            $db: $db,
            $table: $db.checkIns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoleContextsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoleContextsTable,
          RoleContext,
          $$RoleContextsTableFilterComposer,
          $$RoleContextsTableOrderingComposer,
          $$RoleContextsTableAnnotationComposer,
          $$RoleContextsTableCreateCompanionBuilder,
          $$RoleContextsTableUpdateCompanionBuilder,
          (RoleContext, $$RoleContextsTableReferences),
          RoleContext,
          PrefetchHooks Function({
            bool profileId,
            bool northStarsRefs,
            bool goalsRefs,
            bool checkInsRefs,
          })
        > {
  $$RoleContextsTableTableManager(_$AppDatabase db, $RoleContextsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoleContextsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoleContextsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoleContextsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RoleContextsCompanion(
                id: id,
                profileId: profileId,
                name: name,
                description: description,
                isActive: isActive,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String name,
                Value<String> description = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime updatedAt,
              }) => RoleContextsCompanion.insert(
                id: id,
                profileId: profileId,
                name: name,
                description: description,
                isActive: isActive,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoleContextsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                profileId = false,
                northStarsRefs = false,
                goalsRefs = false,
                checkInsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (northStarsRefs) db.northStars,
                    if (goalsRefs) db.goals,
                    if (checkInsRefs) db.checkIns,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (profileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.profileId,
                                    referencedTable:
                                        $$RoleContextsTableReferences
                                            ._profileIdTable(db),
                                    referencedColumn:
                                        $$RoleContextsTableReferences
                                            ._profileIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (northStarsRefs)
                        await $_getPrefetchedData<
                          RoleContext,
                          $RoleContextsTable,
                          NorthStar
                        >(
                          currentTable: table,
                          referencedTable: $$RoleContextsTableReferences
                              ._northStarsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoleContextsTableReferences(
                                db,
                                table,
                                p0,
                              ).northStarsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roleContextId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (goalsRefs)
                        await $_getPrefetchedData<
                          RoleContext,
                          $RoleContextsTable,
                          Goal
                        >(
                          currentTable: table,
                          referencedTable: $$RoleContextsTableReferences
                              ._goalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoleContextsTableReferences(
                                db,
                                table,
                                p0,
                              ).goalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roleContextId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (checkInsRefs)
                        await $_getPrefetchedData<
                          RoleContext,
                          $RoleContextsTable,
                          CheckIn
                        >(
                          currentTable: table,
                          referencedTable: $$RoleContextsTableReferences
                              ._checkInsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoleContextsTableReferences(
                                db,
                                table,
                                p0,
                              ).checkInsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roleContextId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoleContextsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoleContextsTable,
      RoleContext,
      $$RoleContextsTableFilterComposer,
      $$RoleContextsTableOrderingComposer,
      $$RoleContextsTableAnnotationComposer,
      $$RoleContextsTableCreateCompanionBuilder,
      $$RoleContextsTableUpdateCompanionBuilder,
      (RoleContext, $$RoleContextsTableReferences),
      RoleContext,
      PrefetchHooks Function({
        bool profileId,
        bool northStarsRefs,
        bool goalsRefs,
        bool checkInsRefs,
      })
    >;
typedef $$NorthStarsTableCreateCompanionBuilder =
    NorthStarsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      required String title,
      Value<String> description,
      Value<String> horizon,
      Value<String> keyword,
      Value<String> emotion,
      Value<String?> imagePath,
      required DateTime updatedAt,
    });
typedef $$NorthStarsTableUpdateCompanionBuilder =
    NorthStarsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      Value<String> title,
      Value<String> description,
      Value<String> horizon,
      Value<String> keyword,
      Value<String> emotion,
      Value<String?> imagePath,
      Value<DateTime> updatedAt,
    });

final class $$NorthStarsTableReferences
    extends BaseReferences<_$AppDatabase, $NorthStarsTable, NorthStar> {
  $$NorthStarsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoleContextsTable _roleContextIdTable(_$AppDatabase db) =>
      db.roleContexts.createAlias(
        $_aliasNameGenerator(db.northStars.roleContextId, db.roleContexts.id),
      );

  $$RoleContextsTableProcessedTableManager? get roleContextId {
    final $_column = $_itemColumn<int>('role_context_id');
    if ($_column == null) return null;
    final manager = $$RoleContextsTableTableManager(
      $_db,
      $_db.roleContexts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleContextIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GoalsTable, List<Goal>> _goalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goals,
    aliasName: $_aliasNameGenerator(db.northStars.id, db.goals.northStarId),
  );

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.northStarId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NorthStarsTableFilterComposer
    extends Composer<_$AppDatabase, $NorthStarsTable> {
  $$NorthStarsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RoleContextsTableFilterComposer get roleContextId {
    final $$RoleContextsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableFilterComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> goalsRefs(
    Expression<bool> Function($$GoalsTableFilterComposer f) f,
  ) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.northStarId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NorthStarsTableOrderingComposer
    extends Composer<_$AppDatabase, $NorthStarsTable> {
  $$NorthStarsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get horizon => $composableBuilder(
    column: $table.horizon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyword => $composableBuilder(
    column: $table.keyword,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emotion => $composableBuilder(
    column: $table.emotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoleContextsTableOrderingComposer get roleContextId {
    final $$RoleContextsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableOrderingComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NorthStarsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NorthStarsTable> {
  $$NorthStarsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get horizon =>
      $composableBuilder(column: $table.horizon, builder: (column) => column);

  GeneratedColumn<String> get keyword =>
      $composableBuilder(column: $table.keyword, builder: (column) => column);

  GeneratedColumn<String> get emotion =>
      $composableBuilder(column: $table.emotion, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RoleContextsTableAnnotationComposer get roleContextId {
    final $$RoleContextsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableAnnotationComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> goalsRefs<T extends Object>(
    Expression<T> Function($$GoalsTableAnnotationComposer a) f,
  ) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.northStarId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NorthStarsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NorthStarsTable,
          NorthStar,
          $$NorthStarsTableFilterComposer,
          $$NorthStarsTableOrderingComposer,
          $$NorthStarsTableAnnotationComposer,
          $$NorthStarsTableCreateCompanionBuilder,
          $$NorthStarsTableUpdateCompanionBuilder,
          (NorthStar, $$NorthStarsTableReferences),
          NorthStar,
          PrefetchHooks Function({bool roleContextId, bool goalsRefs})
        > {
  $$NorthStarsTableTableManager(_$AppDatabase db, $NorthStarsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NorthStarsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NorthStarsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NorthStarsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> horizon = const Value.absent(),
                Value<String> keyword = const Value.absent(),
                Value<String> emotion = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => NorthStarsCompanion(
                id: id,
                roleContextId: roleContextId,
                title: title,
                description: description,
                horizon: horizon,
                keyword: keyword,
                emotion: emotion,
                imagePath: imagePath,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                required String title,
                Value<String> description = const Value.absent(),
                Value<String> horizon = const Value.absent(),
                Value<String> keyword = const Value.absent(),
                Value<String> emotion = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                required DateTime updatedAt,
              }) => NorthStarsCompanion.insert(
                id: id,
                roleContextId: roleContextId,
                title: title,
                description: description,
                horizon: horizon,
                keyword: keyword,
                emotion: emotion,
                imagePath: imagePath,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NorthStarsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roleContextId = false, goalsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalsRefs) db.goals],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roleContextId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roleContextId,
                                referencedTable: $$NorthStarsTableReferences
                                    ._roleContextIdTable(db),
                                referencedColumn: $$NorthStarsTableReferences
                                    ._roleContextIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalsRefs)
                    await $_getPrefetchedData<
                      NorthStar,
                      $NorthStarsTable,
                      Goal
                    >(
                      currentTable: table,
                      referencedTable: $$NorthStarsTableReferences
                          ._goalsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$NorthStarsTableReferences(db, table, p0).goalsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.northStarId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NorthStarsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NorthStarsTable,
      NorthStar,
      $$NorthStarsTableFilterComposer,
      $$NorthStarsTableOrderingComposer,
      $$NorthStarsTableAnnotationComposer,
      $$NorthStarsTableCreateCompanionBuilder,
      $$NorthStarsTableUpdateCompanionBuilder,
      (NorthStar, $$NorthStarsTableReferences),
      NorthStar,
      PrefetchHooks Function({bool roleContextId, bool goalsRefs})
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      Value<int?> northStarId,
      required String title,
      Value<String> priority,
      Value<String> status,
      Value<String> growGoal,
      Value<String> growReality,
      Value<String> growOptions,
      Value<String> growWayForward,
      Value<String> smartSpecific,
      Value<String> smartMeasurable,
      Value<String> smartAchievable,
      Value<String> smartRelevant,
      Value<String> smartTimeBound,
      Value<DateTime?> deadline,
      Value<String> resources,
      Value<String> obstacles,
      required DateTime updatedAt,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      Value<int?> northStarId,
      Value<String> title,
      Value<String> priority,
      Value<String> status,
      Value<String> growGoal,
      Value<String> growReality,
      Value<String> growOptions,
      Value<String> growWayForward,
      Value<String> smartSpecific,
      Value<String> smartMeasurable,
      Value<String> smartAchievable,
      Value<String> smartRelevant,
      Value<String> smartTimeBound,
      Value<DateTime?> deadline,
      Value<String> resources,
      Value<String> obstacles,
      Value<DateTime> updatedAt,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoleContextsTable _roleContextIdTable(_$AppDatabase db) =>
      db.roleContexts.createAlias(
        $_aliasNameGenerator(db.goals.roleContextId, db.roleContexts.id),
      );

  $$RoleContextsTableProcessedTableManager? get roleContextId {
    final $_column = $_itemColumn<int>('role_context_id');
    if ($_column == null) return null;
    final manager = $$RoleContextsTableTableManager(
      $_db,
      $_db.roleContexts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleContextIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $NorthStarsTable _northStarIdTable(_$AppDatabase db) =>
      db.northStars.createAlias(
        $_aliasNameGenerator(db.goals.northStarId, db.northStars.id),
      );

  $$NorthStarsTableProcessedTableManager? get northStarId {
    final $_column = $_itemColumn<int>('north_star_id');
    if ($_column == null) return null;
    final manager = $$NorthStarsTableTableManager(
      $_db,
      $_db.northStars,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_northStarIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ActionItemsTable, List<ActionItem>>
  _actionItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.actionItems,
    aliasName: $_aliasNameGenerator(db.goals.id, db.actionItems.goalId),
  );

  $$ActionItemsTableProcessedTableManager get actionItemsRefs {
    final manager = $$ActionItemsTableTableManager(
      $_db,
      $_db.actionItems,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_actionItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get growGoal => $composableBuilder(
    column: $table.growGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get growReality => $composableBuilder(
    column: $table.growReality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get growOptions => $composableBuilder(
    column: $table.growOptions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get growWayForward => $composableBuilder(
    column: $table.growWayForward,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smartSpecific => $composableBuilder(
    column: $table.smartSpecific,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smartMeasurable => $composableBuilder(
    column: $table.smartMeasurable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smartAchievable => $composableBuilder(
    column: $table.smartAchievable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smartRelevant => $composableBuilder(
    column: $table.smartRelevant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get smartTimeBound => $composableBuilder(
    column: $table.smartTimeBound,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resources => $composableBuilder(
    column: $table.resources,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get obstacles => $composableBuilder(
    column: $table.obstacles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RoleContextsTableFilterComposer get roleContextId {
    final $$RoleContextsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableFilterComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NorthStarsTableFilterComposer get northStarId {
    final $$NorthStarsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.northStarId,
      referencedTable: $db.northStars,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NorthStarsTableFilterComposer(
            $db: $db,
            $table: $db.northStars,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> actionItemsRefs(
    Expression<bool> Function($$ActionItemsTableFilterComposer f) f,
  ) {
    final $$ActionItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionItems,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionItemsTableFilterComposer(
            $db: $db,
            $table: $db.actionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get priority => $composableBuilder(
    column: $table.priority,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get growGoal => $composableBuilder(
    column: $table.growGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get growReality => $composableBuilder(
    column: $table.growReality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get growOptions => $composableBuilder(
    column: $table.growOptions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get growWayForward => $composableBuilder(
    column: $table.growWayForward,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smartSpecific => $composableBuilder(
    column: $table.smartSpecific,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smartMeasurable => $composableBuilder(
    column: $table.smartMeasurable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smartAchievable => $composableBuilder(
    column: $table.smartAchievable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smartRelevant => $composableBuilder(
    column: $table.smartRelevant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get smartTimeBound => $composableBuilder(
    column: $table.smartTimeBound,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resources => $composableBuilder(
    column: $table.resources,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get obstacles => $composableBuilder(
    column: $table.obstacles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoleContextsTableOrderingComposer get roleContextId {
    final $$RoleContextsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableOrderingComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NorthStarsTableOrderingComposer get northStarId {
    final $$NorthStarsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.northStarId,
      referencedTable: $db.northStars,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NorthStarsTableOrderingComposer(
            $db: $db,
            $table: $db.northStars,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get growGoal =>
      $composableBuilder(column: $table.growGoal, builder: (column) => column);

  GeneratedColumn<String> get growReality => $composableBuilder(
    column: $table.growReality,
    builder: (column) => column,
  );

  GeneratedColumn<String> get growOptions => $composableBuilder(
    column: $table.growOptions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get growWayForward => $composableBuilder(
    column: $table.growWayForward,
    builder: (column) => column,
  );

  GeneratedColumn<String> get smartSpecific => $composableBuilder(
    column: $table.smartSpecific,
    builder: (column) => column,
  );

  GeneratedColumn<String> get smartMeasurable => $composableBuilder(
    column: $table.smartMeasurable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get smartAchievable => $composableBuilder(
    column: $table.smartAchievable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get smartRelevant => $composableBuilder(
    column: $table.smartRelevant,
    builder: (column) => column,
  );

  GeneratedColumn<String> get smartTimeBound => $composableBuilder(
    column: $table.smartTimeBound,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumn<String> get resources =>
      $composableBuilder(column: $table.resources, builder: (column) => column);

  GeneratedColumn<String> get obstacles =>
      $composableBuilder(column: $table.obstacles, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RoleContextsTableAnnotationComposer get roleContextId {
    final $$RoleContextsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableAnnotationComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$NorthStarsTableAnnotationComposer get northStarId {
    final $$NorthStarsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.northStarId,
      referencedTable: $db.northStars,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NorthStarsTableAnnotationComposer(
            $db: $db,
            $table: $db.northStars,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> actionItemsRefs<T extends Object>(
    Expression<T> Function($$ActionItemsTableAnnotationComposer a) f,
  ) {
    final $$ActionItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.actionItems,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActionItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.actionItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, $$GoalsTableReferences),
          Goal,
          PrefetchHooks Function({
            bool roleContextId,
            bool northStarId,
            bool actionItemsRefs,
          })
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                Value<int?> northStarId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> growGoal = const Value.absent(),
                Value<String> growReality = const Value.absent(),
                Value<String> growOptions = const Value.absent(),
                Value<String> growWayForward = const Value.absent(),
                Value<String> smartSpecific = const Value.absent(),
                Value<String> smartMeasurable = const Value.absent(),
                Value<String> smartAchievable = const Value.absent(),
                Value<String> smartRelevant = const Value.absent(),
                Value<String> smartTimeBound = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String> resources = const Value.absent(),
                Value<String> obstacles = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                roleContextId: roleContextId,
                northStarId: northStarId,
                title: title,
                priority: priority,
                status: status,
                growGoal: growGoal,
                growReality: growReality,
                growOptions: growOptions,
                growWayForward: growWayForward,
                smartSpecific: smartSpecific,
                smartMeasurable: smartMeasurable,
                smartAchievable: smartAchievable,
                smartRelevant: smartRelevant,
                smartTimeBound: smartTimeBound,
                deadline: deadline,
                resources: resources,
                obstacles: obstacles,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                Value<int?> northStarId = const Value.absent(),
                required String title,
                Value<String> priority = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> growGoal = const Value.absent(),
                Value<String> growReality = const Value.absent(),
                Value<String> growOptions = const Value.absent(),
                Value<String> growWayForward = const Value.absent(),
                Value<String> smartSpecific = const Value.absent(),
                Value<String> smartMeasurable = const Value.absent(),
                Value<String> smartAchievable = const Value.absent(),
                Value<String> smartRelevant = const Value.absent(),
                Value<String> smartTimeBound = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<String> resources = const Value.absent(),
                Value<String> obstacles = const Value.absent(),
                required DateTime updatedAt,
              }) => GoalsCompanion.insert(
                id: id,
                roleContextId: roleContextId,
                northStarId: northStarId,
                title: title,
                priority: priority,
                status: status,
                growGoal: growGoal,
                growReality: growReality,
                growOptions: growOptions,
                growWayForward: growWayForward,
                smartSpecific: smartSpecific,
                smartMeasurable: smartMeasurable,
                smartAchievable: smartAchievable,
                smartRelevant: smartRelevant,
                smartTimeBound: smartTimeBound,
                deadline: deadline,
                resources: resources,
                obstacles: obstacles,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roleContextId = false,
                northStarId = false,
                actionItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (actionItemsRefs) db.actionItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roleContextId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roleContextId,
                                    referencedTable: $$GoalsTableReferences
                                        ._roleContextIdTable(db),
                                    referencedColumn: $$GoalsTableReferences
                                        ._roleContextIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (northStarId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.northStarId,
                                    referencedTable: $$GoalsTableReferences
                                        ._northStarIdTable(db),
                                    referencedColumn: $$GoalsTableReferences
                                        ._northStarIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (actionItemsRefs)
                        await $_getPrefetchedData<
                          Goal,
                          $GoalsTable,
                          ActionItem
                        >(
                          currentTable: table,
                          referencedTable: $$GoalsTableReferences
                              ._actionItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GoalsTableReferences(
                                db,
                                table,
                                p0,
                              ).actionItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.goalId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, $$GoalsTableReferences),
      Goal,
      PrefetchHooks Function({
        bool roleContextId,
        bool northStarId,
        bool actionItemsRefs,
      })
    >;
typedef $$ActionItemsTableCreateCompanionBuilder =
    ActionItemsCompanion Function({
      Value<int> id,
      required int goalId,
      required String title,
      Value<DateTime?> dueDate,
      Value<String> status,
      Value<String> blockers,
      required DateTime updatedAt,
    });
typedef $$ActionItemsTableUpdateCompanionBuilder =
    ActionItemsCompanion Function({
      Value<int> id,
      Value<int> goalId,
      Value<String> title,
      Value<DateTime?> dueDate,
      Value<String> status,
      Value<String> blockers,
      Value<DateTime> updatedAt,
    });

final class $$ActionItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ActionItemsTable, ActionItem> {
  $$ActionItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIdTable(_$AppDatabase db) => db.goals.createAlias(
    $_aliasNameGenerator(db.actionItems.goalId, db.goals.id),
  );

  $$GoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<int>('goal_id')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ActionItemsTable> {
  $$ActionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockers => $composableBuilder(
    column: $table.blockers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActionItemsTable> {
  $$ActionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockers => $composableBuilder(
    column: $table.blockers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActionItemsTable> {
  $$ActionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get blockers =>
      $composableBuilder(column: $table.blockers, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActionItemsTable,
          ActionItem,
          $$ActionItemsTableFilterComposer,
          $$ActionItemsTableOrderingComposer,
          $$ActionItemsTableAnnotationComposer,
          $$ActionItemsTableCreateCompanionBuilder,
          $$ActionItemsTableUpdateCompanionBuilder,
          (ActionItem, $$ActionItemsTableReferences),
          ActionItem,
          PrefetchHooks Function({bool goalId})
        > {
  $$ActionItemsTableTableManager(_$AppDatabase db, $ActionItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> goalId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> blockers = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ActionItemsCompanion(
                id: id,
                goalId: goalId,
                title: title,
                dueDate: dueDate,
                status: status,
                blockers: blockers,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int goalId,
                required String title,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> blockers = const Value.absent(),
                required DateTime updatedAt,
              }) => ActionItemsCompanion.insert(
                id: id,
                goalId: goalId,
                title: title,
                dueDate: dueDate,
                status: status,
                blockers: blockers,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActionItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalId,
                                referencedTable: $$ActionItemsTableReferences
                                    ._goalIdTable(db),
                                referencedColumn: $$ActionItemsTableReferences
                                    ._goalIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActionItemsTable,
      ActionItem,
      $$ActionItemsTableFilterComposer,
      $$ActionItemsTableOrderingComposer,
      $$ActionItemsTableAnnotationComposer,
      $$ActionItemsTableCreateCompanionBuilder,
      $$ActionItemsTableUpdateCompanionBuilder,
      (ActionItem, $$ActionItemsTableReferences),
      ActionItem,
      PrefetchHooks Function({bool goalId})
    >;
typedef $$CheckInsTableCreateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      Value<String> cadence,
      required DateTime date,
      Value<int> progressPercent,
      Value<String> blockers,
      Value<String> lessons,
      required DateTime updatedAt,
    });
typedef $$CheckInsTableUpdateCompanionBuilder =
    CheckInsCompanion Function({
      Value<int> id,
      Value<int?> roleContextId,
      Value<String> cadence,
      Value<DateTime> date,
      Value<int> progressPercent,
      Value<String> blockers,
      Value<String> lessons,
      Value<DateTime> updatedAt,
    });

final class $$CheckInsTableReferences
    extends BaseReferences<_$AppDatabase, $CheckInsTable, CheckIn> {
  $$CheckInsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoleContextsTable _roleContextIdTable(_$AppDatabase db) =>
      db.roleContexts.createAlias(
        $_aliasNameGenerator(db.checkIns.roleContextId, db.roleContexts.id),
      );

  $$RoleContextsTableProcessedTableManager? get roleContextId {
    final $_column = $_itemColumn<int>('role_context_id');
    if ($_column == null) return null;
    final manager = $$RoleContextsTableTableManager(
      $_db,
      $_db.roleContexts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleContextIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CheckInsTableFilterComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progressPercent => $composableBuilder(
    column: $table.progressPercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get blockers => $composableBuilder(
    column: $table.blockers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessons => $composableBuilder(
    column: $table.lessons,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RoleContextsTableFilterComposer get roleContextId {
    final $$RoleContextsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableFilterComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInsTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progressPercent => $composableBuilder(
    column: $table.progressPercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get blockers => $composableBuilder(
    column: $table.blockers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessons => $composableBuilder(
    column: $table.lessons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoleContextsTableOrderingComposer get roleContextId {
    final $$RoleContextsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableOrderingComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckInsTable> {
  $$CheckInsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cadence =>
      $composableBuilder(column: $table.cadence, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get progressPercent => $composableBuilder(
    column: $table.progressPercent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get blockers =>
      $composableBuilder(column: $table.blockers, builder: (column) => column);

  GeneratedColumn<String> get lessons =>
      $composableBuilder(column: $table.lessons, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RoleContextsTableAnnotationComposer get roleContextId {
    final $$RoleContextsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleContextId,
      referencedTable: $db.roleContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleContextsTableAnnotationComposer(
            $db: $db,
            $table: $db.roleContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CheckInsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CheckInsTable,
          CheckIn,
          $$CheckInsTableFilterComposer,
          $$CheckInsTableOrderingComposer,
          $$CheckInsTableAnnotationComposer,
          $$CheckInsTableCreateCompanionBuilder,
          $$CheckInsTableUpdateCompanionBuilder,
          (CheckIn, $$CheckInsTableReferences),
          CheckIn,
          PrefetchHooks Function({bool roleContextId})
        > {
  $$CheckInsTableTableManager(_$AppDatabase db, $CheckInsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckInsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckInsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckInsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                Value<String> cadence = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> progressPercent = const Value.absent(),
                Value<String> blockers = const Value.absent(),
                Value<String> lessons = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CheckInsCompanion(
                id: id,
                roleContextId: roleContextId,
                cadence: cadence,
                date: date,
                progressPercent: progressPercent,
                blockers: blockers,
                lessons: lessons,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> roleContextId = const Value.absent(),
                Value<String> cadence = const Value.absent(),
                required DateTime date,
                Value<int> progressPercent = const Value.absent(),
                Value<String> blockers = const Value.absent(),
                Value<String> lessons = const Value.absent(),
                required DateTime updatedAt,
              }) => CheckInsCompanion.insert(
                id: id,
                roleContextId: roleContextId,
                cadence: cadence,
                date: date,
                progressPercent: progressPercent,
                blockers: blockers,
                lessons: lessons,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CheckInsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({roleContextId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roleContextId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roleContextId,
                                referencedTable: $$CheckInsTableReferences
                                    ._roleContextIdTable(db),
                                referencedColumn: $$CheckInsTableReferences
                                    ._roleContextIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CheckInsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CheckInsTable,
      CheckIn,
      $$CheckInsTableFilterComposer,
      $$CheckInsTableOrderingComposer,
      $$CheckInsTableAnnotationComposer,
      $$CheckInsTableCreateCompanionBuilder,
      $$CheckInsTableUpdateCompanionBuilder,
      (CheckIn, $$CheckInsTableReferences),
      CheckIn,
      PrefetchHooks Function({bool roleContextId})
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      required String title,
      Value<String> body,
      Value<String> cadence,
      Value<int> hour,
      Value<int> minute,
      Value<int?> weekday,
      Value<String> channel,
      Value<bool> isEnabled,
      required DateTime updatedAt,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> body,
      Value<String> cadence,
      Value<int> hour,
      Value<int> minute,
      Value<int?> weekday,
      Value<String> channel,
      Value<bool> isEnabled,
      Value<DateTime> updatedAt,
    });

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cadence => $composableBuilder(
    column: $table.cadence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hour => $composableBuilder(
    column: $table.hour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minute => $composableBuilder(
    column: $table.minute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get cadence =>
      $composableBuilder(column: $table.cadence, builder: (column) => column);

  GeneratedColumn<int> get hour =>
      $composableBuilder(column: $table.hour, builder: (column) => column);

  GeneratedColumn<int> get minute =>
      $composableBuilder(column: $table.minute, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
          Reminder,
          PrefetchHooks Function()
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> cadence = const Value.absent(),
                Value<int> hour = const Value.absent(),
                Value<int> minute = const Value.absent(),
                Value<int?> weekday = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                title: title,
                body: body,
                cadence: cadence,
                hour: hour,
                minute: minute,
                weekday: weekday,
                channel: channel,
                isEnabled: isEnabled,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String> body = const Value.absent(),
                Value<String> cadence = const Value.absent(),
                Value<int> hour = const Value.absent(),
                Value<int> minute = const Value.absent(),
                Value<int?> weekday = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                required DateTime updatedAt,
              }) => RemindersCompanion.insert(
                id: id,
                title: title,
                body: body,
                cadence: cadence,
                hour: hour,
                minute: minute,
                weekday: weekday,
                channel: channel,
                isEnabled: isEnabled,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
      Reminder,
      PrefetchHooks Function()
    >;
typedef $$PartnerAccountsTableCreateCompanionBuilder =
    PartnerAccountsCompanion Function({
      Value<int> id,
      required String email,
      Value<String> accessLevel,
      Value<String> reportSchedule,
      Value<bool> isEnabled,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$PartnerAccountsTableUpdateCompanionBuilder =
    PartnerAccountsCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String> accessLevel,
      Value<String> reportSchedule,
      Value<bool> isEnabled,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PartnerAccountsTableFilterComposer
    extends Composer<_$AppDatabase, $PartnerAccountsTable> {
  $$PartnerAccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accessLevel => $composableBuilder(
    column: $table.accessLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportSchedule => $composableBuilder(
    column: $table.reportSchedule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PartnerAccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $PartnerAccountsTable> {
  $$PartnerAccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accessLevel => $composableBuilder(
    column: $table.accessLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportSchedule => $composableBuilder(
    column: $table.reportSchedule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartnerAccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartnerAccountsTable> {
  $$PartnerAccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get accessLevel => $composableBuilder(
    column: $table.accessLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reportSchedule => $composableBuilder(
    column: $table.reportSchedule,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PartnerAccountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartnerAccountsTable,
          PartnerAccount,
          $$PartnerAccountsTableFilterComposer,
          $$PartnerAccountsTableOrderingComposer,
          $$PartnerAccountsTableAnnotationComposer,
          $$PartnerAccountsTableCreateCompanionBuilder,
          $$PartnerAccountsTableUpdateCompanionBuilder,
          (
            PartnerAccount,
            BaseReferences<
              _$AppDatabase,
              $PartnerAccountsTable,
              PartnerAccount
            >,
          ),
          PartnerAccount,
          PrefetchHooks Function()
        > {
  $$PartnerAccountsTableTableManager(
    _$AppDatabase db,
    $PartnerAccountsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartnerAccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartnerAccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartnerAccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> accessLevel = const Value.absent(),
                Value<String> reportSchedule = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PartnerAccountsCompanion(
                id: id,
                email: email,
                accessLevel: accessLevel,
                reportSchedule: reportSchedule,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                Value<String> accessLevel = const Value.absent(),
                Value<String> reportSchedule = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => PartnerAccountsCompanion.insert(
                id: id,
                email: email,
                accessLevel: accessLevel,
                reportSchedule: reportSchedule,
                isEnabled: isEnabled,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PartnerAccountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartnerAccountsTable,
      PartnerAccount,
      $$PartnerAccountsTableFilterComposer,
      $$PartnerAccountsTableOrderingComposer,
      $$PartnerAccountsTableAnnotationComposer,
      $$PartnerAccountsTableCreateCompanionBuilder,
      $$PartnerAccountsTableUpdateCompanionBuilder,
      (
        PartnerAccount,
        BaseReferences<_$AppDatabase, $PartnerAccountsTable, PartnerAccount>,
      ),
      PartnerAccount,
      PrefetchHooks Function()
    >;
typedef $$ActivityLogsTableCreateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> id,
      required String actionType,
      Value<String> entityType,
      Value<int?> entityId,
      Value<String> status,
      required DateTime createdAt,
    });
typedef $$ActivityLogsTableUpdateCompanionBuilder =
    ActivityLogsCompanion Function({
      Value<int> id,
      Value<String> actionType,
      Value<String> entityType,
      Value<int?> entityId,
      Value<String> status,
      Value<DateTime> createdAt,
    });

class $$ActivityLogsTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActivityLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityLogsTable> {
  $$ActivityLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ActivityLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityLogsTable,
          ActivityLog,
          $$ActivityLogsTableFilterComposer,
          $$ActivityLogsTableOrderingComposer,
          $$ActivityLogsTableAnnotationComposer,
          $$ActivityLogsTableCreateCompanionBuilder,
          $$ActivityLogsTableUpdateCompanionBuilder,
          (
            ActivityLog,
            BaseReferences<_$AppDatabase, $ActivityLogsTable, ActivityLog>,
          ),
          ActivityLog,
          PrefetchHooks Function()
        > {
  $$ActivityLogsTableTableManager(_$AppDatabase db, $ActivityLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ActivityLogsCompanion(
                id: id,
                actionType: actionType,
                entityType: entityType,
                entityId: entityId,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String actionType,
                Value<String> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
                Value<String> status = const Value.absent(),
                required DateTime createdAt,
              }) => ActivityLogsCompanion.insert(
                id: id,
                actionType: actionType,
                entityType: entityType,
                entityId: entityId,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActivityLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityLogsTable,
      ActivityLog,
      $$ActivityLogsTableFilterComposer,
      $$ActivityLogsTableOrderingComposer,
      $$ActivityLogsTableAnnotationComposer,
      $$ActivityLogsTableCreateCompanionBuilder,
      $$ActivityLogsTableUpdateCompanionBuilder,
      (
        ActivityLog,
        BaseReferences<_$AppDatabase, $ActivityLogsTable, ActivityLog>,
      ),
      ActivityLog,
      PrefetchHooks Function()
    >;
typedef $$TemplatesTableCreateCompanionBuilder =
    TemplatesCompanion Function({
      Value<int> id,
      required String type,
      required String title,
      required String content,
      Value<String> tags,
    });
typedef $$TemplatesTableUpdateCompanionBuilder =
    TemplatesCompanion Function({
      Value<int> id,
      Value<String> type,
      Value<String> title,
      Value<String> content,
      Value<String> tags,
    });

class $$TemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TemplatesTable> {
  $$TemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);
}

class $$TemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TemplatesTable,
          Template,
          $$TemplatesTableFilterComposer,
          $$TemplatesTableOrderingComposer,
          $$TemplatesTableAnnotationComposer,
          $$TemplatesTableCreateCompanionBuilder,
          $$TemplatesTableUpdateCompanionBuilder,
          (Template, BaseReferences<_$AppDatabase, $TemplatesTable, Template>),
          Template,
          PrefetchHooks Function()
        > {
  $$TemplatesTableTableManager(_$AppDatabase db, $TemplatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> tags = const Value.absent(),
              }) => TemplatesCompanion(
                id: id,
                type: type,
                title: title,
                content: content,
                tags: tags,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String type,
                required String title,
                required String content,
                Value<String> tags = const Value.absent(),
              }) => TemplatesCompanion.insert(
                id: id,
                type: type,
                title: title,
                content: content,
                tags: tags,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TemplatesTable,
      Template,
      $$TemplatesTableFilterComposer,
      $$TemplatesTableOrderingComposer,
      $$TemplatesTableAnnotationComposer,
      $$TemplatesTableCreateCompanionBuilder,
      $$TemplatesTableUpdateCompanionBuilder,
      (Template, BaseReferences<_$AppDatabase, $TemplatesTable, Template>),
      Template,
      PrefetchHooks Function()
    >;
typedef $$ExportReportsTableCreateCompanionBuilder =
    ExportReportsCompanion Function({
      Value<int> id,
      required String period,
      Value<String> format,
      required String filePath,
      required DateTime createdAt,
    });
typedef $$ExportReportsTableUpdateCompanionBuilder =
    ExportReportsCompanion Function({
      Value<int> id,
      Value<String> period,
      Value<String> format,
      Value<String> filePath,
      Value<DateTime> createdAt,
    });

class $$ExportReportsTableFilterComposer
    extends Composer<_$AppDatabase, $ExportReportsTable> {
  $$ExportReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExportReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $ExportReportsTable> {
  $$ExportReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExportReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExportReportsTable> {
  $$ExportReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ExportReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExportReportsTable,
          ExportReport,
          $$ExportReportsTableFilterComposer,
          $$ExportReportsTableOrderingComposer,
          $$ExportReportsTableAnnotationComposer,
          $$ExportReportsTableCreateCompanionBuilder,
          $$ExportReportsTableUpdateCompanionBuilder,
          (
            ExportReport,
            BaseReferences<_$AppDatabase, $ExportReportsTable, ExportReport>,
          ),
          ExportReport,
          PrefetchHooks Function()
        > {
  $$ExportReportsTableTableManager(_$AppDatabase db, $ExportReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExportReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExportReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExportReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> period = const Value.absent(),
                Value<String> format = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExportReportsCompanion(
                id: id,
                period: period,
                format: format,
                filePath: filePath,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String period,
                Value<String> format = const Value.absent(),
                required String filePath,
                required DateTime createdAt,
              }) => ExportReportsCompanion.insert(
                id: id,
                period: period,
                format: format,
                filePath: filePath,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExportReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExportReportsTable,
      ExportReport,
      $$ExportReportsTableFilterComposer,
      $$ExportReportsTableOrderingComposer,
      $$ExportReportsTableAnnotationComposer,
      $$ExportReportsTableCreateCompanionBuilder,
      $$ExportReportsTableUpdateCompanionBuilder,
      (
        ExportReport,
        BaseReferences<_$AppDatabase, $ExportReportsTable, ExportReport>,
      ),
      ExportReport,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$RoleContextsTableTableManager get roleContexts =>
      $$RoleContextsTableTableManager(_db, _db.roleContexts);
  $$NorthStarsTableTableManager get northStars =>
      $$NorthStarsTableTableManager(_db, _db.northStars);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$ActionItemsTableTableManager get actionItems =>
      $$ActionItemsTableTableManager(_db, _db.actionItems);
  $$CheckInsTableTableManager get checkIns =>
      $$CheckInsTableTableManager(_db, _db.checkIns);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$PartnerAccountsTableTableManager get partnerAccounts =>
      $$PartnerAccountsTableTableManager(_db, _db.partnerAccounts);
  $$ActivityLogsTableTableManager get activityLogs =>
      $$ActivityLogsTableTableManager(_db, _db.activityLogs);
  $$TemplatesTableTableManager get templates =>
      $$TemplatesTableTableManager(_db, _db.templates);
  $$ExportReportsTableTableManager get exportReports =>
      $$ExportReportsTableTableManager(_db, _db.exportReports);
}
