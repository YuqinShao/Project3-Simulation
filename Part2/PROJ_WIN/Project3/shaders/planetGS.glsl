//this is for part 2
#version 330

uniform mat4 u_projMatrix;
uniform vec3 u_cameraPos;

layout (points) in;
layout (triangle_strip) out;
layout (max_vertices = 4) out;

out vec3 WorldCoord;
out vec3 ToCam;
out vec3 Up;
out vec3 Right;
out vec2 TexCoord;
out vec3 col;

const float scale = 0.05;

void main()
{
    vec3 Position = gl_in[0].gl_Position.xyz;
    WorldCoord = Position;	
    ToCam = normalize(u_cameraPos - Position);
    Up = vec3(0.0, 0.0, 1.0);
    Right = cross(ToCam, Up);
    Up = cross(Right, ToCam);
	col = Position;
	/*vec3 Pos = Position + scale*Right - scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 0.0);
    EmitVertex();

    Pos = Position + scale*Right + scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 1.0);
    EmitVertex();

    Pos = Position - scale*Right - scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 0.0);
    EmitVertex();

    Pos = Position - scale*Right + scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 1.0);
    EmitVertex();*/

	/*vec3 Pos = Position;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 0.0);
    EmitVertex();

    Pos = Position + scale*Right - scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 1.0);
    EmitVertex();

    Pos = Position - scale*Right - scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 0.0);
    EmitVertex();

    Pos = Position + scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 1.0);
    EmitVertex();*/

	vec3 Pos = Position;// + scale * Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 0.0);
    EmitVertex();

    Pos = Position  - scale * ToCam - 0.6*scale * Right;//+ scale*Right - scale*Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(0.0, 1.0);
    EmitVertex();

	 Pos = Position - scale * ToCam -  1.5*scale * Up;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 1.0);
    EmitVertex();

    Pos = Position -  scale * ToCam + 0.6*scale * Right;
    gl_Position = u_projMatrix * vec4(Pos, 1.0);
    TexCoord = vec2(1.0, 0.0);
    EmitVertex();

  

    EndPrimitive();

}

//this is for part 1
//#version 330
//
//uniform mat4 u_projMatrix;
//uniform vec3 u_cameraPos;
//
//layout (points) in;
//layout (triangle_strip) out;
//layout (max_vertices = 4) out;
//
//out vec3 WorldCoord;
//out vec3 ToCam;
//out vec3 Up;
//out vec3 Right;
//out vec2 TexCoord;
//
//const float scale = 0.03;
//void main()
//{
//    vec3 Position = gl_in[0].gl_Position.xyz;
//    WorldCoord = Position;
//
//    ToCam = normalize(u_cameraPos - Position);
//    Up = vec3(0.0, 0.0, 1.0);
//    Right = cross(ToCam, Up);
//    Up = cross(Right, ToCam);
//	vec3 Pos = Position + scale*Right - scale*Up;
//    gl_Position = u_projMatrix * vec4(Pos, 1.0);
//    TexCoord = vec2(0.0, 0.0);
//    EmitVertex();
//
//    Pos = Position + scale*Right + scale*Up;
//    gl_Position = u_projMatrix * vec4(Pos, 1.0);
//    TexCoord = vec2(0.0, 1.0);
//    EmitVertex();
//
//    Pos = Position - scale*Right - scale*Up;
//    gl_Position = u_projMatrix * vec4(Pos, 1.0);
//    TexCoord = vec2(1.0, 0.0);
//    EmitVertex();
//
//    Pos = Position - scale*Right + scale*Up;
//    gl_Position = u_projMatrix * vec4(Pos, 1.0);
//    TexCoord = vec2(1.0, 1.0);
//    EmitVertex();
//
//    EndPrimitive();
//}