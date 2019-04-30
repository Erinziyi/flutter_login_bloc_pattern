import 'dart:async';

mixin Validators{


  // email
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if (email.contains("@")) {
        sink.add(email);
      }else{
        sink.addError("Email is nor valid");
      }
    }
  );


  // password
  var passwordValidator = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink){
        if (password.length>4) {
          sink.add(password);
        }else{
          sink.addError("Password length should be 4 character");
        }
      }
  );
  

}