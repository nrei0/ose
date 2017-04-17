part of ose;

/// IO Tools.
/// Used to expose common input controllers to end-developer to handle
/// generative events.
/// Commonly used in [Actor] split logic between objects and scene.
class IOTools {
  /// Keyboard controller to listen and handle keyboard events.
  final KeyboardController keyboard;

  /// Mouse controlller to listen and handle mouse events.
  final MouseController mouse;

  /// Touch controller to listen and handle touch events.
  final TouchController touch;

  IOTools()
      : keyboard = new KeyboardController(),
        mouse = new MouseController(),
        touch = new TouchController();
}
