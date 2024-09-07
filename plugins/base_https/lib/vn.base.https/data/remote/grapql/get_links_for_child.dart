String getLinksForChildQL() {
  return
      r'''
        query LinksByChild(
          $childId:String
        ){
          linksByChild(
            where:{
              childId: {equals:$childId}
            }
          ){
            id
            childId
            link
            status
            createdAt
            updatedAt
          }
        }
      ''';
}