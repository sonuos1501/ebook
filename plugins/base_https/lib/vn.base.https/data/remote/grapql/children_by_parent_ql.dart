String childrenByParentQL() {
  return '''
      query{
        childrenByParent{
          id
          name
          birthday
          gender
          isDeleted
          password
          grade
          avatar
          school {
            id
            code
            name
            province
            district
          }
        }
      }
    ''';
}