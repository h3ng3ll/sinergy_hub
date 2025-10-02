#version 460 core

precision highp float;

#include <flutter/runtime_effect.glsl>

// Uniforms
uniform vec2 u_resolution;// Размер виджета
uniform float u_time;// Время для анимации

out vec4 fragColor;


void main() {
    // Нормализованные координаты от центра
    vec2 st = FlutterFragCoord().xy / u_resolution;

    st -= 0.5;
    st *= 2.0;
    st.x *= u_resolution.y / u_resolution.x;

    float d = length(st);// расстояние от центра

    float radius = 0.616;// радиус круга
    float border = -0.046;// толщина бордера

    // --- маски ---
    float inside = 1.0 - smoothstep(radius, radius + 0.009, d);// внутри
    float borderMask = smoothstep(radius, radius + border, d) *
    (1.0 - smoothstep(radius + border, radius + border + 0.001, d));// кольцо

    // --- цвета ---
    vec3 fillColor = vec3(0.0, 1.0, 0.0);// зелёный
    vec3 borderColor = mix(
    vec3(0.246, 1.000, 0.725),
    vec3(0.035, 0.035, 0.035),
    cos(u_time - st.y)
    );// белый бордер

    vec3 color = vec3(0.0);
    color += fillColor * inside;
    color += borderColor * borderMask;

    // финальный вывод
    fragColor = vec4(color, inside + borderMask);
}