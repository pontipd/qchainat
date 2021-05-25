import 'dart:convert';

import 'package:chainatqueue/screens/startouse.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String prefix;
  final String name;
  final String surname;
  final String cids;
  final String hns;
  final String birthday;
  final String phone;
  final String email;
  final String password;
  UserModel({
    this.prefix,
    this.name,
    this.surname,
    this.cids,
    this.hns,
    this.birthday,
    this.phone,
    this.email,
    this.password,
  });

  UserModel copyWith({
    String prefix,
    String name,
    String surname,
    String cids,
    String hns,
    String birthday,
    String phone,
    String email,
    String password,
  }) {
    return UserModel(
      prefix: prefix ?? this.prefix,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      cids: cids ?? this.cids,
      hns: hns ?? this.hns,
      birthday: birthday ?? this.birthday,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prefix': prefix,
      'name': name,
      'surname': surname,
      'cids': cids,
      'hns':hns,
      'birthday': birthday,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      prefix: map['prefix'],
      name: map['name'],
      surname: map['surname'],
      cids: map['cids'],
      hns: map['hns'],
      birthday: map['birthday'],
      phone: map['phone'],
      email: map['email'],
      password: map['password'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
     prefix: json['prefix'],
      name: json['name'],
      surname: json['surname'],
      cids: json['cids'],
      hns: json['hns'],
      birthday: json['birthday'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory UserModel.fromJson(String source) =>
  //     UserModel.fromMap(json.decode(source));

  // @override
  // String toString() {
  //   return 'UserModel(prefix: $prefix, name: $name, surname: $surname, cids: $cids, hns: $hns, birthday: $birthday, phone: $phone, email: $email, password: $password)';
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.prefix == prefix &&
        other.name == name &&
        other.surname == surname &&
        other.cids == cids &&
        other.hns == hns &&
        other.birthday == birthday &&
        other.phone == phone &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return prefix.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        cids.hashCode ^
        hns.hashCode ^
        birthday.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
