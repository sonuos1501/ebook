
String deleteChildQL() {
  return r'''
      mutation DeleteChild($childId: String){
        deleteOneChild(
            where:{
                id: $childId
            }
        )
        {
          grade
          gender
          birthday
        }
      }
    ''';
}
