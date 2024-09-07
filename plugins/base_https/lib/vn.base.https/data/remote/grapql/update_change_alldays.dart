String updateChangeAllDaysQL() {
  return r'''
      mutation UpdatTimeAccess(
        $childId: String!,
        $type:TimeAccessType!,
        $rule: Rule!,
        $startTime:String!,
        $endTime:String!,
        $times:Int,
        $duration:Int,
      ){
      updateTimeAccessByChild(
        where:{
          childId:$childId
        }
        data:{
          type: {set:$type},
          rule: {set:$rule},
          startTime: {set:$startTime},
          endTime: {set:$endTime},
          times: {set:$times},
          duration: {set:$duration},
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