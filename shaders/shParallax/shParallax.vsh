//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float parallax_amount = 0.5;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
	
	// Camera position
	mat4 viewMatrix = gm_Matrices[MATRIX_VIEW];
	vec2 cam_pos = -vec2(viewMatrix[3][0], viewMatrix[3][1]);
	
	// Get height
	float height = (-object_space_pos.z - object_space_pos.y) / 1000.0;
	
	// Get parallax offset
	vec2 offset = object_space_pos.xy - cam_pos;
	
	// Apply
	object_space_pos.xy += offset * parallax_amount * height;
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	
	// Shading
	v_vColour.rgb *= 1. + (height * parallax_amount) * 2.5;
}
