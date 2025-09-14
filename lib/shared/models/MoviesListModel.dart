import 'package:movies_v2/shared/models/meta.dart';
import 'Data.dart';

class MoviesListModel {
  MoviesListModel({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  MoviesListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String,
        statusMessage = json['status_message'] as String,
        data = Data.fromJson(json['data'] as Map<String, dynamic>),
        meta = Meta.fromJson(json['@meta'] as Map<String, dynamic>);

  final String status;
  final String statusMessage;
  final Data data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    map['data'] = data.toJson();
    map['@meta'] = meta.toJson();
    return map;
  }
}