precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;
void main() {
    float offsetX=sin(time*1000.0)*0.05;
	float offsetY=cos(time*1000.0)*0.05;
    vec2 shakenTexcoord = v_texcoord + vec2(offsetX,offsetY); 
    gl_FragColor = texture2D(tex, shakenTexcoord);
}
