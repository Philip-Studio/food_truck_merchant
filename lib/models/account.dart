import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  String fullName;
  String phoneNumber;
  String? countryName;
  //0: CCCD, 1: CMND, 2: Passport
  int? identityType;
  String? identityNumber;
  String? frontIdentity;
  String? backsideIdentity;
  DateTime? timeStamp;
  bool isFirstLogin;
  String idRes;

  Account({
    required this.fullName,
    required this.phoneNumber,
    this.countryName,
    required this.identityType,
    required this.identityNumber,
    this.frontIdentity,
    this.backsideIdentity,
    this.timeStamp,
    required this.isFirstLogin,
    required this.idRes,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
