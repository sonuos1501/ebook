String changeParentPasswordQL() {
  return r'''  
      mutation changePassword($newPassword: String!, 
      $userId: String) {
        updateOneUser(
          data:{
                password:{set:$newPassword}
              },
          where:{
              id: $userId
          })
        {
          id
          name
          code
          email
        }
      }
    ''';
}