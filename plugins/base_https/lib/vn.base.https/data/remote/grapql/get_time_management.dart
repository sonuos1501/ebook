String getTimeManagementQL() {
  return r'''
      query TimeAccessByChild(
        $childId: String
        ){
          timeAccess(
              where:{
                  childId: $childId
                  }
                )
            {
            id
          rule
            times
            type
            createdAt
            childId
            startTime
              endTime
              duration
            weekdays{
              name
              rule
              startTime
              endTime
              times
              duration
            }
          }
        }
    ''';
}