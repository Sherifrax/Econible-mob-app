import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:trackizer/sqldb.dart';
import 'package:trackizer/view/login/sign_in_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/primary_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/secondary_boutton.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  //TextEditingController txtEmail = TextEditingController();
  //TextEditingController txtPassword = TextEditingController();

bool _isVisible=false;
bool _isPasswordEightCharachters = false;
bool _hasPasswordOneNumber = false;
bool _isEmailWritternCorrect = true;
bool _isNameIsNull = false;

bool _isVisibleNamewarn = false;
bool _isVisibleEmailwarn = false;
bool _isvisiblePassNumberWarn = false;
bool _isVisiblePassCharwarn = false;

  onPasswordChanged(String password){
  final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharachters = false;
      if(password.length>=8){
      _isPasswordEightCharachters = true;
      
      }

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password)){
      _hasPasswordOneNumber=true;}
    
    });
 }

  onEmailChanged(email){
    _isEmailWritternCorrect = true;
    email=email.trim();
    setState(() {
      if (email.isEmpty) {
      _isEmailWritternCorrect = false;
      
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(email)) {
      _isEmailWritternCorrect = false;
      
    }
     // Return null if the input is valid

     
    });
  }

  onNameChange(name){
    _isNameIsNull=false;
    if(name.isEmpty){
      _isNameIsNull=true;
    }
  }
  
  SqlDb sqldb = SqlDb();

TextEditingController userEmail = TextEditingController();
TextEditingController userName = TextEditingController();
TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
   
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [/*
              MaterialButton(onPressed: ()async{
                await sqldb.mydeleteDatabase();
              },child: Text("delete database",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),),),*/
              Image.asset("assets/img/eco3.png",
                  width: media.width * 0.5, fit: BoxFit.contain),
              const Spacer(),
              SizedBox(
                height: 10,
              ),
            
               const SizedBox(
                height: 45,
               child: Text("please enter your email and password",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),),
              ),
              SizedBox(
                height: 10,
              ),
            TextField(controller: userEmail,
                onChanged: (email)=> onEmailChanged(email),
                cursorColor: const Color.fromARGB(255, 188, 68, 2) ,
                style: TextStyle(color: TColor.white, fontSize: 14),
                decoration: InputDecoration(
                 
                  enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 107, 104, 102))
                  ),
                  
                  hintText:"Email Ex:ABC@example.com",
                  hintStyle: const TextStyle(color:Color.fromARGB(255, 188, 68, 2)),
                
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                ),
                
              ),
              if(_isVisibleEmailwarn)
                 Text("email must be entered in the correct format",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),)
              
              ,
              const SizedBox(

                height: 45,
              // child: Text("please enter the email in the correct form",style: TextStyle(color: _isEmailWritternCorrect ? Color.fromARGB(255, 188, 68, 2) : Colors.transparent,),),
              ),

              TextField(controller: userName,
                onChanged: (name)=> onNameChange(name),
                cursorColor: const Color.fromARGB(255, 188, 68, 2) ,
                style: TextStyle(color: TColor.white, fontSize: 14),
                decoration: InputDecoration(
                 
                  enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 107, 104, 102))
                  ),
                  
                  hintText:"name:ex: Ahmed Alaa",
                  hintStyle: const TextStyle(color:Color.fromARGB(255, 188, 68, 2)),
                
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                ),
                
              ),
              if(_isVisibleNamewarn)
                 Text("you must enter a name ",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),),
              
              
              const SizedBox(

                height: 45,
              // child: Text("please enter the email in the correct form",style: TextStyle(color: _isEmailWritternCorrect ? Color.fromARGB(255, 188, 68, 2) : Colors.transparent,),),
              ),
              
              TextField(
                controller: userPassword,
                onChanged: (password)=> onPasswordChanged(password),
                cursorColor: const Color.fromARGB(255, 188, 68, 2) ,
                style: TextStyle(color: TColor.white, fontSize: 14),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    }, 
                    icon: _isVisible? const Icon(Icons.visibility,color: Color.fromARGB(255, 188, 68, 2),) : const Icon(Icons.visibility_off,color: Color.fromARGB(255, 188, 68, 2))
                  ),
                  
                  enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 107, 104, 102))
                  ),
                  hintText:"password Ex:********",
                  hintStyle: const TextStyle(color:Color.fromARGB(255, 188, 68, 2)),
                
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                ),
                
                obscureText: !_isVisible,
              ),
              if(_isvisiblePassNumberWarn)
                Text("password must have atleast one number",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),),

               if(_isVisiblePassCharwarn)
               Text("password should be atleast 8 characters ",style: TextStyle(color:Color.fromARGB(255, 188, 68, 2)),),

              const SizedBox(
                height: 50,
                

              ),

              Row(
                children: [
                  AnimatedContainer(
                    duration:Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _isPasswordEightCharachters ?  const Color.fromARGB(255, 188, 68, 2) : Colors.transparent,
                      border:_isPasswordEightCharachters ? Border.all(color: Colors.transparent):
                       Border.all(color:const Color.fromARGB(255, 128, 126, 126)),
                      borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(child: Icon(Icons.check, color:Colors.black, size: 15,),),
                    ),
                    const SizedBox(width:10),
                    const Text("contains at least 8 characters",style: TextStyle(color: Color.fromARGB(255, 188, 68, 2)),)
                ],
              ),

              const SizedBox(height: 10,),
              Row(
                children: [
                  AnimatedContainer(
                    duration:const Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                       color: _hasPasswordOneNumber ? const Color.fromARGB(255, 188, 68, 2) : Colors.transparent,
                      border:_hasPasswordOneNumber ? Border.all(color: Colors.transparent):
                       Border.all(color:const Color.fromARGB(255, 128, 126, 126)),
                      borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(child: Icon(Icons.check, color:Colors.black, size: 15,),),
                    ),
                    SizedBox(width:10),
                    Text("contains at least 1 number",style: TextStyle(color: Color.fromARGB(255, 188, 68, 2)),)
                ],
              ),
              SizedBox(height: 50,),

             /* MaterialButton(
                height: 40,
                minWidth: double.infinity,
                onPressed:(){

                },
                color: Color.fromARGB(255, 243, 101, 35),
                child: Text("Create Account",style: TextStyle(color: Colors.white),),
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(5)
                ),
                ),
                
               SizedBox(
                height: 50,
              ),*/
              /*Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                      ),
                    ),
                  )
                ],
              ),*/
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 /* Text(
                    "Use 8 or more characters with a mix of letters,\nnumbers & symbols.",
                    style: TextStyle(color: TColor.gray50, fontSize: 12),
                  ),*/
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                title: "Get started, it's free!",
                onPressed: ()async {
  
                /* List<Map> response = await sqldb.readData("SELECT * FROM 'users'");
                  print("$response");*/
                  onEmailChanged(userEmail.text);
                  onPasswordChanged(userPassword.text);
                  onNameChange(userName.text);
                  _isvisiblePassNumberWarn=false;
                  if(_hasPasswordOneNumber==false){
                      _isvisiblePassNumberWarn=true;
                  }
                   _isVisibleEmailwarn=false;
                  if(_isEmailWritternCorrect==false){
                      _isVisibleEmailwarn=true;
                  }
                    _isVisiblePassCharwarn=false;
                if(_isPasswordEightCharachters==false){
                  _isVisiblePassCharwarn=true;
                }
                _isVisibleNamewarn=false;
                if(_isNameIsNull==true){
                  _isVisibleNamewarn=true;
                }
                    if(_isVisibleNamewarn==false && _isVisiblePassCharwarn==false &&_isVisibleEmailwarn==false && _isvisiblePassNumberWarn==false ){
                      int response = await sqldb.insertData("INSERT INTO 'users' ('userName','email','password') VALUES ('${userName.text.trim()}','${userEmail.text.trim()}','${userPassword.text}')");
                      print(response);
                          if(response>0){
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                  builder: (context) => const SignInView(),
                              ),
                            );
                        }
                    }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SocialLoginView(),
                  //   ),
                  // );
                },
              ),
              const Spacer(),
              Text(
                "Do you have already an account?",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                title: "Sign in",
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}