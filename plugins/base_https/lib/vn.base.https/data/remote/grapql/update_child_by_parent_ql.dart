String updateChildByParentQL() {
  return r'''
      mutation ParentUpdateChild(
          $grade: Int,
          $birthday: DateTime,
          $childId: String,
          $name: String,
          $gender: Gender,
          $password: String,
          $avatar: String,
          $schoolId: String,
      ){
        updateOneChildByParent(
              data:{
                grade:{ 
                    set:$grade
                }, 
                birthday: { 
                    set: $birthday
                },
                name: { 
                    set: $name
                },
                gender: { 
                    set: $gender
                },
                password: { 
                    set: $password
                },
                avatar: { 
                    set: $avatar
                },
                school:{
                  connect:{
                    id:$schoolId,
                  }
                }
              }, 
              where:{
                  id:$childId
              }
          )
          {
              name
              birthday
              gender
              isDeleted
              grade
              password
              id
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
