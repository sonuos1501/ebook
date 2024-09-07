String createTimeManagementQL() {
  return r'''
      mutation CreateTimeAccessManagement(
        $childId:String,
        $type :TimeAccessType!,
        $rule: Rule,
        $startTime:String,
        $endTime: String,
        $weekdays:[WeekdaysCreateManyTimeAccessInput!]!
      ){
        createTimeAccessByChild(
          data:{
            child: {connect:{id: $childId}},
            type: $type,
            rule: $rule,
            startTime:$startTime,
            endTime : $endTime,
            times:3,
            duration:10,
            weekdays:{
              createMany:{data:$weekdays}}
          }
        ){
          id
          rule
          startTime
          endTime
          times
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