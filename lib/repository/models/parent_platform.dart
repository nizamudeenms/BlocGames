import 'package:json_annotation/json_annotation.dart';

import 'model_barrel.dart';

part 'parent_platform.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  final EsrbRating? platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformFromJson(json);
}
