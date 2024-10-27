// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;

    // Parmetros para la distorsin
    float moveSpeed = 1.0;
    float distortionAmount = 0.005;
    float noiseIntensity = 0.02;

    // Desplazamiento animado
    vec2 animatedUV = uv + vec2(sin(iTime * 2.0 + uv.y * 10.0) * distortionAmount, 0.0);
    
    // Cargar textura
    vec3 color = texture(iChannel0, animatedUV).rgb;

    // Agregar ruido
    float noise = (fract(sin(dot(animatedUV * 100.0 + iTime * 0.5, vec2(12.9898, 78.233))) * 43758.5453) - 0.5) * noiseIntensity;
    color += noise;

    // Franjas negras (ajustar stripeWidth para delgadez)
    float stripeWidth = 0.005; // Hacer ms delgado
    float scanlineOffset = sin(iTime * 5.0) * 0.001;
    float stripes = step(0.5, fract(uv.y / stripeWidth + scanlineOffset));
    vec3 stripeColor = vec3(0.0);
    color = mix(color, stripeColor, stripes);

    // Ajustar el color final
    fragColor = vec4(color, texture(iChannel0, uv).a);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}