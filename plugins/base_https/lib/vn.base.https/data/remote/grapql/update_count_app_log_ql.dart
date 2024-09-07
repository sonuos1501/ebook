String updateCountAppLogQL() {
  return
      r'''
        mutation CountManyAppLogByChild(
          $childId: String!,
          $deviceId:String!,
          $package:String!,
          $data:[CountManyAppLogByTime!]!
        ){
          countManyAppLogByChild(data:{
              childId:$childId,
              package:$package,
              deviceId:$deviceId,
              logapps:$data
          })
        }
      ''';
}