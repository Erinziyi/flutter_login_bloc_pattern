import 'package:flutter/material.dart';
import 'package:flutter_login_bloc_pattern/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Pattern',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      home: MyHomePage(title: 'Bloc Pattern'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(

        title: Text("Bloc Psttern"),
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
                onPressed: snapshot.hasData?() => changeThePage(context):null,
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