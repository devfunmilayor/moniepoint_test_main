import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/animations/fade_animation.dart';
import 'package:moniepoint_test/core/animations/scale_transition.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/custom_form_field.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/custom_pop_up_widet.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/random_positioned_item_list.dart';
import 'package:moniepoint_test/gen/assets.gen.dart';

class MainMapScreen extends StatefulWidget {
  const MainMapScreen({Key? key}) : super(key: key);

  @override
  State<MainMapScreen> createState() => _MainMapScreenState();
}

class _MainMapScreenState extends State<MainMapScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _controller;
  TextEditingController controller = TextEditingController();
  int _selectedOption = 0;

  @override
  void initState() {
    super.initState();
    controller.text = 'Saint Petersburg';
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    // Initialize the controller with the total duration
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
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
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              Assets.images.map.path,
              fit: BoxFit.fill,
            ),
          ),
           RandomPositionedContainers(
            controller: _controller,
            childInterval: const Interval(0.8, 1.0, curve: Curves.easeIn),
             containerInterval: const Interval(0.5, 1.0, curve: Curves.easeIn),
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * .7,
                          child: ScaleAnimation(
                            controller: _controller,
                            interval: const Interval(0.0, 0.5, curve: Curves.easeIn),
                            child: CustomTextFormField(
                              hintText: 'Enter your text',
                              preffixIcon: const Icon(Icons.search),
                              onChanged: (value) {
                                // Handle change
                              },
                              validator: (value) {
                                // Validation logic
                                return value?.isEmpty ?? true
                                    ? 'This field is required'
                                    : null;
                              },
                              controller: controller,
                            ),
                          ),
                        ),
                        ScaleAnimation(
                          controller: _controller,
                          interval: const Interval(0.0, 0.5, curve: Curves.easeIn),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.filter_vintage_rounded,
                              size: 20,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: FadeAnimation(
                        controller: _controller,
                        interval: const Interval(0.0, 0.5, curve: Curves.easeIn),
                        child: BottomOptionWidgetsSection(
                          onOptionSelectedChange: (val){
                            setState(() {
                              _selectedOption = val;
                            });
                          },
                          optionSelectedIndex: _selectedOption,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



