// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resources _$ResourcesFromJson(Map<String, dynamic> json) {
  return Resources(
      dimens: (json['dimens'] as Map<String, dynamic>)?.map(
        (k, dynamic e) => MapEntry(k, e as String),
      ),
      colors: (json['colors'] as Map<String, dynamic>)?.map(
        (k, dynamic e) => MapEntry(k, e as String),
      ),
      drawable: (json['drawable'] as Map<String, dynamic>)?.map(
        (k, dynamic e) => MapEntry(k, e as String),
      ),
      strings: (json['strings'] as Map<String, dynamic>)?.map(
        (k, dynamic e) => MapEntry(k, e as String),
      ),
      integers: json['integers'] as Map<String, dynamic>,
      doubles: json['doubles'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ResourcesToJson(Resources instance) => <String, dynamic>{
      'dimens': instance.dimens,
      'colors': instance.colors,
      'drawable': instance.drawable,
      'strings': instance.strings,
      'integers': instance.integers,
      'doubles': instance.doubles
    };
