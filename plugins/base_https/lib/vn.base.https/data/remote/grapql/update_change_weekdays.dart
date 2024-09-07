String updateChangeWeekdaysQL() {
  return r'''
      mutation UpdatTimeAccess(
        $childId: String!,
        $type:TimeAccessType!,
        $weekdays:[WeekdaysUpsertWithWhereUniqueWithoutTimeAccessInput!]!
      ){
      updateTimeAccessByChild(
        where:{
          childId:$childId
        }
        data:{
          type: {set:$type},
          weekdays:{
            upsert:$weekdays
          }            
        }
      ){
        type
        rule
        times
        duration
        startTime
        endTime
        childId
        weekdays{
            name
            rule
            times
            duration
            startTime
            endTime
        }
      }
    }
  ''';
}