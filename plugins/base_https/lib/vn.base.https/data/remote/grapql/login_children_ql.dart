String loginChildrenQL() {
  return r'''
      mutation LoginChildren($idChild: String, $passwordChild: String) {
        loginChildren(
            data:{
                id:$idChild, 
                password:$passwordChild
          }
        )
        {
          grade
          name
          birthday
        }
      }
  ''';
}