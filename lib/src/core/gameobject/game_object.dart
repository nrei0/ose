part of ose;

// TODO: To use as main class for another (instead of group);

class GameObject extends SceneObject {
  Float32List _glVertices;

  Float32List get glVertices => _glVertices;

  GameObject({Float32List vertices}) {
    _glVertices = vertices;
  }
}
