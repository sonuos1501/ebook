String registerQL() {
  return r'''
     mutation RegisterNewUser(
        $emailRegister:String!,
        $nameRegister: String!,
        $passwordRegister: String!,
        $phoneRegister :String!
     ) {
        register(
            data: {
                email: $emailRegister,  
                name:$nameRegister, 
                password: $passwordRegister, 
                phone:$phoneRegister,
              }) 
     }
    ''';
}
