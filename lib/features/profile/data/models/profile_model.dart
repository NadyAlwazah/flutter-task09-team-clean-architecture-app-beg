class ProfileModel {
  final String name;
  final String email;
  final String password;
  final String? image;

  ProfileModel({
    required this.name,
    required this.email,
    required this.password,
    this.image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] != null 
          ? "${json['name']['firstname']} ${json['name']['lastname']}"
          : json['username'] ?? 'Programmer X',
      email: json['email'] ?? '',
      password: json['password'] ?? '********',
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': {
        'firstname': name.split(' ').first,
        'lastname': name.split(' ').length > 1 ? name.split(' ').last : '',
      }
    };
  }
}