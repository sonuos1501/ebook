String refreshTokenQL() {
  return r'''
        mutation RefreshToken {
          refreshToken {
            accessToken
            refreshToken
          }
        }
    ''';
}
