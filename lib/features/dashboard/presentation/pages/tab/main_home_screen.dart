import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';
import 'package:moniepoint_test/core/animations/fade_animation.dart';
import 'package:moniepoint_test/core/animations/reveal_animation.dart';
import 'package:moniepoint_test/core/animations/scale_transition.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/offer_widget_item.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/real_estates_img_widget.dart';
import 'package:moniepoint_test/features/splash/presentation/widgets/circular_profile_widget.dart';
import 'package:moniepoint_test/gen/assets.gen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key, this.index = 0}) : super(key: key);
  final int index;

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  final List<String> images = [
    Assets.images.house.path,
    Assets.images.house7.path,
    Assets.images.house2.path,
    Assets.images.house3.path,
    Assets.images.house4.path,
    Assets.images.house5.path,
    Assets.images.house6.path,
    Assets.images.house7.path,
    Assets.images.house3.path,
    Assets.images.house4.path,
    Assets.images.house2.path,
    Assets.images.house6.path,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    // Initialize the controller with the total duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10000),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
              colors: [
                const Color(0xFFF39814).withOpacity(0.4),
                const Color(0xFFF39814).withOpacity(0.1),
                const Color(0xFFF39814).withOpacity(0.05),
              ],
            )),
        child: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              // Sliver for the upper section: Location, Greeting, and Offer Cards
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RevealAnimation(
                            controller: _controller,
                            interval: const Interval(0.0, 0.15, curve: Curves.easeInOut),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: FadeAnimation(
                                controller: _controller,
                                interval: const Interval(0.15, 0.25, curve: Curves.easeIn), // Second half of the animation
                                child: const Row(
                                  children: [
                                    Icon(Icons.location_on, color: Color(0xFF8E8E93)),
                                    SizedBox(width: 8),
                                    Text(
                                      'Saint Petersburg',
                                      style: TextStyle(
                                        color: Color(0xFF8E8E93),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          RevealAnimation(
                              controller: _controller,
                              interval: const Interval(0.0, 0.15, curve: Curves.easeInOut),
                              child: const CircularProfilePhotoWidget(imageUrl: 'https://mighty.tools/mockmind-api/content/human/57.jpg')),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeAnimation(
                              controller: _controller,
                              interval: const Interval(0.25, 0.4, curve: Curves.easeIn),
                              child: Text(
                                'Hi, Marina',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: AppPalette.grey.grey150,
                                ),
                              ),
                            ),
                            FadeAnimation(
                              controller: _controller,
                              interval: const Interval(0.4, 0.55, curve: Curves.easeIn),
                              child: RevealAnimation(
                                controller: _controller,
                                interval: const Interval(0.42, 0.55, curve: Curves.easeInOut),
                                direction: RevealDirection.downToUp,
                                child: SizedBox(
                                  width: size.width * .7,
                                  child: const Text(
                                    'let\'s select your perfect place',
                                    style: TextStyle(
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScaleAnimation(
                        controller: _controller,
                        interval: const Interval(0.55, 0.7, curve: Curves.easeIn),
                        child: OfferCard(
                          title: 'BUY',
                          offers: 1034,
                          interval:  const Interval(0.705, 0.8, curve: Curves.linear),
                          controller: _controller,
                          isRounded: true,
                          backgroundColor: const Color(0xFFF39814),
                        ),
                      ),
                      ScaleAnimation(
                        controller: _controller,
                        interval: const Interval(0.55, 0.7, curve: Curves.easeIn),
                        child: OfferCard(
                          title: 'RENT',
                          offers: 2212,
                          interval:  const Interval(0.705, 0.8, curve: Curves.linear),
                          controller: _controller,
                          backgroundColor: Colors.white,
                          textColor: const Color(0xFF747477),
                        ),
                      ),
                    ],
                  )
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 30), // Adjust padding as needed
                sliver: SliverToBoxAdapter(
                  child: RevealAnimation(
                    controller: _controller,
                    interval: const Interval(0.7, 0.85, curve: Curves.easeInOut),
                    direction: RevealDirection.downToUp,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.fromLTRB(10, 15, 10, size.height * .2),
                      child: GridView.custom(
                        physics: const NeverScrollableScrollPhysics(), // Prevent scrolling
                        shrinkWrap: true, // Allow GridView to take its size
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            const QuiltedGridTile(1, 2),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(2, 1),
                            const QuiltedGridTile(1, 1),
                            const QuiltedGridTile(1, 2),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                              (context, index) => RealEstatesWidget(image: images[index], index: index,
                              controller: _controller,
                                containerInterval: const Interval(0.8, 0.9, curve: Curves.easeInOut),
                                textInterval: const Interval(0.9, 1.0, curve: Curves.easeInOut),
                                arrowInterval: const Interval(0.8, 0.9, curve: Curves.easeIn),
                              ),
                          childCount: images.length,
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
    );
  }
}

