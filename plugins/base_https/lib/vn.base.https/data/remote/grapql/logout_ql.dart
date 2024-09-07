String logoutQL() {
  return r'''
      mutation Logout {
        logout
      }
    ''';
}
