import 'package:cloud_firestore/cloud_firestore.dart';

class UserField {
  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
  static const birthDate = 'birthDate';
  static const location = 'location';
  static const phoneNumber = 'phoneNumber';
  static const carType = 'carType';
  static const inspectionDay = 'inspectionDay';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? birthDate;
  final String? location;
  final String? phoneNumber;
  final String? carType;
  final String? inspectionDay;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.birthDate,
    this.location,
    this.phoneNumber,
    this.carType,
    this.inspectionDay,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromFirestore(DocumentSnapshot snap) {
    final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;

    return User(
      id: data[UserField.id] ?? '',
      name: data[UserField.name] ?? '',
      email: data[UserField.email] ?? '',
      birthDate: data[UserField.birthDate] ?? '',
      location: data[UserField.location] ?? '',
      phoneNumber: data[UserField.phoneNumber] ?? '',
      carType: data[UserField.carType] ?? '',
      inspectionDay: data[UserField.inspectionDay] ?? '',
      createdAt: data[UserField.createdAt],
      updatedAt: data[UserField.updatedAt],
    );
  }
}
