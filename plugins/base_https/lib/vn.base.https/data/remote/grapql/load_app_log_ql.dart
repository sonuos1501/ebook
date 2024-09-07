String loadAppLogQL() {
  return
      r'''
        query AppLogByChild(
          $childId:String,
          $start:String,
          $end:String
        ){
          appLogsByChild(
            where:{
              childId: {equals:$childId}
              startTime: {gte: $start,lte: $end}
            }
          ){
            childId
            deviceId
            appId
            app{
                package
            }
            count
            startTime
            endTime
          }
        }
      ''';
}