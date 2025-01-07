import 'package:flutter/material.dart';
import 'package:book_voyage_demo/create_account.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFECE2D0),Color(0xFFE07A5F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        height: 300,
                        width: 600,
                        child: Image.asset("assets/images/logo.png",)),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Center(child: Text("Welcome Back!", style: TextStyle(
                        fontSize: 23,
                        color:Color(0xFFB64242),
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username'
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      obscureText: true,
                      decoration:InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                      ) ,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF9B2226),
                      ).copyWith(
                        overlayColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Color(0xFFE07A5F).withOpacity(0.2); // Splash effect color
                            }
                            return null; // Default splash color
                          },
                        ),
                      ),
                      child: const Text("Login",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),),
                    ),
                    const SizedBox(height: 10),
                    const Center(child: Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.w500),)),
                    const SizedBox(height:20),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Or Connect with Google",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: (){},
                              icon: Image.asset("assets/images/google.png", height:30,width: 30,),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text("New to Book Voyage?", style: theme.textTheme.bodyLarge,),
                            ),
                            InkWell(
                                splashColor: theme.primaryColor.withOpacity(0.8),
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CreateAccountPage()
                                      )
                                  );
                                },
                                child: Text("Create an account!",
                                  style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}