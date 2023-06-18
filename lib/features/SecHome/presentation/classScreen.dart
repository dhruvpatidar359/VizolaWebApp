import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:webapp/features/SecHome/presentation/vizoModuleCard.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';
import 'package:webapp/features/SecHome/presentation/disWidget.dart';

import '../../../Constants/constants.dart';

List<String> dataList = []; // Data for the list view
int selectedChip = 0; // Index of the selected chip

List<String> chipIcons = [alpha_icon,beta_icon,gamma_icon];

List<String> dataForChip1 = ['Item 1', 'Item 2', 'Item 3'];
List<String> dataForChip2 = ['Item 4', 'Item 5', 'Item 6'];
List<String> dataForChip3 = ['Item 7', 'Item 8', 'Item 9'];



class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  bool _isMenuOpen = false;
  int indexWD = 0;



  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: Stack(
        children: [
          Container(

    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Wrap(
                        spacing: 8.0,
                        children:
                            List<Widget>.generate(chipLabels.length, (index) {
                          return ChoiceChip(
                            label: Row(
                              children: [
                              Container(
                                height: 32,
                                width: 32,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(chipIcons[index]),
                                  )),

                            ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text(chipLabels[index])
                              ],
                            ),
                            selected: selectedChip == index,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedChip = isSelected ? index : 0;
                                // Update the list data based on the selected chip
                                if (selectedChip == 1) {
                                  dataList = dataForChip1;
                                  
                                  
                                } else if (selectedChip == 2) {
                                  dataList = dataForChip2;
                                } else {
                                  dataList = dataForChip3;
                                }
                                indexWD = index;
                              });
                            },
                          );
                        }),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      // the widget for the discription of the class
                
              DisWidget(key:UniqueKey(),className: chipLabels[indexWD]),

                      Container(
                        width: 1,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: SingleChildScrollView(


                          child: Wrap(

                            children : List.generate(10, (index) => ModuleCard())
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            transform: Matrix4.translationValues(
              _isMenuOpen ? 0.0 : -200.0,
              0.0,
              0.0,
            ),
            child: Container(
              width: 200.0,
              color: Colors.black,
              child: Column(
                children: [
                  // Place your menu items here
                  // Example:
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      // Handle menu item press
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.explore),
                    title: Text('Explore'),
                    onTap: () {
                      // Handle menu item press
                    },
                  ),
                  // Add more menu items as needed
                ],
              ),
            ),
          ),

          // Menu button
          // Positioned(
          //   top: 16.0,
          //   left: 16.0,
          //   child: IconButton(
          //     onPressed: _toggleMenu,
          //     icon: Icon(Icons.menu),
          //   ),
          // ),
        ],
      ),
    );
  }



  AppBar appBar() {
    return  AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ),
      ),
      leading: IconButton(onPressed: _toggleMenu, icon: Icon(Icons.menu)),
      actions: [
        IconButton(
          icon: Icon(Icons.mail),
          onPressed: () {
            // Handle mail button press
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Handle notification button press
          },
        ),
        ProfilePicture(
          name: authRepositoryInstance.name ?? "Null",
          role: authRepositoryInstance.role,
          radius: 20,
          fontsize: 21,
          tooltip: true,
          img: authRepositoryInstance.imageUrl,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

