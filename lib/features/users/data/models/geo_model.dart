import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/geo.dart';

part 'geo_model.freezed.dart';
part 'geo_model.g.dart';

@freezed
class GeoModel with _$GeoModel {
  const factory GeoModel({
    required String lat,
    required String lng,
  }) = _GeoModel;

  const GeoModel._();

  factory GeoModel.fromJson(Map<String, dynamic> json) => _$GeoModelFromJson(json);

  Geo toEntity() => Geo(
        lat: lat,
        lng: lng,
      );
}
