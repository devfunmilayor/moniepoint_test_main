import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widgets/popup_item_widget.dart';

import 'option_btn_widget.dart';


class BottomOptionWidgetsSection extends StatefulWidget {
  const BottomOptionWidgetsSection({super.key, required this.onOptionSelectedChange, required this.optionSelectedIndex});
  final ValueChanged<int> onOptionSelectedChange;
  final int optionSelectedIndex;

  @override
  _BottomOptionWidgetsSectionState createState() => _BottomOptionWidgetsSectionState();

}

class _BottomOptionWidgetsSectionState extends State<BottomOptionWidgetsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPopupVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePopup() {
    setState(() {
      if (!_isPopupVisible) {
        _isPopupVisible = !_isPopupVisible;
        _controller.forward();
      } else {
        _controller.reverse();
        _isPopupVisible = !_isPopupVisible;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width , // or a specific width
      height: size.height * .4,
      child: Stack(
        children: [
          // Your main screen content goes here
          Positioned(
            bottom: 65,
            left: 0,
            child: OptionBtnWidget(
              icon: Icons.layers_outlined,
              onTap: _togglePopup,
            ),
          ),
          // if (_isPopupVisible)
          Positioned(
            bottom: 75,
            left: 10,
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: Alignment.bottomLeft,
              child: _buildPopupContent(onSelected: (val) {
                _togglePopup();
                widget.onOptionSelectedChange(val);
              },
                selectedItem: widget.optionSelectedIndex
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const OptionBtnWidget(
                  icon: Icons.place_rounded,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppPalette.grey.grey20.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.format_align_left,
                              color: AppPalette.pureWhite.withOpacity(.9)),
                          const SizedBox(width: 8),
                          Text(
                            'List of variants',
                            style: TextStyle(
                                color: AppPalette.pureWhite.withOpacity(.9),
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPopupContent({required ValueChanged<int> onSelected,  int selectedItem = 0}) {
    final List<PopUpModel> btnList = [
      PopUpModel(icon: Icons.check_box_outlined, title: 'Cozy areas'),
      PopUpModel(icon: Icons.attach_money, title: 'Price'),
      PopUpModel(icon: Icons.shopping_basket, title: 'Infrastructure'),
      PopUpModel(icon: Icons.layers, title: 'Layer'),
    ];

    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: btnList.asMap().entries.map((e) => PopupOption(
            icon: e.value.icon,
            text: e.value.title,
            onTap: (){
              onSelected(e.key);
            },
            color: selectedItem==e.key ? AppPalette.primary : null,
          )).toList()

        ),
      ),
    );
  }
}

class PopUpModel {
   final IconData icon;
   final String title;

  PopUpModel({required this.icon, required this.title});
}