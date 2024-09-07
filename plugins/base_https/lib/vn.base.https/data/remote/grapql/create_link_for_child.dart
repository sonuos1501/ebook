String createLinkForChildQL() {
  return
      r'''
        mutation CreateLinkByChild(
          $link:String!,
          $status:Boolean,
          $childId: String,
        ){
          createLinkByChild(
            data:{
              link: $link,
              status :$status,
              child:{ connect:{ id: $childId } }
            }
          ){
            id
            link
            status
            childId
            updatedAt
            child {
              name
              gender
            }
          }
        }
      ''';
}