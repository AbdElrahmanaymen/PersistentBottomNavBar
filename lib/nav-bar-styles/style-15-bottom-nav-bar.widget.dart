part of persistent_bottom_nav_bar;

class BottomNavStyle15 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;
  final NavBarDecoration? navBarDecoration;

  BottomNavStyle15({
    Key? key,
    this.navBarEssentials = const NavBarEssentials(items: null),
    this.navBarDecoration = const NavBarDecoration(),
  });

  Widget _buildItem(BuildContext context, PersistentBottomNavBarItem item,
      bool isSelected, double? height) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : Container(
            width: 150.0,
            height: height,
            color: Colors.transparent,
            padding: EdgeInsets.only(
                top: this.navBarEssentials!.padding?.top ??
                    this.navBarEssentials!.navBarHeight! * 0.15,
                bottom: this.navBarEssentials!.padding?.bottom ??
                    this.navBarEssentials!.navBarHeight! * 0.12),
            child: Container(
              alignment: Alignment.center,
              height: height,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: IconTheme(
                          data: IconThemeData(
                              size: item.iconSize,
                              color: isSelected
                                  ? (item.activeColorSecondary == null
                                      ? item.activeColorPrimary
                                      : item.activeColorSecondary)
                                  : item.inactiveColorPrimary == null
                                      ? item.activeColorPrimary
                                      : item.inactiveColorPrimary),
                          child: isSelected
                              ? item.icon
                              : item.inactiveIcon ?? item.icon,
                        ),
                      ),
                      item.title == null
                          ? SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Material(
                                type: MaterialType.transparency,
                                child: FittedBox(
                                    child: ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                          transform: GradientRotation(-180 * (math.pi / 180)),
                          begin:
                              Alignment(1.396263599395752, 0.2368917167186737),
                          end: Alignment(
                              -0.2368917167186737, 0.07294762879610062),
                          colors: [
                            (isSelected)
                                ? Color.fromRGBO(
                                    149, 46, 191, 0.9800000190734863)
                                : Color(0xFF484451),
                            (isSelected)
                                ? Color.fromRGBO(214, 41, 118, 1)
                                : Color(0xFF484451)
                          ]).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
                                      child:Text(
                                  item.title!,
                                  
                                      : TextStyle(
                                          
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8),
                                ))),
                              ),
                            )
                    ],
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildMiddleItem(
      PersistentBottomNavBarItem item, bool isSelected, double? height) {
    return this.navBarEssentials!.navBarHeight == 0
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(
                top: this.navBarEssentials!.padding?.top ?? 0.0,
                bottom: this.navBarEssentials!.padding?.bottom ?? 0.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, -23),
                  child: Center(
                    child: Container(
                      width: 150.0,
                      height: height,
                      margin: EdgeInsets.only(top: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.activeColorPrimary,
                        border:
                            Border.all(color: Colors.transparent, width: 5.0),
                        boxShadow: this.navBarDecoration!.boxShadow,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: height,
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: IconTheme(
                                    data: IconThemeData(
                                        size: item.iconSize,
                                        color: item.activeColorSecondary == null
                                            ? item.activeColorPrimary
                                            : item.activeColorSecondary),
                                    child: isSelected
                                        ? item.icon
                                        : item.inactiveIcon ?? item.icon,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                item.title == null
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            type: MaterialType.transparency,
                            child: FittedBox(
                                child: Text(
                              item.title!,
                              style: item.textStyle != null
                                  ? (item.textStyle!.apply(
                                      color: isSelected
                                          ? (item.activeColorSecondary == null
                                              ? item.activeColorPrimary
                                              : item.activeColorSecondary)
                                          : item.inactiveColorPrimary))
                                  : TextStyle(
                                      color: isSelected
                                          ? (item.activeColorPrimary)
                                          : item.inactiveColorPrimary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0),
                            )),
                          ),
                        ),
                      )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final midIndex = (this.navBarEssentials!.items!.length / 2).floor();
    return Container(
      width: double.infinity,
      height: this.navBarEssentials!.navBarHeight,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius:
                this.navBarDecoration!.borderRadius ?? BorderRadius.zero,
            child: BackdropFilter(
              filter: this
                      .navBarEssentials!
                      .items![this.navBarEssentials!.selectedIndex!]
                      .filter ??
                  ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: this.navBarEssentials!.items!.map((item) {
                  int index = this.navBarEssentials!.items!.indexOf(item);
                  return Flexible(
                    child: GestureDetector(
                      onTap: () {
                        if (this.navBarEssentials!.items![index].onPressed !=
                            null) {
                          this.navBarEssentials!.items![index].onPressed!(this
                              .navBarEssentials!
                              .selectedScreenBuildContext);
                        } else {
                          this.navBarEssentials!.onItemSelected!(index);
                        }
                      },
                      child: index == midIndex
                          ? Container(width: 150, color: Colors.transparent)
                          : _buildItem(
                              context,
                              item,
                              this.navBarEssentials!.selectedIndex == index,
                              this.navBarEssentials!.navBarHeight),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          this.navBarEssentials!.navBarHeight == 0
              ? SizedBox.shrink()
              : Center(
                  child: GestureDetector(
                      onTap: () {
                        if (this.navBarEssentials!.items![midIndex].onPressed !=
                            null) {
                          this.navBarEssentials!.items![midIndex].onPressed!(
                              this
                                  .navBarEssentials!
                                  .selectedScreenBuildContext);
                        } else {
                          this.navBarEssentials!.onItemSelected!(midIndex);
                        }
                      },
                      child: _buildMiddleItem(
                          this.navBarEssentials!.items![midIndex],
                          this.navBarEssentials!.selectedIndex == midIndex,
                          this.navBarEssentials!.navBarHeight)),
                )
        ],
      ),
    );
  }
}
