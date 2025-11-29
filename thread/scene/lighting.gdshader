shader_type canvas_item;

uniform vec2 lights[100];
uniform int number_of_lights = 1;
uniform vec4 modulate_color : source_color = vec4(1.0);
uniform float light_radius = 0.1; // Radius in UV space (0-1 range)
uniform float ambient_light = 0.0; // Set to 0 for pitch black

float calculate_lighting(vec2 uv_coords) {
    float total_light = 0.0;

    for (int i = 0; i < number_of_lights; i++) {
        float dist = distance(uv_coords, lights[i]);
        
        // Light intensity falls off with distance
        float intensity = 1.0 - smoothstep(0.0, light_radius, dist);
        total_light += intensity;
    }
    
    // Combine with ambient light and clamp
    return min(total_light + ambient_light, 1.0);
}

void fragment() {
    // Calculate lighting at this UV coordinate
    float light = calculate_lighting(SCREEN_UV);
    
    // Make everything black, only show lit areas
    COLOR = vec4(0.0, 0.0, 0.0, 1.0 - light);
}