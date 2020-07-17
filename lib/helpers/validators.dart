import 'dart:async';

class Validators{
  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(email.contains('@')){
        sink.add(email);
      }else{
        sink.addError('Enter a valid email');
      }
    }
  );
}