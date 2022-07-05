abstract class Device {
  static bool isMobile(double width) => width <= 480;
  static bool isDesktop(double width) => width >= 800;
  static bool isTablet(double width) => width > 480 && width < 800;
}
