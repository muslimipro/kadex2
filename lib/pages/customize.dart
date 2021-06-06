import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kadex2/common/constants.dart';
import 'package:kadex2/screens/portfolio/components/search_bar.dart';

class CustomizeCoins extends StatefulWidget {
  @override
  _CustomizeCoinsState createState() => _CustomizeCoinsState();
}

class _CustomizeCoinsState extends State<CustomizeCoins> {
  final searchFocusNode = FocusNode();
  final searchFocusNode2 = FocusNode();
  final searchController = TextEditingController();
  final searchController2 = TextEditingController();
  bool searchFocused = false;
  bool searchFocused2 = false;
  bool backHovered = false;
  int hovered = -1;
  int hovered2 = -1;
  int textHovered = -1;
  int textHovered2 = -1;
  String _searchText = "";
  String _searchText2 = "";
  List<String> filteredCoins = [];
  List<String> filteredCoins2 = [];
  List<String> coins = allCoins;
  List<String> coins2 = [];

  void onSearchFocused() {
    setState(() {
      searchFocused = true;
      searchFocused2 = false;
    });
  }

  void onSearchFocused2() {
    setState(() {
      searchFocused2 = true;
      searchFocused = false;
    });
  }

  void onSearchChanged() {
    filteredCoins = coins;
    _searchText = searchController.text;
    if (_searchText != "") {
      List<String> tempCoins = [];
      for (int i = 0; i < filteredCoins.length; i++) {
        if (filteredCoins[i]
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempCoins.add(filteredCoins[i]);
        }
      }
      setState(() {
        filteredCoins = tempCoins;
      });
    } else {
      setState(() {
        filteredCoins = coins;
      });
    }
  }

  void onSearchChanged2() {
    filteredCoins2 = coins2;
    _searchText2 = searchController2.text;
    if (_searchText2 != "") {
      List<String> tempCoins = [];
      for (int i = 0; i < filteredCoins2.length; i++) {
        if (filteredCoins2[i]
            .toLowerCase()
            .contains(_searchText2.toLowerCase())) {
          tempCoins.add(filteredCoins2[i]);
        }
      }
      setState(() {
        filteredCoins2 = tempCoins;
      });
    } else {
      setState(() {
        filteredCoins2 = coins2;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    filteredCoins = coins;
    filteredCoins2 = coins2;
    searchController.addListener(onSearchChanged);
    searchController2.addListener(onSearchChanged2);
  }

  @override
  void dispose() {
    searchController.dispose();
    searchController2.dispose();
    super.dispose();
  }

  Widget _buildItem(BuildContext context, int index) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              hovered = index;
            });
          },
          onExit: (_) {
            setState(() {
              hovered = -1;
            });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            decoration: borderedBox.copyWith(
              color: hovered == index ? grayscaleExtralight : grayscaleWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/coins/${filteredCoins[index]}.png",
                      height: 24,
                    ),
                    SizedBox(width: 16),
                    Text(
                      filteredCoins[index],
                      style: blockTextStyle,
                    ),
                  ],
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      textHovered = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      textHovered = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        String removedItem = coins[index];
                        coins.removeAt(index);
                        filteredCoins = coins;
                        coins2.add(removedItem);
                        coins2.sort();
                        filteredCoins2 = coins2;
                      });
                    },
                    child: Text(
                      'To your list',
                      style: blockTextStyle.copyWith(
                        color: primaryDefault,
                        decoration: textHovered == index
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildItem2(BuildContext context, int index) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              hovered2 = index;
            });
          },
          onExit: (_) {
            setState(() {
              hovered2 = -1;
            });
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            decoration: borderedBox.copyWith(
              color: hovered2 == index ? grayscaleExtralight : grayscaleWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/coins/${filteredCoins2[index]}.png",
                      height: 24,
                    ),
                    SizedBox(width: 16),
                    Text(
                      filteredCoins2[index],
                      style: blockTextStyle,
                    ),
                  ],
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      textHovered2 = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      textHovered2 = -1;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        String removedItem = coins2[index];
                        coins2.removeAt(index);
                        filteredCoins2 = coins2;
                        coins.add(removedItem);
                        coins.sort();
                        filteredCoins = coins;
                      });
                    },
                    child: SvgPicture.asset(
                      "assets/icons/cancel.svg",
                      color: textHovered2 == index
                          ? grayscaleDarkmode
                          : grayscaleAverage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          searchFocused = false;
          searchFocused2 = false;
        });
      },
      child: Column(
        children: [
          Container(
            height: 844,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: grayscaleWhite,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 694,
                        decoration: borderedBox,
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('List of coins on Binance',
                                style: blockSubtitleStyle),
                            SizedBox(height: 20),
                            SearchBar(
                              searchController: searchController,
                              searchFocusNode: searchFocusNode,
                              searchFocused: searchFocused,
                              onFocus: onSearchFocused,
                              hint: 'Search of coins',
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: ListView.builder(
                                itemCount:
                                    coins == null ? 0 : filteredCoins.length,
                                itemBuilder: _buildItem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        height: 694,
                        decoration: borderedBox,
                        padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your list', style: blockSubtitleStyle),
                            SizedBox(height: 20),
                            SearchBar(
                              searchController: searchController2,
                              searchFocusNode: searchFocusNode2,
                              searchFocused: searchFocused2,
                              onFocus: onSearchFocused2,
                              hint: 'Search of coins',
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: coins2.length == 0
                                  ? Center(
                                      child: Text(
                                        'No coins',
                                        style: blockSubtitleStyle,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: coins2 == null
                                          ? 0
                                          : filteredCoins2.length,
                                      itemBuilder: _buildItem2,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {},
                  style: primaryDefaultButtonStyle.copyWith(
                    minimumSize: MaterialStateProperty.all<Size>(Size(310, 60)),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: grayscaleWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
