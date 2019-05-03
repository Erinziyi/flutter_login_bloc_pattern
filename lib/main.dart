import 'package:flutter/material.dart';
import 'package:flutter_login_bloc_pattern/bloc.dart';
import 'package:flutter_login_bloc_pattern/pagetwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}



class HomePage extends StatelessWidget {
 changeThePage(BuildContext context){
   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PageTwo()));
 }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(

        title: Text("Bloc Pattern"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height:MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16),
          child:Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context,snapshot)=>TextField(
                  onChanged: bloc.emailChanged,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Enter email",
                  labelText: "Email",
                  errorText: snapshot.error  //if error
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              // password Text Field
              StreamBuilder<String>(
                stream: bloc.password,
                builder:(context,snapshot)=>TextField(
                  onChanged: bloc.passwordChanged,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter password",
                  labelText: "Password",
                    errorText: snapshot.error //if error
                ),
              ),
              ),

              SizedBox(
                height: 20.0,
              ),


              StreamBuilder<bool>(
               stream: bloc.sumbitCheck,
               builder :(context,snapshot)=>RaisedButton(
                color: Colors.tealAccent,
                onPressed: snapshot.hasData
                    ?() => changeThePage(context)
                    :null,
                child: Text("Summit"),
               ),
              ),

            ],
          )
        )



        ),
    );


  }
}
