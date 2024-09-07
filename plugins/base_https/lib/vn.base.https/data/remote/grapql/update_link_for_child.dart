String updateLinkForChildQL() {
  return
      r'''
        mutation UpdateLinkByChild(
          $status:Boolean,
          $id: String,
          $childId:String
        ){
          updateLinkByChild(
            data: {status:{set:$status}}, 
            where: {
              id:{equals:$id}, 
              childId: {equals: $childId}
            }
          ){
            count
          }  
        }
      ''';
}