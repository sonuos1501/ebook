String getParentProfileQL(Map<String, dynamic> body) {
  return '''
      query Me {
        me {
          id
          name
          email
          avatar
          phone
        }
      }
    ''';
}