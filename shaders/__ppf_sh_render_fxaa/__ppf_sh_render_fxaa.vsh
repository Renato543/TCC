
attribute vec3 in_Position; // (x,y,z)
attribute vec2 in_TextureCoord; // (u,v)

uniform vec2 resolution;

varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec2 v_TexelSize;

void main() {
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
	v_vPosition = in_Position.xy;
	v_vTexcoord = in_TextureCoord;
	v_TexelSize = vec2(1.0/resolution);
}