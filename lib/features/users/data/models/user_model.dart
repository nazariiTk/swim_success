import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';
import 'address_model.dart';
import 'company_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required AddressModel address,
    required CompanyModel company,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  User toEntity() => User(
        id: id,
        name: name,
        username: username,
        email: email,
        phone: phone,
        website: website,
        address: address.toEntity(),
        company: company.toEntity(),
      );
}
