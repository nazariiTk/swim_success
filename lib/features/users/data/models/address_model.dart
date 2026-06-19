import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/address.dart';
import 'geo_model.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required GeoModel geo,
  }) = _AddressModel;

  const AddressModel._();

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  Address toEntity() => Address(
        street: street,
        suite: suite,
        city: city,
        zipcode: zipcode,
        geo: geo.toEntity(),
      );
}
