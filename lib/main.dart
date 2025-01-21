import 'package:crypto_wallet_ui/app_data/fake_data.dart';
import 'package:crypto_wallet_ui/my_colors.dart';
import 'package:crypto_wallet_ui/my_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



// Crypto Wallet Ui
// Follow Me On Instagram
// @Parsanik.dev



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: myAppBar(screenSize),
          body: homeScreen(screenSize),
          bottomNavigationBar: bottomMenuBar()),
    );
  }

  BottomAppBar bottomMenuBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              //click
            },
            child: const Column(
              children: [
                Icon(
                  Icons.home,
                  size: 28,
                ),
                Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //click
            },
            child: const Column(
              children: [
                Icon(
                  Icons.edit_note_rounded,
                  size: 28,
                ),
                Text("History", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //click
            },
            child: const Column(
              children: [
                Icon(
                  Icons.credit_card,
                  size: 28,
                ),
                Text("Card", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //click
            },
            child: const Column(
              children: [
                Icon(
                  Icons.more_horiz,
                  size: 28,
                ),
                Text("More", style: TextStyle(fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea homeScreen(Size screenSize) {
    return SafeArea(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17, top: 18),
                child: Text(
                  "Recent Transfers",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
          recentTransfers(screenSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 17),
                child: Text(
                  "Latest Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 17),
                child: Text(
                  "View all",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: SolidColors.hintColor),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          latestTransaction(screenSize),
        ],
      ),
    );
  }

  Expanded latestTransaction(Size screenSize) {
    return Expanded(
        child: ListView.builder(
            itemCount: cryptoList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenSize.width / 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    cryptoList[index].cryptoImageUrl,
                                  ),
                                  radius: 23.5,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cryptoList[index].name,
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    cryptoList[index].time,
                                    style:
                                        TextStyle(color: SolidColors.hintColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //
                        //
                        //
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cryptoList[index].priceStatus,
                                    style: TextStyle(
                                        color: cryptoList[index].statusColor),
                                  ),
                                  Icon(
                                    Icons.euro,
                                    size: 14,
                                    color: cryptoList[index].statusColor,
                                  ),
                                  Text(
                                    cryptoList[index].price,
                                    style: TextStyle(
                                        color: cryptoList[index].statusColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print('Details Clicked Index == $index');
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Divider(thickness: 1),
                    ),
                  ],
                ),
              );
            }));
  }

  SizedBox recentTransfers(Size screenSize) {
    return SizedBox(
      height: screenSize.height / 7,
      child: Padding(
        padding: const EdgeInsets.all(9),
        //
        //
        //
        //
        child: Padding(
          padding: const EdgeInsets.only(left: 9, right: 9),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // 5 items per row
              childAspectRatio: 1.55,
              crossAxisSpacing: 1,
              mainAxisSpacing: 17,
            ),
            itemCount: usersList.length, // Total number of items
            itemBuilder: ((context, index) {
              return CircelAvatarItem(index: index);
            }),
          ),
        ),

        //
        //
        //
        //
      ),
    );
  }

  AppBar myAppBar(Size screenSize) {
    return AppBar(
      backgroundColor: SolidColors.backgroundAppbar,
      toolbarHeight: screenSize.height / 3,
      actions: [
        Expanded(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 17, bottom: 8),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/94043228?v=4"),
                        radius: 27,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 14),
                      child: Text(
                        MyStrings.appBarName,
                        style: TextStyle(color: SolidColors.appbarTexts),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 17, bottom: 30),
                  child: Icon(
                    Icons.settings,
                    size: 28,
                    color: SolidColors.appbarTexts,
                  ),
                ),
              ],
            ),
            Container(
              width: screenSize.width / 1.08,
              height: screenSize.height / 4.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: GradiantColors.appBar,
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Main Balance",
                      style: TextStyle(color: SolidColors.hintColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.euro,
                        color: SolidColors.appbarTexts,
                        size: 36,
                      ),
                      Text(
                        "14,234",
                        style: TextStyle(
                            color: SolidColors.appbarTexts,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          ".83",
                          style: TextStyle(
                              color: SolidColors.appbarTexts,
                              fontSize: 21,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 20, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("Top Up click");
                            //Top Up click
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.arrow_up,
                                color: SolidColors.appbarTexts,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Top Up",
                                  style:
                                      TextStyle(color: SolidColors.appbarTexts),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                thickness: 3,
                                color: SolidColors.appbarDivider,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("Withdraw click");
                            //Withdraw click
                          },
                          child: Column(
                            children: [
                              Icon(
                                CupertinoIcons.arrow_down,
                                color: SolidColors.appbarTexts,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Withdraw",
                                  style:
                                      TextStyle(color: SolidColors.appbarTexts),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                thickness: 3,
                                color: SolidColors.appbarDivider,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("transfer click");
                            // transfer click
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.history,
                                color: SolidColors.appbarTexts,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Transfer",
                                  style:
                                      TextStyle(color: SolidColors.appbarTexts),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}

class CircelAvatarItem extends StatelessWidget {
  final int index;

  const CircelAvatarItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 38.4,
          backgroundImage: NetworkImage(usersList[index].userImageUrl),
        ),
        Text(usersList[index].user)
      ],
    );
  }
}
