import 'package:flutter/material.dart';
import 'package:play_hq/helpers/app_colors.dart';
import 'package:play_hq/screens/nav_bar_screens/widgets/friend_activity_section.dart';
import 'package:play_hq/widgets/custom_text_widget.dart';
import 'package:play_hq/widgets/page_view_tab_widget.dart';

class FriendActivity extends StatefulWidget {
  const FriendActivity({Key? key}) : super(key: key);

  @override
  State<FriendActivity> createState() => _FriendActivityState();
}

class _FriendActivityState extends State<FriendActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextWidget(
              "Friend Activity",
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: PageViewTab(
              tabsExpanded: false,
              tabPadding: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              activeTab: 0,
              tabs: [
                "All",
                "Wishlist",
                "Library",
                Container(
                  height: double.infinity,
                  child: Row(
                    children: [
                      CustomTextWidget(
                        "Friend Requests",
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PRIMARY_COLOR,
                        ),
                        child: CustomTextWidget("10", style: Theme.of(context).primaryTextTheme.bodyText2),
                      )
                    ],
                  ),
                )
              ],
              onTap: ((index) {}),
            ),
          ),
          Expanded(
            child: PageView(
              children: [
                ListView.separated(
                  itemBuilder: (context, index) => ActivitySection(
                    sectionTitle: "Today",
                    cardDetails: [
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        rightSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                      ),
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        buttonOneText: "Accept",
                        buttonTwoText: "Decline",
                        buttonOneOnTap: () {},
                      ),
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        buttonOneText: "Accept",
                        buttonTwoText: "Decline",
                        buttonOneOnTap: () {},
                      ),
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        buttonOneText: "Accept",
                        buttonTwoText: "Decline",
                        buttonOneOnTap: () {},
                      ),
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        buttonOneText: "Accept",
                        buttonTwoText: "Decline",
                        buttonOneOnTap: () {},
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 1.5,
                    width: double.infinity,
                  ),
                  itemCount: 2,
                ),
                ListView.separated(
                  itemBuilder: (context, index) => ActivitySection(
                    sectionTitle: "Today",
                    cardDetails: [
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        rightSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                      ),
                      ActivitySectionCard(
                        text: "James Gordon wants to be friends with you",
                        leftSideImageUrl:
                            "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80",
                        buttonOneText: "Accept",
                        buttonTwoText: "Decline",
                        buttonOneOnTap: () {},
                      )
                    ],
                  ),
                  separatorBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    height: 1.5,
                    width: double.infinity,
                  ),
                  itemCount: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
