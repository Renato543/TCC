//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float brightness;

void main()
{
	vec4 base_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	base_color.rgb = base_color.rgb + brightness;
    gl_FragColor = base_color;
}
