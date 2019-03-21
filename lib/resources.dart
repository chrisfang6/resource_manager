import 'package:json_annotation/json_annotation.dart';

part 'resources_g.dart';

@JsonSerializable(nullable: false)
class Resources {
  @JsonKey(name: 'dimens', nullable: true)
  Map<String, String> dimens;

  @JsonKey(name: 'colors', nullable: true)
  Map<String, String> colors;

  @JsonKey(name: 'drawable', nullable: true)
  Map<String, String> drawable;

  @JsonKey(name: 'strings', nullable: true)
  Map<String, String> strings;

  @JsonKey(name: 'integers', nullable: true)
  Map<String, dynamic> integers;

  @JsonKey(name: 'doubles', nullable: true)
  Map<String, dynamic> doubles;

  Resources(
      {this.dimens,
      this.colors,
      this.drawable,
      this.strings,
      this.integers,
      this.doubles});

  factory Resources.fromJson(Map<String, dynamic> json) =>
      _$ResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$ResourcesToJson(this);
}
