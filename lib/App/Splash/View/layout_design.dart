import 'package:flutter/material.dart';

class LayoutDesign extends StatefulWidget {
  LayoutDesign({super.key});

  @override
  State<LayoutDesign> createState() => _LayoutDesignState();
}

class _LayoutDesignState extends State<LayoutDesign> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obsucre = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 60,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 33,
                //     ),
                //     Icon(Icons.arrow_back_ios),
                //   ],
                // ),
                // SizedBox(
                //   height: 33,
                // ),
                // Container(
                //   color: Colors.black,
                //   height: 10,
                //   width: 200,
                // ),
                // SizedBox(
                //   height: 23,
                // ),
                // Text("data"),
                // SizedBox(
                //   height: 42,
                // ),
                // Text("data"),
                // Row(
                //   children: [
                //     Container(
                //       color: Colors.black,
                //       height: 100,
                //       width: 100,
                //     ),
                //     Container(
                //       color: Colors.red,
                //       height: 100,
                //       width: 100,
                //     ),
                //   ],
                // ),
                ///TODO:custom container
                // const CustomContainer(),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Please enter valid email";
                            } else {
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (emailValid == false) {
                                return "Please enter valid email";
                              }
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            hintText: "abc@gmail.com",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            prefixIcon: Icon(Icons.email),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 30,
                            ),
                            // border: InputBorder.none
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      TextFormField(
                          obscureText: obsucre,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            print(value);
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Please enter valid Pssword";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            hintText: "********",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                            prefixIcon: Icon(Icons.email),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  obsucre = !obsucre;
                                });
                              },
                              child: obsucre
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                      size: 30,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                            ),
                            // border: InputBorder.none
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                      SizedBox(
                        height: 100,
                        width: 100,
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        height: 54,
                        minWidth: 300,
                        child: Text("Submit"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("FOrm Filled COmplety");
                          } else {
                            print("FOrm Filled inCOmplety");
                          }
                        },
                      ),
                    ],
                  ),
                ),

                // ClipOval(
                // ClipRRect(
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(100),
                //   child: Image(
                //     image: AssetImage("assets/authentication.png"),
                //     // image: NetworkImage(
                //     //     "https://firebasestorage.googleapis.com/v0/b/internaldev-361116.appspot.com/o/images%2Fprofilepicture_1701448321110_v_2?alt=media"),
                //     // height: 100,
                //     // width: 100,
                //     color: Colors.blue,
                //     // fit: BoxFit.cover,
                //   ),
                // ),

                // Text(
                //   "This is First Text This is First Text This is First Text This is First Text This is First Text This is First Text ",
                //   textAlign: TextAlign.justify,
                //   style: TextStyle(
                //     fontFamily: "Poppins",
                //     decoration: TextDecoration.underline,
                //     color: Colors.blue,
                //     fontSize: 30,
                //     fontWeight: FontWeight.w800,
                //     // backgroundColor: Colors.green,
                //     // letterSpacing: 3,
                //     // wordSpacing: 10,
                //   ),
                // ),
                SizedBox(
                  height: 100,
                  width: 100,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 6,
              blurRadius: 6,
              offset: Offset(-5, 5)),
        ],
        // gradient: LinearGradient(
        //     // stops: [0.2, 0.2, 0.3],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Colors.red,
        //       Colors.green,
        //       Colors.blue,
        //     ]
        //     ),
        color: Colors.red,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
        // BorderRadius.circular(20),
        // border:
        //     Border(top: BorderSide(color: Colors.blue, width: 5))
        // Border.all(color: Colors.white, width: 2)
      ),
    );
  }
}
