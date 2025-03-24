
import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';
import 'package:moniepoint_test/core/animations/fade_animation.dart';
import 'package:moniepoint_test/core/animations/reveal_animation.dart';
import 'package:moniepoint_test/features/dashboard/presentation/pages/tab/main_home_screen.dart';
import 'package:moniepoint_test/features/dashboard/presentation/pages/tab/main_map_screen.dart';

late PageController _pageController;
void jumpToPage(int pos){
  _pageController.jumpToPage(pos);
}

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({Key? key,  this.initialIndex = 2}) : super(key: key);
  final int initialIndex;

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late int currentPosition ;
  List<IconData> tabIcon = [Icons.search_outlined, Icons.chat, Icons.home_filled, Icons.favorite, Icons.person ];

  void onPageChanged(int index) {
    setState(() {
      currentPosition = index;
    });
  }

  @override
  void initState() {
    currentPosition = widget.initialIndex;
    _pageController = PageController(initialPage: currentPosition);
    super.initState();
    // Initialize the controller with the total duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    // Start the animation
    Future.delayed(const Duration(milliseconds: 6000), (){
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: onPageChanged,
                  physics: const NeverScrollableScrollPhysics(),
                  children:  [
                    const MainMapScreen(),
                   SingleChildScrollView(
                     child: Container(
                       width: size.width,
                       height: size.height,
                       color: AppPalette.pureWhite,
                       child: const Center(
                         child: Text('Chat Screen'),
                       ),
                     ),
                   ),
                   const MainHomeScreen(),
                    SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        height: size.height,
                        color: AppPalette.pureWhite,
                        child: const Center(
                          child: Text('Favorites Screen'),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: size.width,
                        height: size.height,
                        color: AppPalette.pureWhite,
                        child: const Center(
                          child: Text('Profile Screen'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8,
              left: 0,
              right: 0,
              child: FadeAnimation(
                controller: _controller,
                interval: const Interval(0.0, 0.5, curve: Curves.easeInOut),
                child: RevealAnimation(
                    controller: _controller,
                    interval: const Interval(0.47, 1.0, curve: Curves.easeInOut),
                    direction: RevealDirection.downToUp,
                    child: _buildCustomBottomNav()),
              )
          )
        ],
      ),
    );
  }

  Widget _buildCustomBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      margin: const EdgeInsets.only(bottom: 20, left: 30, right:30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),
        color: AppPalette.offBlack,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: tabIcon.asMap().entries.map((e) {
          return _buildNavItem(tabIcon[e.key], e.key);
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem(IconData icon,  int index) {
    final isSelected = currentPosition == index;

    return InkWell(
      onTap: () => jumpToPage(index),
        borderRadius: BorderRadius.circular(40),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppPalette.primary : AppPalette.pureBlack.withOpacity(.3),
          shape: BoxShape.circle
        ),
        child: Padding(
          padding:  EdgeInsets.all(isSelected ? 18: 13),
          child: Icon(
            icon,
            color: Colors.white , // Active/Inactive colors
            size: isSelected ? 30 : 24, // Enlarge icon when selected
          ),
        ),
      ),
    );
  }
}