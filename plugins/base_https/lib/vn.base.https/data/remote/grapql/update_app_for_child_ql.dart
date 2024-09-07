String updateAppForChildQL() {
  return r'''
    mutation UpdateAppByChild(
        $status: Boolean,
        $id: String,
        $childId:String
       ){
            updateAppByChild(
                data: {status:{set:$status}},
                where: {
                    id:{equals:$id},
                    childId: {equals:$childId}
            }
       ){
           count
       } 
    }
    ''';
}

String updateAllAppForChildQL() {
  return r'''
    mutation UpdateAppByChild(
        $status: Boolean,
        $childId:String
       ){
            updateAppByChild(
                data: {status:{set:$status}},
                where: {
                    childId: {equals:$childId}
            }
       ){
           count
       } 
    }
    ''';
}