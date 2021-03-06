//
//  Shader.vsh
//  test
//
//  Created by ramemiso on 2013/09/23.
//  Copyright (c) 2013年 ramemiso. All rights reserved.
//

#version 300 es

#define ATTRIB_POSITION 0
#define ATTRIB_NORMAL 1

layout (location = ATTRIB_POSITION) in vec4 position;
layout (location = ATTRIB_NORMAL) in vec3 normal;

out lowp vec4 colorVarying;
out mediump vec3 woodCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 eyeNormal = normalize(normalMatrix * normal);
    vec3 lightPosition = vec3(0.0, 0.0, 1.0);
    vec4 diffuseColor = vec4(0.83, 0.54, 0.25, 1.0);
    float nDotVP = max(0.6, dot(eyeNormal, normalize(lightPosition)));
	
    colorVarying = diffuseColor * nDotVP;
	woodCoord = position.xyz * 0.5 + 0.5;	// テクスチャの中央へ移動する
	woodCoord.xy += 0.15;
    
    gl_Position = modelViewProjectionMatrix * position;
}
