#!/bin/bash
# usage: ./validate_shader.sh assets/shaders/simple.frag

SHADER=$1
STUB_DIR=glsl_stubs

# создаём папку
mkdir -p $STUB_DIR/flutter

# создаём заглушку
cat > $STUB_DIR/flutter/runtime_effect.glsl <<EOL
vec4 FlutterFragCoord() { return vec4(0.0); }
EOL

# валидируем, передаём корень инклуда
glslangValidator -I$STUB_DIR -V $SHADER

#rm -rf $STUB_DIR