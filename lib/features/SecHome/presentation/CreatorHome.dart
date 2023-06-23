import 'package:aurora/aurora.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:go_router/go_router.dart';
import 'package:webapp/features/SecHome/bloc/CreatorHome_bloc.dart';
import 'package:webapp/features/SecHome/bloc/CreatorHome_event.dart';
import 'package:webapp/features/SecHome/bloc/CreatorHome_state.dart';
import 'package:webapp/features/SecHome/data/CardModel.dart';
import 'package:webapp/features/SecHome/data/CreatorHomeRepo.dart';
import 'package:webapp/features/SecHome/presentation/ModuleCard.dart';
import 'package:webapp/features/SecHome/presentation/disWidget.dart';
import 'package:webapp/features/auth/data/repositories/auth_repositories.dart';

import '../../../Constants/constants.dart';

int selectedChip = 0; // Index of the selected chip

List<String> chipIcons = [alpha_icon, beta_icon, gamma_icon];
final CreatorHomeBloc creatorHomeBloc = CreatorHomeBloc();
final CreatorHomeRepositry creatorHomeRepositry = CreatorHomeRepositry();

class CreatorHome extends StatefulWidget {
  const CreatorHome({super.key});

  @override
  State<CreatorHome> createState() => _CreatorHomeState();
}

class _CreatorHomeState extends State<CreatorHome> {
  int indexWD = 0;
  List<CardModel> cardModel = [];

  void getCards(String className) async {
    cardModel = await creatorHomeRepositry.fetchCards(className);
    print(cardModel[0].title);
  }

  void didChangeDependencies() {
    super.didChangeDependencies();

    // Emit the authenticated state when the home screen becomes visible again
    creatorHomeBloc.add(CheckAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatorHomeBloc, CreatorHomeState>(
      bloc: creatorHomeBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is NotAuthCreatorHomeState) {
          context.go("/signin");
        }
      },
      builder: (context, state) {
        if (state is AuthCreatorHomeState) {
          getCards('alpha');
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTopBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 24),
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
                                const SizedBox(
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
                                  // dataList = dataForCwhip1;
                                  getCards('gamma');
                                  print(cardModel[0].title);
                                  
                                } else if (selectedChip == 2) {
                                  // dataList = dataForChip2;

                                  getCards('beta');
                                  print(cardModel[0].title);
                                } else {
                                  // dataList = dataForChip3;

                                  getCards('alpha');
                                  print(cardModel[0].title);
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
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          3, // Adjust the number of cards per row as needed
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                    ),
                    itemCount: cardModel.length,
                    itemBuilder: (context, index) {
                      final card = cardModel[index];
                      return PopularCard1(
                        classImage: classImages[indexWD],
                        title: card.title,
                      );
                    },
                  ),
                ))
              ],
            ),
          );
        }

        return Container(child: const Text("you are still unauthenticated"));
      },
    );
  }
}

class CustomTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              logo,
              width: 100,
              height: 200,
            ),
          ),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
          ),
          Text(authRepositoryInstance.role == "SME" ? "SME" : "3D ANIMATOR"),
          InkWell(
            onTap: () {
              // Action for profile picture tap
              _openDrawer(context);
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ProfilePicture(
                  img: authRepositoryInstance.imageUrl,
                  fontsize: 20.0,
                  name: '',
                  radius: 20.0,
                )),
          ),
        ],
      ),
    );
  }

  void _openDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Action for settings option
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Action for logout option
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
