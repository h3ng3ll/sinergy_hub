#version 460 core

precision highp float;

#include <flutter/runtime_effect.glsl>

// Uniforms
uniform vec2 u_resolution;// Размер виджета
uniform float u_time;// Время для анимации

uniform vec3 c1; /// left top color
uniform vec3 c2; /// right bootom color

out vec4 fragColor;

vec2 rotated_v(vec2 st, float angle) {
    return vec2(
    st.x * cos(angle) - st.y * sin(angle),
    st.x * sin(angle) + st.y * cos(angle)
    );
}

void main () {
    // Нормализованные координаты от центра
    vec2 st = FlutterFragCoord().xy / u_resolution;

    st.y = 1 - st.y;
    float pi = 3.14;

    float angle = radians(45.0);

    vec2 rotated  = rotated_v(st, angle);

    float pulse = sin(u_time) * 0.5 + 0.5;

    float grad = smoothstep(-0.5 - pulse, 0.5 + pulse, rotated.x);

    // rotated *= sin(u_time);
    // st *= vec2(-1.);

//    vec3 c1 = vec3(0.1, 0.5, 1.0);
//    vec3 c2 = vec3(0.8, 0.2, 1.0);

    // vec3 color = vec3(rotated.x , 0 , 0);
    vec3 color  = mix(c1, c2, grad);
    // vec3 color = vec3(d , d, d);
    fragColor = vec4(color, 1.0);
}