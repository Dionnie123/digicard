// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DigitalCard _$DigitalCardFromJson(Map<String, dynamic> json) {
  return _DigitalCard.fromJson(json);
}

/// @nodoc
mixin _$DigitalCard {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  @RfControl(validators: [RequiredValidator()])
  String get firstName => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  @RfControl()
  String get title => throw _privateConstructorUsedError;
  @RfControl()
  String get prefix => throw _privateConstructorUsedError;
  @RfControl()
  String get middleName => throw _privateConstructorUsedError;
  @RfControl()
  String get lastName => throw _privateConstructorUsedError;
  @RfControl()
  String get suffix => throw _privateConstructorUsedError;
  @RfControl()
  String get accreditations => throw _privateConstructorUsedError;
  @RfControl()
  String get maidenName => throw _privateConstructorUsedError;
  @RfControl()
  dynamic get avatarFile =>
      throw _privateConstructorUsedError; //@Uint8ListConverter()
  @RfControl()
  dynamic get logoFile => throw _privateConstructorUsedError;
  @ColorConverter()
  @RfControl()
  Color get color => throw _privateConstructorUsedError;
  @RfControl()
  int get layout => throw _privateConstructorUsedError;
  @RfControl()
  String get position => throw _privateConstructorUsedError;
  @RfControl()
  String get department => throw _privateConstructorUsedError;
  @RfControl()
  String get company => throw _privateConstructorUsedError;
  @RfControl()
  String get headline => throw _privateConstructorUsedError;
  @RfControl()
  List<Map<String, dynamic>> get customLinks =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get addedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DigitalCardCopyWith<DigitalCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalCardCopyWith<$Res> {
  factory $DigitalCardCopyWith(
          DigitalCard value, $Res Function(DigitalCard) then) =
      _$DigitalCardCopyWithImpl<$Res, DigitalCard>;
  @useResult
  $Res call(
      {int id,
      String userId,
      String uuid,
      @RfControl(validators: [RequiredValidator()]) String firstName,
      String logoUrl,
      String avatarUrl,
      @RfControl() String title,
      @RfControl() String prefix,
      @RfControl() String middleName,
      @RfControl() String lastName,
      @RfControl() String suffix,
      @RfControl() String accreditations,
      @RfControl() String maidenName,
      @RfControl() dynamic avatarFile,
      @RfControl() dynamic logoFile,
      @ColorConverter() @RfControl() Color color,
      @RfControl() int layout,
      @RfControl() String position,
      @RfControl() String department,
      @RfControl() String company,
      @RfControl() String headline,
      @RfControl() List<Map<String, dynamic>> customLinks,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? addedAt});
}

/// @nodoc
class _$DigitalCardCopyWithImpl<$Res, $Val extends DigitalCard>
    implements $DigitalCardCopyWith<$Res> {
  _$DigitalCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? uuid = null,
    Object? firstName = null,
    Object? logoUrl = null,
    Object? avatarUrl = null,
    Object? title = null,
    Object? prefix = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? suffix = null,
    Object? accreditations = null,
    Object? maidenName = null,
    Object? avatarFile = freezed,
    Object? logoFile = freezed,
    Object? color = null,
    Object? layout = null,
    Object? position = null,
    Object? department = null,
    Object? company = null,
    Object? headline = null,
    Object? customLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      accreditations: null == accreditations
          ? _value.accreditations
          : accreditations // ignore: cast_nullable_to_non_nullable
              as String,
      maidenName: null == maidenName
          ? _value.maidenName
          : maidenName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      customLinks: null == customLinks
          ? _value.customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DigitalCardImplCopyWith<$Res>
    implements $DigitalCardCopyWith<$Res> {
  factory _$$DigitalCardImplCopyWith(
          _$DigitalCardImpl value, $Res Function(_$DigitalCardImpl) then) =
      __$$DigitalCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String userId,
      String uuid,
      @RfControl(validators: [RequiredValidator()]) String firstName,
      String logoUrl,
      String avatarUrl,
      @RfControl() String title,
      @RfControl() String prefix,
      @RfControl() String middleName,
      @RfControl() String lastName,
      @RfControl() String suffix,
      @RfControl() String accreditations,
      @RfControl() String maidenName,
      @RfControl() dynamic avatarFile,
      @RfControl() dynamic logoFile,
      @ColorConverter() @RfControl() Color color,
      @RfControl() int layout,
      @RfControl() String position,
      @RfControl() String department,
      @RfControl() String company,
      @RfControl() String headline,
      @RfControl() List<Map<String, dynamic>> customLinks,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? addedAt});
}

/// @nodoc
class __$$DigitalCardImplCopyWithImpl<$Res>
    extends _$DigitalCardCopyWithImpl<$Res, _$DigitalCardImpl>
    implements _$$DigitalCardImplCopyWith<$Res> {
  __$$DigitalCardImplCopyWithImpl(
      _$DigitalCardImpl _value, $Res Function(_$DigitalCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? uuid = null,
    Object? firstName = null,
    Object? logoUrl = null,
    Object? avatarUrl = null,
    Object? title = null,
    Object? prefix = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? suffix = null,
    Object? accreditations = null,
    Object? maidenName = null,
    Object? avatarFile = freezed,
    Object? logoFile = freezed,
    Object? color = null,
    Object? layout = null,
    Object? position = null,
    Object? department = null,
    Object? company = null,
    Object? headline = null,
    Object? customLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_$DigitalCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String,
      accreditations: null == accreditations
          ? _value.accreditations
          : accreditations // ignore: cast_nullable_to_non_nullable
              as String,
      maidenName: null == maidenName
          ? _value.maidenName
          : maidenName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      headline: null == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String,
      customLinks: null == customLinks
          ? _value._customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DigitalCardImpl implements _DigitalCard {
  _$DigitalCardImpl(
      {required this.id,
      required this.userId,
      required this.uuid,
      @RfControl(validators: [RequiredValidator()]) this.firstName = "",
      this.logoUrl = "",
      this.avatarUrl = "",
      @RfControl() this.title = "New Card",
      @RfControl() this.prefix = "",
      @RfControl() this.middleName = "",
      @RfControl() this.lastName = "",
      @RfControl() this.suffix = "",
      @RfControl() this.accreditations = "",
      @RfControl() this.maidenName = "",
      @RfControl() this.avatarFile,
      @RfControl() this.logoFile,
      @ColorConverter() @RfControl() this.color = kcPrimaryColor,
      @RfControl() this.layout = 0,
      @RfControl() this.position = "",
      @RfControl() this.department = "",
      @RfControl() this.company = "",
      @RfControl() this.headline = "",
      @RfControl() final List<Map<String, dynamic>> customLinks = const [],
      this.createdAt,
      this.updatedAt,
      this.addedAt})
      : _customLinks = customLinks;

  factory _$DigitalCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitalCardImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final String uuid;
  @override
  @JsonKey()
  @RfControl(validators: [RequiredValidator()])
  final String firstName;
  @override
  @JsonKey()
  final String logoUrl;
  @override
  @JsonKey()
  final String avatarUrl;
  @override
  @JsonKey()
  @RfControl()
  final String title;
  @override
  @JsonKey()
  @RfControl()
  final String prefix;
  @override
  @JsonKey()
  @RfControl()
  final String middleName;
  @override
  @JsonKey()
  @RfControl()
  final String lastName;
  @override
  @JsonKey()
  @RfControl()
  final String suffix;
  @override
  @JsonKey()
  @RfControl()
  final String accreditations;
  @override
  @JsonKey()
  @RfControl()
  final String maidenName;
  @override
  @RfControl()
  final dynamic avatarFile;
//@Uint8ListConverter()
  @override
  @RfControl()
  final dynamic logoFile;
  @override
  @JsonKey()
  @ColorConverter()
  @RfControl()
  final Color color;
  @override
  @JsonKey()
  @RfControl()
  final int layout;
  @override
  @JsonKey()
  @RfControl()
  final String position;
  @override
  @JsonKey()
  @RfControl()
  final String department;
  @override
  @JsonKey()
  @RfControl()
  final String company;
  @override
  @JsonKey()
  @RfControl()
  final String headline;
  final List<Map<String, dynamic>> _customLinks;
  @override
  @JsonKey()
  @RfControl()
  List<Map<String, dynamic>> get customLinks {
    if (_customLinks is EqualUnmodifiableListView) return _customLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customLinks);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? addedAt;

  @override
  String toString() {
    return 'DigitalCard(id: $id, userId: $userId, uuid: $uuid, firstName: $firstName, logoUrl: $logoUrl, avatarUrl: $avatarUrl, title: $title, prefix: $prefix, middleName: $middleName, lastName: $lastName, suffix: $suffix, accreditations: $accreditations, maidenName: $maidenName, avatarFile: $avatarFile, logoFile: $logoFile, color: $color, layout: $layout, position: $position, department: $department, company: $company, headline: $headline, customLinks: $customLinks, createdAt: $createdAt, updatedAt: $updatedAt, addedAt: $addedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitalCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.accreditations, accreditations) ||
                other.accreditations == accreditations) &&
            (identical(other.maidenName, maidenName) ||
                other.maidenName == maidenName) &&
            const DeepCollectionEquality()
                .equals(other.avatarFile, avatarFile) &&
            const DeepCollectionEquality().equals(other.logoFile, logoFile) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            const DeepCollectionEquality()
                .equals(other._customLinks, _customLinks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        uuid,
        firstName,
        logoUrl,
        avatarUrl,
        title,
        prefix,
        middleName,
        lastName,
        suffix,
        accreditations,
        maidenName,
        const DeepCollectionEquality().hash(avatarFile),
        const DeepCollectionEquality().hash(logoFile),
        color,
        layout,
        position,
        department,
        company,
        headline,
        const DeepCollectionEquality().hash(_customLinks),
        createdAt,
        updatedAt,
        addedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitalCardImplCopyWith<_$DigitalCardImpl> get copyWith =>
      __$$DigitalCardImplCopyWithImpl<_$DigitalCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitalCardImplToJson(
      this,
    );
  }
}

abstract class _DigitalCard implements DigitalCard {
  factory _DigitalCard(
      {required final int id,
      required final String userId,
      required final String uuid,
      @RfControl(validators: [RequiredValidator()]) final String firstName,
      final String logoUrl,
      final String avatarUrl,
      @RfControl() final String title,
      @RfControl() final String prefix,
      @RfControl() final String middleName,
      @RfControl() final String lastName,
      @RfControl() final String suffix,
      @RfControl() final String accreditations,
      @RfControl() final String maidenName,
      @RfControl() final dynamic avatarFile,
      @RfControl() final dynamic logoFile,
      @ColorConverter() @RfControl() final Color color,
      @RfControl() final int layout,
      @RfControl() final String position,
      @RfControl() final String department,
      @RfControl() final String company,
      @RfControl() final String headline,
      @RfControl() final List<Map<String, dynamic>> customLinks,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? addedAt}) = _$DigitalCardImpl;

  factory _DigitalCard.fromJson(Map<String, dynamic> json) =
      _$DigitalCardImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  String get uuid;
  @override
  @RfControl(validators: [RequiredValidator()])
  String get firstName;
  @override
  String get logoUrl;
  @override
  String get avatarUrl;
  @override
  @RfControl()
  String get title;
  @override
  @RfControl()
  String get prefix;
  @override
  @RfControl()
  String get middleName;
  @override
  @RfControl()
  String get lastName;
  @override
  @RfControl()
  String get suffix;
  @override
  @RfControl()
  String get accreditations;
  @override
  @RfControl()
  String get maidenName;
  @override
  @RfControl()
  dynamic get avatarFile;
  @override //@Uint8ListConverter()
  @RfControl()
  dynamic get logoFile;
  @override
  @ColorConverter()
  @RfControl()
  Color get color;
  @override
  @RfControl()
  int get layout;
  @override
  @RfControl()
  String get position;
  @override
  @RfControl()
  String get department;
  @override
  @RfControl()
  String get company;
  @override
  @RfControl()
  String get headline;
  @override
  @RfControl()
  List<Map<String, dynamic>> get customLinks;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get addedAt;
  @override
  @JsonKey(ignore: true)
  _$$DigitalCardImplCopyWith<_$DigitalCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
