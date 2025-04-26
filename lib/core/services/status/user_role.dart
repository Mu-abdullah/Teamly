enum Role { admin, user }

class UserRole {
  static const String admin = 'admin';
  static const String user = 'user';

  static String getRole(Role role) => role.name;
}
