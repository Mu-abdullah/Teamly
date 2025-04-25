enum Role { admin, user }

class UserRole {
  static String getRole(Role role) => role.name;
}
