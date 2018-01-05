inline float2x2 GetRotateMatrix(float4 rotate)
{
	float angle = (rotate.x + rotate.y) * 0.0174533f;
	float sinAngle = sin(angle);
	float cosAngle = cos(angle);
	return float2x2(cosAngle, sinAngle, -sinAngle, cosAngle);
}

inline float2 Calculate(float2 source, float2x2 rotateMatrix, float4 rotate, float4 scale, float4 translate)
{
	float2 temp = rotate.zw - translate.xy;
	float2 result = source - temp;
	result = mul(result, rotateMatrix);
	result = result + temp;
	float2 temp2 = scale.zw - translate.xy;
	result = result - temp2;
	result = result * scale.xy;
	result = result + temp2;
	result = result + (translate.xy + translate.zw);
	return result;
}

inline float2 CalculateUV(float4 translate, float4 rotate, float4 scale, float2 inheritRate, float2 sourceUV, float2 lastUV)
{
	float2x2 rotateMatrix = GetRotateMatrix(rotate);
	float2 source = lerp(sourceUV, lastUV, inheritRate);
	return Calculate(source, rotateMatrix, rotate, scale, translate);
}

inline float2 CalculateUV0(float4 translate, float4 rotate, float4 scale, float2 sourceUV)
{
	float2x2 rotateMatrix = GetRotateMatrix(rotate);
	return Calculate(sourceUV, rotateMatrix, rotate, scale, translate);
}