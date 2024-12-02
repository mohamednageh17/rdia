class UserData {
  final String image;
  final String name;
  final String email;
  final String phone;
  final String commitment;
  final String signature;

  UserData({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.commitment,
    required this.signature,
  });

  // To convert the data into a Map to save it in Firestore
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'email': email,
      'phone': phone,
      'commitment': commitment,
      'signature': signature,
    };
  }

  // Create a model from Firestore data
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      commitment: map['commitment'] ?? '',
      signature: map['signature'] ?? '',
    );
  }
}
