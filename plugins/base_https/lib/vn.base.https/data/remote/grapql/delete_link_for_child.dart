String deleteLinkForChildQL() {
  return
      r'''
        mutation deleteLinkByChild(
                $link:String,
                $childId:String
            ){
                deleteLinkByChild(
                where:{
                    link:{equals:$link},
                childId: {equals:$childId}
            }
            ){
                count
            }
        }
      ''';
}