
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {

  const UserEntity({
    required this.email,
    required this.name,
    required this.lastName,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      email: '',
      name: '',
      lastName: '',
    );
  }

  final String email;
  final String name;
  final String lastName;

  @override
  String toString() {
    return '''UserEntity(email: $email, name: $name, lastName: $lastName)''';
  }

  @override
  List<Object?> get props => [
    email,
    name,
    lastName,
  ];

  UserEntity copyWith({
    String? email,
    String? name,
    String? lastName,
  }) => UserEntity(
    email: email ?? this.email,
    name: name ?? this.name,
    lastName: lastName ?? this.lastName
  );

}
