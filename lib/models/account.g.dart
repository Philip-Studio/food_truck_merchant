// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      countryName: json['countryName'] as String?,
      identityType: json['identityType'] as int?,
      identityNumber: json['identityNumber'] as String?,
      frontIdentity: json['frontIdentity'] as String?,
      backsideIdentity: json['backsideIdentity'] as String?,
      timeStamp: json['timeStamp'] == null
          ? null
          : DateTime.parse(json['timeStamp'] as String),
      isFirstLogin: json['isFirstLogin'] as bool,
      idRes: json['idRes'] as String,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'countryName': instance.countryName,
      'identityType': instance.identityType,
      'identityNumber': instance.identityNumber,
      'frontIdentity': instance.frontIdentity,
      'backsideIdentity': instance.backsideIdentity,
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'isFirstLogin': instance.isFirstLogin,
      'idRes': instance.idRes,
    };
