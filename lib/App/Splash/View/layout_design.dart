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
              children: [
                Container(
                  color: Colors.grey,
                  height: 300,
                  width: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 250,
                          width: 300,
                          color: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 200,
                //   child: ListView.builder(
                //       // shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       // physics: NeverScrollableScrollPhysics(),
                //       itemCount: 6,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Container(
                //             height: 100,
                //             width: 100,
                //             color: Colors.black,
                //           ),
                //         );
                //       }),
                // ),
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
