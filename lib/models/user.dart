class User {
  final String firstName;
  final String lastName;
  final String email;
  final String year;
  final String branch;
  final String password;
  final String confirmPassword;
  final String uid;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.year,
    required this.branch,
    required this.password,
    required this.confirmPassword,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'year': year,
        'branch': branch,
        'password': password,
        'confirmPassword': confirmPassword
      };
}
