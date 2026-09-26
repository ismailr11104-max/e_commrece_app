class UserEntity {
  final String name;
  final String uid;
  final String email;

  UserEntity({required this.name, required this.uid, required this.email});

  Map<String, dynamic> toMap() {
    return {'name': this.name, 'uid': this.uid, 'email': this.email};
  }
}
