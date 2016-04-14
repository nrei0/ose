attribute vec2 aVertexPosition;
attribute vec2 aTexturePosition;

uniform mat4 uMVMatrix;
uniform mat4 uPMatrix;

varying highp vec2 vTexturePosition;

void main() {
    gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition, 0.0, 1.0);
    vTexturePosition = aTexturePosition;
}