String createDeviceByUserQL() {
  return r'''
    mutation CreateDeviceByUser(
    $deviceId: String,
    $deviceName: String!,
    $osVersion: String,
    $platform: String,
    $imei:  [String!]!
) {
  createOneDeviecByUser(
      data:{
          deviceId: $deviceId ,
          deviceName:$deviceName, 
          osVersion: $osVersion,
          platform: $platform,
          imei: {set:$imei}
        })
{
    deviceId
    deviceName
    userId
    osVersion
    platform
    imei
  }
}
  ''';
}
