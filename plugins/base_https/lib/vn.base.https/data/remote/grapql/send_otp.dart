String sendOtpQL() {
  return r'''
        mutation Verify(
          $otp:String!,
          $type: VerifyType!,
        ) {
          verify(data:{otp: $otp, type: $type}){
            refreshToken
            accessToken
          }
        }
      ''';
}