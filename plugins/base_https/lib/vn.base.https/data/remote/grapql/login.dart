String loginQL() {
  return r'''
      mutation LoginUser(
        $username: String!,
        $password: String! 
      ) {
        login(
          data: {
            username:$username, 
            password:$password
          }){
          refreshToken
          accessToken
        }
      }
    ''';
}
