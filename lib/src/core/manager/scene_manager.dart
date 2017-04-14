part of ose;

/// Scene manager.
///
/// Register new scenes, bind which is needed to use, give opportunity to
/// switch between scenes whenever you want.
///
/// Scene can be bound only once per rendering cycle, to modify already
/// registered scenes, use [get] method, to retrive already bound use
/// [boundScene] getter instead.
class SceneManager {
  /// Registration "list" with available scenes with unique identifiers.
  Map<String, Scene> _scenes;

  /// Bound scene is used while rendering.
  Scene _boundScene;

  /// Scene that will be set in new iteration of rendering.
  Scene _stagedScene;

  /// Update bound scene.
  /// If there is a staged scene set before, it will be set as bound.
  void update(dt) {
    if (_stagedScene != null) {
      _boundScene = _stagedScene;
      _stagedScene = null;
    }
    if (_boundScene != null) {
      scene.update(dt);
    }
  }

  /// Set scene with identifier [name] to be an active in next cycle.
  bool bind(String name) {
    if (!isRegistered(name)) return false;
    _stagedScene = _scene[name];
    return true;
  }

  /// Register scene in manager with unique identifier [name] or replace
  /// already registered by new once.
  void register(String name, Scene scene) {
    _scenes[name] = scene;
    // Bind first scene automatically.
    if (_scenes.keys.length == 1) {
      bind(name);
    }
  }

  /// Check is scene [name] is registered in manager.
  bool isRegistered(String name) {
    return _scenes.containsKey(name);
  }

  /// Remove scene with [name] identifier from registration list.
  void remove(String name) {
    _scenes.remove(name);
  }

  /// Get scene with [name] identifier from registration list.
  Camera get(String name) {
    return _scenes[name];
  }

  Scene get boundScene => _boundScene;
}
