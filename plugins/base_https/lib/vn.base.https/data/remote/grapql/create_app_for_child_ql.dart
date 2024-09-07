String createAppForChildQL() {
  return r'''
    mutation CreateAppByChild(
      $name: String!,
      $package:String,
      $status: Boolean,
      $state: State,
      $childId: String
    ){
      createAppByChild(
        data:{
            name:$name,
            package: $package, 
            status: $status, 
            state:$state, 
            child:{connect:{id:$childId}}
        })
      {
        id
        name
        package
        status
        childId
        state
        createdAt
      }
    }
    ''';
}

String createManyAppForChildQL() {
  return r'''
    mutation createManyApp(
      $data:[AppCreateManyInput!]!
    ){
      createManyApp(data:$data){
        count
      }
    }
    ''';
}

