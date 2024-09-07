String updateParentProfileQL(Map<String, dynamic> body) {
  return '''
      mutation{
        updateProfile(
            data: {
                name: {
                    set: "${body['name']}"
                 }
                 email: {
                    set: "${body['email']}"
                 }
                 phone: {
                    set: "${body['phone']}"
                 }
             }) {
           id
           name
           email
           avatar
           phone
        }
      }
    ''';
}