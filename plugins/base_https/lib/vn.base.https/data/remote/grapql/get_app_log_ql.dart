String getAppLogQL() {
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
              endTime:{lte: $end},
              startTime: {gte: $start}
            }
          ){
            childId
            deviceId
            appId
            startTime
            endTime
            createdAt
            updatedAt
            app {
                package
                name
                id
            
            }
          }
        }
      ''';
}