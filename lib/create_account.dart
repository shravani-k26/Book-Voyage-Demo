import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}
class _CreateAccountState extends State<CreateAccountPage>{
  TextEditingController _birthday = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFECE2D0),Color(0xFFE07A5F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        child: Text("Create Account",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.person)
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email)
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _birthday,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        hintText: "Enter your Birthday (DD/MM/YYYY)",
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        DateTime? pickedDate= await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate!=null){
                          setState(() {
                            _birthday.text="${pickedDate.day.toString().padLeft(2,'0')}/${pickedDate.month.toString().padLeft(2,'0')}/${pickedDate.year.toString()}";
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                          hintText: "Create Username",
                          prefixIcon: Icon(Icons.person_2)
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                      ).copyWith(
                        overlayColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return const Color(0xFFE07A5F).withOpacity(0.2); // Splash effect color
                            }
                            return null; // Default splash color
                          },
                        ),
                      ),
                      onPressed: (){},
                      child: const Text("Create Account", style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text("Already have an account?", style: theme.textTheme.bodyLarge,),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          splashColor: theme.primaryColor.withOpacity(0.8),
                          child: Text("Login Here!",
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
