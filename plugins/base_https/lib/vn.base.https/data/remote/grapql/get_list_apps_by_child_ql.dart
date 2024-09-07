String getListAppByChildQL() {
  return r'''
     query AppsByChild(
        $childId: String
    ){
      appsByChild(
          where:{
              childId:{equals: $childId}
              })
    {
        id
        name
        package
        status
        state
        createdAt
        childId
      }
    }
    ''';
}