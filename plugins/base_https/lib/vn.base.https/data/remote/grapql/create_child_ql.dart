String createChildQL() {
  return r'''
      mutation createOneChildByParent(
        $nameChild: String!,
        $classChild: Int,
        $passwordChild: String,
        $genderChild: Gender,
        $birthdayChild: DateTime,
        $avatar: String,
        $schoolId: String,
      ){
        createOneChildByParent(
          data:{
              name: $nameChild,
              grade: $classChild, 
              password: $passwordChild ,
              gender:$genderChild,
              birthday: $birthdayChild,
              avatar: $avatar,
              school:{connect:{id: $schoolId}},
          }
        )
        {
          id
          name
          birthday
          gender
          isDeleted
          password
          grade
          avatar
          school{
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