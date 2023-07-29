import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:fitness_app/_variables.dart';
import 'package:fitness_app/model/list.dart';
import 'package:fitness_app/service/dataService.dart';
import 'package:motion_toast/motion_toast.dart';

void main() {
  runApp(const MyApp());
}

// Visibility
var _isVisibleBodyPart = true;
var _isVisibleEquipment = false;
var _isVisibleWeight = false;
var _isVisibleNextBtn1 = true;
var _isVisibleNextBtn2 = false;
var _isVisibleNextBtn3 = false;
var _isVisibleWeightRepsText = true;
var _isVisibleRepsText = false;



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BG),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Home")
       

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: B.withOpacity(0.5),
          title: Center(
              child: Text(
                  widget.title,
                  style: TextStyle(
                    fontFamily: "Hanuman",
                    fontSize: 30,
                    color: BG
                  ),
              )
          ),
        ),
        body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(q2),
                fit: BoxFit.cover
            )
        ),
          ),

        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          expandedFabShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          collapsedFabShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
          fanAngle: 90,
          overlayStyle: ExpandableFabOverlayStyle(
            // color: Colors.black.withOpacity(0.5),
            blur: 5,
          ),
          child: const Icon(
            Icons.menu,
            size: 30,
          ),
          backgroundColor: BG,
          closeButtonStyle:  ExpandableFabCloseButtonStyle(backgroundColor: BG),
          children: [
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.fitness_center),
              onPressed: () {
                setState(() {
                  _isVisibleBodyPart = true;
                  _isVisibleEquipment = false;
                  _isVisibleWeight = false;
                  _isVisibleNextBtn2 = false;
                  _isVisibleNextBtn3 = false;
                  _isVisibleNextBtn1 = true;
                  trigger = false;
                  workoutMainText = "Body Part";
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const WorkoutPage();
                  }));
                });

              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.list),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ListPage(title: 'List',);
                }));
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.bar_chart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

  }
}

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage>  {

  var _dataService = DataService();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: B.withOpacity(0.5),
          title: Center(
              child: Text(
                "Workout",
                style: TextStyle(
                    fontFamily: "Hanuman",
                    fontSize: 30,
                    color: BG
                ),
              )
          ),
        ),
        body: Stack(
          children:[
            Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(q4),
                    fit: BoxFit.cover
                )
            ),
          ),
            Visibility(
              visible: _isVisibleBodyPart,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: B.withOpacity(0.5),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              value1 = 1.0;
                              value2 = 0.0;
                              value3 = 0.0;
                              value4 = 0.0;

                            });
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: SizedBox(
                              width: 190,
                              height: 190,
                              child: Container(
                                padding: EdgeInsets.all(2), // Border width
                                decoration: BoxDecoration(color: Colors.blue.withOpacity(value1), borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48), // Image radius
                                    child: Image.asset(
                                        q7,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              value1 = 0.0;
                              value2 = 1.0;
                              value3 = 0.0;
                              value4 = 0.0;
                            });
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: SizedBox(
                              width: 190,
                              height: 190,
                              child: Container(
                                padding: EdgeInsets.all(2), // Border width
                                decoration: BoxDecoration(color: Colors.blue.withOpacity(value2), borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48), // Image radius
                                    child: Image.asset(
                                        q5,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              value1 = 0.0;
                              value2 = 0.0;
                              value3 = 1.0;
                              value4 = 0.0;
                            });
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: SizedBox(
                              width: 190,
                              height: 190,
                              child: Container(
                                padding: EdgeInsets.all(2), // Border width
                                decoration: BoxDecoration(color: Colors.blue.withOpacity(value3), borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48), // Image radius
                                    child: Image.asset(
                                        q6,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              value1 = 0.0;
                              value2 = 0.0;
                              value3 = 0.0;
                              value4 = 1.0;
                            });
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(top:50.0),
                            child: SizedBox(
                              width: 190,
                              height: 190,
                              child: Container(
                                padding: EdgeInsets.all(2), // Border width
                                decoration: BoxDecoration(color: Colors.blue.withOpacity(value4), borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(48), // Image radius
                                    child: Image.asset(
                                        q8,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisibleEquipment,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: B.withOpacity(0.5),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (value1 == 1.0) ... [
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 1.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;

                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip1), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q9,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 1.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip2), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q10,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 1.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip3), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q11,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 1.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip4), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 1.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip5), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q32,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 1.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip6), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q33,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 1.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip7), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q34,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 1.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip8), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 1.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip9), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 1.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip10), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q37,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 1.0;
                                valueEquip12 = 0.0;

                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip11), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q13,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                                valueEquip9 = 0.0;
                                valueEquip10 = 0.0;
                                valueEquip11 = 0.0;
                                valueEquip12 = 1.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip12), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q14,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                        else if (value2 == 1.0) ... [
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 1.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;

                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip1), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q13,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 1.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip2), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q14,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 1.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip3), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q16,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 1.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip4), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q18,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 1.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip5), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q36,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 1.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 0.0;

                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip6), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q37,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 1.0;
                                valueEquip8 = 0.0;

                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip7), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q35,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState((){
                                valueEquip1 = 0.0;
                                valueEquip2 = 0.0;
                                valueEquip3 = 0.0;
                                valueEquip4 = 0.0;
                                valueEquip5 = 0.0;
                                valueEquip6 = 0.0;
                                valueEquip7 = 0.0;
                                valueEquip8 = 1.0;
                              });
                            },
                            child:  Padding(
                              padding: const EdgeInsets.only(top:50.0),
                              child: SizedBox(
                                width: 190,
                                height: 190,
                                child: Container(
                                  padding: const EdgeInsets.all(2), // Border width
                                  decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip8), borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        q34,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                        else if (value3 == 1.0) ... [
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 1.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip1), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q21,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 1.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip2), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q23,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 1.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip3), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 1.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip4), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 1.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: const EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip5), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q35,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 1.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: const EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip6), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q34,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 1.0;
                                  valueEquip8 = 0.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: const EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip7), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q38,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          GestureDetector(
                              onTap: (){
                                setState((){
                                  valueEquip1 = 0.0;
                                  valueEquip2 = 0.0;
                                  valueEquip3 = 0.0;
                                  valueEquip4 = 0.0;
                                  valueEquip5 = 0.0;
                                  valueEquip6 = 0.0;
                                  valueEquip7 = 0.0;
                                  valueEquip8 = 1.0;
                                });
                              },
                              child:  Padding(
                                padding: const EdgeInsets.only(top:50.0),
                                child: SizedBox(
                                  width: 190,
                                  height: 190,
                                  child: Container(
                                    padding: const EdgeInsets.all(2), // Border width
                                    decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip8), borderRadius: BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                          q39,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ]
                        else if (value4 == 1.0) ... [
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 1.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip1), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q26,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 1.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip2), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q29,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 1.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip3), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 1.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip4), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q31,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 1.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip5), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 1.0;
                                    valueEquip7 = 0.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip6), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q42,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          GestureDetector(
                                onTap: (){
                                  setState((){
                                    valueEquip1 = 0.0;
                                    valueEquip2 = 0.0;
                                    valueEquip3 = 0.0;
                                    valueEquip4 = 0.0;
                                    valueEquip5 = 0.0;
                                    valueEquip6 = 0.0;
                                    valueEquip7 = 1.0;

                                  });
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.only(top:50.0),
                                  child: SizedBox(
                                    width: 190,
                                    height: 190,
                                    child: Container(
                                      padding: EdgeInsets.all(2), // Border width
                                      decoration: BoxDecoration(color: Colors.blue.withOpacity(valueEquip7), borderRadius: BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.asset(
                                            q43,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        ]

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisibleWeight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: B.withOpacity(0.5),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: Row(
                    children: [
                      Visibility(
                        visible: _isVisibleWeightRepsText,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Container(
                            width: 120,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  weightValue = int.parse(value);
                                },
                                textAlign: TextAlign.center,
                                cursorColor: BG,
                                style:  TextStyle(
                                    color: BG,
                                    fontWeight: FontWeight.bold,
                                    ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: B,
                                  hintStyle: TextStyle(color: BG),
                                  hintText: "Weight(Kg)",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),

                              )
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isVisibleWeightRepsText,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 47.0),
                          child: Container(
                            width: 120,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  repsValue = int.parse(value);
                                },
                                textAlign: TextAlign.center,
                                cursorColor: BG,
                                style:  TextStyle(
                                    color: BG,
                                    fontWeight: FontWeight.bold,
                                    ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: B,
                                  hintStyle: TextStyle(color: BG),
                                  hintText: "Reps",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isVisibleRepsText,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: Container(
                            width: 130,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  onlyRepsValue = int.parse(value);
                                },
                                textAlign: TextAlign.center,
                                cursorColor: BG,
                                style:  TextStyle(
                                    color: BG,
                                    fontWeight: FontWeight.bold,
                                    ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: B,
                                  hintStyle: TextStyle(color: BG),
                                  hintText: "Reps",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 200),
              child: Center(
                child: Container(
                  width: 250,
                  height: 70,
                  decoration:
                  BoxDecoration(
                      color: B.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      border: Border.all(
                        color: DG,
                        width: 2
                      )
                  ),
                  child: Center(
                    child: Text(
                      workoutMainText,
                      style: TextStyle(
                        fontFamily: "Hanuman",
                        fontSize: 30,
                        color: BG
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisibleNextBtn1,
              child: Padding(
                padding:  const EdgeInsets.only(bottom: 15.0,left: 15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: BG,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (value1 == 1.0 || value2 == 1.0 || value3 == 1.0 || value4 == 1.0) {
                            _isVisibleNextBtn2 = true;
                            _isVisibleBodyPart = false;
                            _isVisibleEquipment = true;
                            workoutMainText = "Equipment";
                            _isVisibleNextBtn1 = false;
                          }

                        });
                      },
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: B,
                        size: 40,
                      ),

                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisibleNextBtn2,
              child: Padding(
                padding:  const EdgeInsets.only(bottom: 15.0,left: 15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: BG,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (value1 == 1) {
                            if (valueEquip1 == 1) {
                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else {
                              _isVisibleWeightRepsText = true;
                              _isVisibleRepsText = false;
                            }
                          }
                          else if (value3 == 1) {
                            if (valueEquip1 == 1) {
                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else if (valueEquip3 == 1) {
                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else if (valueEquip4 == 1) {

                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else if (valueEquip7 == 1) {

                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else if (valueEquip8 == 1) {

                              _isVisibleWeightRepsText = false;
                              _isVisibleRepsText = true;
                            }
                            else {
                              _isVisibleWeightRepsText = true;
                              _isVisibleRepsText = false;
                            }
                          }
                          else {
                            _isVisibleWeightRepsText = true;
                            _isVisibleRepsText = false;
                          }

                          if (valueEquip1 == 1 || valueEquip2 == 1 || valueEquip3 == 1 || valueEquip4 == 1 || valueEquip5 == 1 || valueEquip6 == 1 || valueEquip7 == 1 || valueEquip8 == 1 || valueEquip9 == 1 || valueEquip10 == 1 || valueEquip11 == 1 || valueEquip12 == 1) {
                            workoutMainText = "Weight & Reps";
                            _isVisibleNextBtn3 = true;
                            _isVisibleNextBtn2 = false;
                            _isVisibleBodyPart = false;
                            _isVisibleEquipment = false;
                            _isVisibleWeight = true;

                          }


                        });
                      },
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: B,
                        size: 40,
                      ),

                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _isVisibleNextBtn3,
              child: Padding(
                padding:  const EdgeInsets.only(bottom: 15.0,left: 15.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: BG,
                    ),
                    child: IconButton(
                      onPressed: ()  async {
                        setState(() {
                          if (weightValue != 0 && repsValue != 0) {
                            _isVisibleNextBtn2 = false;
                            _isVisibleNextBtn3 = false;
                            _isVisibleEquipment = false;
                            _isVisibleBodyPart = false;
                            _isVisibleWeight = false;
                            timestamp = DateTime.now().millisecondsSinceEpoch;
                            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
                            nowDate = tsdate.day.toString() + "/" + tsdate.month.toString() + "/" + tsdate.year.toString();
                            if (value1 == 1) {
                              MbodyPart = "Biceps";
                              if (valueEquip1 == 1) {
                                Mequipment = q9;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q10;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q11;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q12;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q32;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q33;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q34;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip9 == 1) {
                                Mequipment = q36;
                              }
                              else if (valueEquip10 == 1) {
                                Mequipment = q37;
                              }
                              else if (valueEquip11 == 1) {
                                Mequipment = q13;
                              }
                              else if (valueEquip12 == 1) {
                                Mequipment = q14;
                              }
                            }
                            else if (value2 == 1) {
                              MbodyPart = "Chest";
                              if (valueEquip1 == 1) {
                                Mequipment = q13;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q14;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q16;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q18;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q36;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q37;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q34;
                              }
                            }
                            else if (value3 == 1) {
                              MbodyPart = "Abs";
                              if (valueEquip1 == 1) {
                                Mequipment = q21;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q23;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q24;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q25;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q34;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q38;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q39;
                              }
                            }
                            else if (value4 == 1) {
                              MbodyPart = "Legs";
                              if (valueEquip1 == 1) {
                                Mequipment = q26;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q29;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q30;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q31;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q40;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q42;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q43;
                              }
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const ListPage(title: 'List');
                            }));
                          }
                          if (onlyRepsValue != 0) {
                            _isVisibleNextBtn2 = false;
                            _isVisibleNextBtn3 = false;
                            _isVisibleEquipment = false;
                            _isVisibleBodyPart = false;
                            _isVisibleWeight = false;
                            _isVisibleRepsText = false;
                            timestamp = DateTime.now().millisecondsSinceEpoch;
                            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
                            nowDate = tsdate.day.toString() + "/" + tsdate.month.toString() + "/" + tsdate.year.toString();
                            if (value1 == 1) {
                              MbodyPart = "Biceps";
                              if (valueEquip1 == 1) {
                                Mequipment = q9;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q10;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q11;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q12;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q32;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q33;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q34;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip9 == 1) {
                                Mequipment = q36;
                              }
                              else if (valueEquip10 == 1) {
                                Mequipment = q37;
                              }
                              else if (valueEquip11 == 1) {
                                Mequipment = q13;
                              }
                              else if (valueEquip12 == 1) {
                                Mequipment = q14;
                              }
                            }
                            else if (value2 == 1) {
                              MbodyPart = "Chest";
                              if (valueEquip1 == 1) {
                                Mequipment = q13;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q14;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q16;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q18;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q36;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q37;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q34;
                              }
                            }
                            else if (value3 == 1) {
                              MbodyPart = "Abs";
                              if (valueEquip1 == 1) {
                                Mequipment = q21;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q23;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q24;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q25;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q35;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q34;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q38;
                              }
                              else if (valueEquip8 == 1) {
                                Mequipment = q39;
                              }
                            }
                            else if (value4 == 1) {
                              MbodyPart = "Legs";
                              if (valueEquip1 == 1) {
                                Mequipment = q26;
                              }
                              else if (valueEquip2 == 1) {
                                Mequipment = q29;
                              }
                              else if (valueEquip3 == 1) {
                                Mequipment = q30;
                              }
                              else if (valueEquip4 == 1) {
                                Mequipment = q31;
                              }
                              else if (valueEquip5 == 1) {
                                Mequipment = q40;
                              }
                              else if (valueEquip6 == 1) {
                                Mequipment = q42;
                              }
                              else if (valueEquip7 == 1) {
                                Mequipment = q43;
                              }
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const ListPage(title: "List");
                            }));
                          }
                        });
                        if (weightValue != 0 && repsValue != 0) {
                          var _data = ModelList();
                          _data.equipment = Mequipment;
                          _data.weight = weightValue;
                          _data.reps = repsValue;
                          _data.date = nowDate;
                          var result = await _dataService.SaveData(_data);
                          print(result);
                        }
                        if (onlyRepsValue != 0) {
                          var _data = ModelList();
                          _data.equipment = Mequipment;
                          _data.weight = 0;
                          _data.reps = repsValue;
                          _data.date = nowDate;
                          var result = await _dataService.SaveData(_data);
                          print(result);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_right_alt_rounded,
                        color: B,
                        size: 40,
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          expandedFabShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          collapsedFabShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          fanAngle: 90,
          overlayStyle: ExpandableFabOverlayStyle(
            // color: Colors.black.withOpacity(0.5),
            blur: 5,
          ),
          child: const Icon(
            Icons.menu,
            size: 30,
          ),
          backgroundColor: BG,
          closeButtonStyle:  ExpandableFabCloseButtonStyle(backgroundColor: BG),
          children: [
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: Icon(homeIcon,size: 40),
              onPressed: () {
                setState(() {
                  if (_isVisibleEquipment == false && _isVisibleWeight == false) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const MyHomePage(title: 'Home',);
                    }));
                  }
                  else if (_isVisibleEquipment == true) {
                    _isVisibleBodyPart = true;
                    _isVisibleEquipment = false;
                    _isVisibleNextBtn2 = false;
                    workoutMainText = "Body part";
                    _isVisibleNextBtn1 = true;
                  }
                  else if (_isVisibleWeight == true) {
                    workoutMainText = "Equipment";
                    _isVisibleNextBtn3 = false;
                    _isVisibleNextBtn2 = true;
                    _isVisibleEquipment = true;
                    _isVisibleWeight = false;
                  }

                });
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ListPage(title: 'Home',);
                }));
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.bar_chart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key, required String title});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  late List<ModelList> _dataList;
  final _dataService = DataService();

  getAllData() async {
    _dataList=<ModelList>[];
    var totData = await _dataService.readAllData();
    totData.forEach((data){
      setState(() {
        var dataModel = ModelList();
        dataModel.id = data["id"];
        dataModel.equipment = data["equipment"];
        dataModel.weight = data["weight"];
        dataModel.reps = data["reps"];
        dataModel.date = data["date"];
        _dataList.add(dataModel);
      });
    });
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  _deleteListData(BuildContext context, id) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
          backgroundColor: B,
            title: Text(
              'Are You Sure to Delete',
              style: TextStyle(color: BG, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: ()  async{
                    var result=await _dataService.deleteData(id);
                    setState(() {
                      if (result != null) {
                        Navigator.pop(context);
                        getAllData();
                      }
                    });


                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: B.withOpacity(0.5),
          title: Center(
              child: Text(
                "List",
                style: TextStyle(
                    fontFamily: "Hanuman",
                    fontSize: 30,
                    color: BG
                ),
              )
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(q45),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: double.infinity,
                child: ListView.builder(itemCount:_dataList.length,itemBuilder: (context,index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:30.0,top: 20),
                      child: Container(
                        height: 390,
                        decoration: BoxDecoration(
                            color: B,
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: BG,
                                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                                  ),
                                  child: IconButton(
                                    onPressed: (){
                                      _deleteListData(context,_dataList[index].id);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: B,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 230.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: B,
                                    height: 60,
                                    child:   Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 80.0),
                                          child: Text(
                                            "Weight : " + _dataList[index].weight.toString() + " Kgs",
                                            style: TextStyle(
                                                color: BG
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Reps : " +_dataList[index].reps.toString(),
                                          style: TextStyle(
                                              color: BG
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: 285,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)), // Image border
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(48), // Image radius
                                      child: Image.asset(
                                        _dataList[index].equipment.toString(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  );
                }

                ),
              ),
            ),
          ]
        ),

        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          expandedFabShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          collapsedFabShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          fanAngle: 90,
          overlayStyle: ExpandableFabOverlayStyle(
            // color: Colors.black.withOpacity(0.5),
            blur: 5,
          ),
          child: const Icon(
            Icons.menu,
            size: 30,
          ),
          backgroundColor: BG,
          closeButtonStyle:  ExpandableFabCloseButtonStyle(backgroundColor: BG),
          children: [
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: Icon(realHomeIcon),
              onPressed: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MyHomePage(title: 'Home',);
                  }));
                });
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.fitness_center),
              onPressed: () {
                _isVisibleBodyPart = true;
                _isVisibleEquipment = false;
                _isVisibleWeight = false;
                _isVisibleNextBtn2 = false;
                _isVisibleNextBtn3 = false;
                _isVisibleNextBtn1 = true;
                trigger = false;
                workoutMainText = "Body Part";
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WorkoutPage();
                }));
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              backgroundColor: BG,
              child: const Icon(Icons.bar_chart),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }


}

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}