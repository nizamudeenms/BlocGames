import 'package:json_annotation/json_annotation.dart';

import 'model_barrel.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  Store({
    this.id,
    this.store,
  });

  final int? id;
  final Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
