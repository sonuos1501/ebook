String getVersionUpdateQL() {
  return
      r'''
        query getLastestVersion($isLast:Boolean) {
          versions(where:
            {
              isLast:{equals:$isLast}
            }){
            id
            number
            name
            content
            file
            status
            isLast
          }
        }
      ''';
}