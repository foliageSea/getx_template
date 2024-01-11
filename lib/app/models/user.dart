import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User(this.name, this.email, this.address);

  String name;
  String email;
  Address address;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// @JsonKey(name: 'registration_date_millis')
// @JsonKey(defaultValue: false)
// @JsonKey(required: true)
// @JsonKey(ignore: true)
// @JsonSerializable(explicitToJson: true)

@JsonSerializable()
class Address {
  String city;
  Address(this.city);

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
