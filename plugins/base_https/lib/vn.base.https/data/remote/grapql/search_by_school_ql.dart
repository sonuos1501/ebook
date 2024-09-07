String searchBySchoolQL() {
  return r'''
      query schools ($name: String, $take: Int) {
        schools(
            where: {
                name: {
                    mode:insensitive
                    contains:$name
                  }
            },
          take: $take){
              id
              code
              name
              province
              district
          }
      }
  ''';
}