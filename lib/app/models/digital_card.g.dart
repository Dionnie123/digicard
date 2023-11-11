// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalCardImpl _$$DigitalCardImplFromJson(Map<String, dynamic> json) =>
    _$DigitalCardImpl(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      uuid: json['uuid'] as String,
      firstName: json['first_name'] as String? ?? "",
      logoUrl: json['logo_url'] as String? ?? "",
      avatarUrl: json['avatar_url'] as String? ?? "",
      title: json['title'] as String? ?? "New Card",
      prefix: json['prefix'] as String? ?? "",
      middleName: json['middle_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      suffix: json['suffix'] as String? ?? "",
      accreditations: json['accreditations'] as String? ?? "",
      maidenName: json['maiden_name'] as String? ?? "",
      avatarFile: const Uint8ListConverter()
          .fromJson(json['avatar_file'] as List<int>?),
      logoFile:
          const Uint8ListConverter().fromJson(json['logo_file'] as List<int>?),
      color: json['color'] as int? ?? 0xFF9600FF,
      layout: json['layout'] as int? ?? 0,
      position: json['position'] as String? ?? "",
      department: json['department'] as String? ?? "",
      company: json['company'] as String? ?? "",
      headline: json['headline'] as String? ?? "",
      customLinks: (json['custom_links'] as List<dynamic>?)
              ?.map((e) => CustomLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
    );

Map<String, dynamic> _$$DigitalCardImplToJson(_$DigitalCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'first_name': instance.firstName,
      'logo_url': instance.logoUrl,
      'avatar_url': instance.avatarUrl,
      'title': instance.title,
      'prefix': instance.prefix,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'suffix': instance.suffix,
      'accreditations': instance.accreditations,
      'maiden_name': instance.maidenName,
      'avatar_file': const Uint8ListConverter().toJson(instance.avatarFile),
      'logo_file': const Uint8ListConverter().toJson(instance.logoFile),
      'color': instance.color,
      'layout': instance.layout,
      'position': instance.position,
      'department': instance.department,
      'company': instance.company,
      'headline': instance.headline,
      'custom_links': instance.customLinks,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'added_at': instance.addedAt?.toIso8601String(),
    };