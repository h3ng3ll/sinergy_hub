#version 460 core
#include <flutter/runtime_effect.glsl>

precision mediump float;

//uniform float u_time;   // час у секундах
//uniform vec2 resolution; // розмір вікна
//out vec4 fragColor;
//
////// функція для плавного градієнту
//vec3 gradient(float t) {
//    return mix(
//    vec3(0.4, 0.6, 1.0),  // синій відтінок
//    vec3(0.8, 0.3, 0.9),  // фіолетовий відтінок
//    0.5 + 0.5 * sin(t)
//    );
//}
//
//void main() {
//    vec2 st = FlutterFragCoord().xy / resolution.xy;
//
//    float t = u_time * 0.2;
//    float wave = sin(st.x * 5.0 + t) * 0.5 + cos(st.y * 5.0 - t) * 0.5;
//
//    vec3 percent = vec3((st.x + st.y) / 2);
//
//    vec3 col1 = gradient(t + wave);
//    vec3 col2 = gradient(t - wave);
//    vec3 color = mix(col1 , col2 , st.y);
//
//    fragColor = vec4(color, 1);
//}


// Uniforms от Flutter
uniform float iTime;       // Время для анимации
uniform vec2 uSize;        // Размер виджета

// Output
out vec4 fragColor;

// Функция для создания плавного градиента
vec3 getGradientColor(vec2 uv, float time) {
    // Создаем волнообразное движение
    float wave1 = sin(uv.x * 2.0 + time * 0.5) * 0.5 + 0.5;
    float wave2 = cos(uv.y * 2.0 + time * 0.3) * 0.5 + 0.5;
    float wave3 = sin((uv.x + uv.y) * 1.5 + time * 0.4) * 0.5 + 0.5;

    // Цвета градиента (как на изображениях)
    vec3 color1 = vec3(0.6, 0.4, 0.95);  // Фиолетовый #9966FF
    vec3 color2 = vec3(0.85, 0.35, 0.75); // Розово-фиолетовый #D959BF
    vec3 color3 = vec3(0.95, 0.58, 0.98); // Светло-розовый #F093FB
    vec3 color4 = vec3(0.4, 0.5, 0.92);   // Синий #6680EA

    // Смешиваем цвета с анимацией
    vec3 mixColor1 = mix(color1, color2, wave1);
    vec3 mixColor2 = mix(color3, color4, wave2);
    vec3 finalColor = mix(mixColor1, mixColor2, wave3);

    // Добавляем вариацию по позиции
    float gradient = uv.x * 0.5 + uv.y * 0.5;
    gradient += sin(time * 0.2) * 0.2;

    finalColor = mix(finalColor, color2, gradient * 0.3);

    return finalColor;
}

void main() {
    // Нормализованные координаты (0.0 - 1.0)
    vec2 uv = FlutterFragCoord().xy / uSize;

    // Получаем цвет градиента с анимацией
    vec3 color = getGradientColor(uv, iTime);

    // Добавляем небольшой шум для текстуры
    float noise = fract(sin(dot(uv * 100.0 + iTime * 0.1, vec2(12.9898, 78.233))) * 43758.5453);
    color += noise * 0.02;

    // Выводим финальный цвет
    fragColor = vec4(color, 1.0);
}