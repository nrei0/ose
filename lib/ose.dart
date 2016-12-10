library ose;

import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:web_gl' as webGL;

import 'package:meta/meta.dart';
import 'package:collection/collection.dart';

import 'ose_math.dart';
import 'ose_utils.dart' as utils;
import 'ose_io.dart';

part 'src/core/renderer/renderer.dart';
part 'src/core/renderer/renderer_events.dart';
part 'src/core/renderer/renderer_lifecycle_controllers.dart';
part 'src/core/renderer/renderer_settings.dart';
part 'src/core/renderer/renderer_state.dart';
part 'src/core/renderer/renderer_managers.dart';

part 'src/core/transform/camera_transform.dart';
part 'src/core/transform/transform.dart';
part 'src/core/transform/scene_object_transform.dart';

part 'src/core/camera/camera.dart';

part 'src/core/scene/scene.dart';

part 'src/core/actor/actor.dart';
part 'src/core/actor/control_actor.dart';

part 'src/core/object/scene_object.dart';
part 'src/core/object/shape/shape.dart';
part 'src/core/object/shape/rectangle.dart';
part 'src/core/object/shape/circle.dart';
part 'src/core/object/shape/triangle.dart';
part 'src/core/object/sprite/sprite.dart';

part 'src/core/filter/filter.dart';
part 'src/core/filter/shape/shape_filter.dart';
part 'src/core/filter/particles/particles_filter.dart';
part 'src/core/filter/sprite/sprite_filter.dart';

part 'src/core/shader/attribute.dart';
part 'src/core/shader/uniform.dart';
part 'src/core/shader/shader_program.dart';
part 'src/core/shader/shader.dart';
part 'src/core/shader/shape/shape_shader_program.dart';
part 'src/core/shader/shape/frag_shape_shader.dart';
part 'src/core/shader/shape/vert_shape_shader.dart';
part 'src/core/shader/particles/particles_shader_program.dart';
part 'src/core/shader/particles/frag_particles_shader.dart';
part 'src/core/shader/particles/vert_particles_shader.dart';
part 'src/core/shader/sprite/sprite_shader_program.dart';
part 'src/core/shader/sprite/frag_sprite_shader.dart';
part 'src/core/shader/sprite/vert_sprite_shader.dart';
part 'src/core/shader/qualifier_type.dart';
part 'src/core/shader/qualifier_state.dart';

part 'src/core/manager/attribute_manager.dart';
part 'src/core/manager/uniform_manager.dart';
part 'src/core/manager/shader_program_manager.dart';
part 'src/core/manager/camera_manager.dart';
part 'src/core/manager/scene_manager.dart';

part 'src/core/texture/texture.dart';
part 'src/core/texture/sub_texture.dart';

part 'src/core/color/color.dart';
part 'src/core/color/complex_color.dart';
part 'src/core/color/solid_color.dart';
part 'src/core/color/gradient_color.dart';
