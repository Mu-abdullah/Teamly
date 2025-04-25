class CheckRoleRepo {
  final String role;

  CheckRoleRepo(this.role);

  bool isAdmin() {
    return role == 'admin';
  }

  bool isUser() {
    return role == 'user';
  }

  bool isGuest() {
    return role == 'guest';
  }
}
