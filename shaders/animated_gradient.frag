#version 460 core
#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float uTime;

out vec4 fragColor;

// Function to create lively gradient color with waves
vec3 getGradientColor(vec2 uv, float time) {
    // Create multiple wave movements at different speeds for liveliness
    float wave1 = sin(uv.x * 3.0 + time * 0.8) * 0.5 + 0.5;
    float wave2 = cos(uv.y * 3.5 + time * 0.6) * 0.5 + 0.5;
    float wave3 = sin((uv.x + uv.y) * 2.5 + time * 0.7) * 0.5 + 0.5;
    float wave4 = cos((uv.x - uv.y) * 2.0 + time * 0.9) * 0.5 + 0.5;

    // Additional diagonal wave for more movement
    float diagonalWave = sin(uv.x * 2.0 - uv.y * 2.0 + time * 0.5) * 0.5 + 0.5;

    // Define gradient colors - Coral/Orange to Peach palette
    vec3 color1 = vec3(0.95, 0.45, 0.38); // Coral/Salmon #F27361
    vec3 color2 = vec3(0.98, 0.62, 0.45); // Light Orange #FA9E73
    vec3 color3 = vec3(1.0, 0.75, 0.55);  // Peach #FFBF8C
    vec3 color4 = vec3(1.0, 0.65, 0.35);  // Orange #FFA659
    vec3 color5 = vec3(0.95, 0.55, 0.42); // Mid tone #F28C6B

    // Mix colors dynamically with wave animations
    vec3 mixColor1 = mix(color1, color2, wave1);
    vec3 mixColor2 = mix(color3, color4, wave2);
    vec3 mixColor3 = mix(color2, color5, wave3);

    // Combine all mixes for complex color movement
    vec3 tempColor = mix(mixColor1, mixColor2, wave4);
    vec3 finalColor = mix(tempColor, mixColor3, diagonalWave * 0.5);

    // Add position-based gradient that also animates
    float gradient = uv.x * 0.4 + uv.y * 0.6;
    gradient += sin(time * 0.3) * 0.3;
    gradient += cos(time * 0.4 + uv.x * 3.0) * 0.2;

    // Mix with gradient for depth
    finalColor = mix(finalColor, color3, gradient * 0.25);

    // Add pulsing effect from center
    vec2 center = uv - 0.5;
    float dist = length(center);
    float pulse = sin(dist * 8.0 - time * 2.0) * 0.5 + 0.5;
    finalColor = mix(finalColor, color4, pulse * 0.15 * (1.0 - dist));

    return finalColor;
}

void main() {
    // Normalized coordinates (0.0 - 1.0)
    vec2 uv = FlutterFragCoord().xy / uSize;

    // Get animated gradient color
    vec3 color = getGradientColor(uv, uTime);

    // Add subtle animated noise for texture
    float noise = fract(sin(dot(uv * 50.0 + uTime * 0.3, vec2(12.9898, 78.233))) * 43758.5453);
    color += noise * 0.015;

    // Add brightness variation
    float brightness = 1.0 + sin(uTime * 0.5 + uv.x * 4.0 + uv.y * 4.0) * 0.08;
    color *= brightness;

    // Output final color
    fragColor = vec4(color, 1.0);
}