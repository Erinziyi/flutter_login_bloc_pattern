import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';
class Bloc extends Object with Validators implements BaseBloc{

  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Function(String)get emailChanged => _emailController.sink.add;
  Function(String)get passwordChanged => _passwordController.sink.add;


  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

//  rxdart

  Stream<bool> get sumbitCheck => Observable.combineLatest2(email, password, (e,p)=> true);

  /*
       *  Below is an async function which uses Repository class
       *  to hit a login API and gets the result in a variable
       *  isUserLoginSuccessful[true/false]. and then Add the result
       *  into the sink.
       *  now whenever something is added to the sink, a callback is given to
       *  the stream linked to that Sink, which is managed by the framework itself
       *
       */


  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.close();
    _passwordController?.close();
  }

}


abstract class BaseBloc{
  void dispose();

}