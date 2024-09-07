String resetPasswordQL() {
  return r'''
        mutation ResetPassword($email: String!){
          resetPassword(data:{email: $email})
        }
    ''';
}

String changePasswordAfterResetQL() {
  return r'''
      mutation ChangePassword (
          $newPassword: String
      ){
        updateProfile(
            data: {
                password: {
                    set: $newPassword
                 }
             }) {
          id
        }
      }
  ''';
}