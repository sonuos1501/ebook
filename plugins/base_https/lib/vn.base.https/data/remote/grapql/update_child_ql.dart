String updateChildQL() {
  return r'''
mutation ParentUpdateChild(
    $grade: Int,
    $birthday: DateTime,
    $childId: String,
    $name: String,
    $gender: Gender,
    $avatar: String,
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
          avatar: { 
              set: $avatar
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