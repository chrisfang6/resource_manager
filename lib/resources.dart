/*
 * Copyright 2019 chrisfang6
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
