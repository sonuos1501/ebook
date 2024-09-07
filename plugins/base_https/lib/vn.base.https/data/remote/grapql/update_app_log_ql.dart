String updateAppLogQL() {
  return
      r'''
        mutation createManyAppLogByChild(
          $childId:String!,
          $deviceId: String,
          $data:[AppProgressInput!]!
        ){
          createManyAppLogByChild(data:{
            deviceId: $deviceId,
            childId: $childId,
            appProgress:$data
          })
        }
      ''';
}