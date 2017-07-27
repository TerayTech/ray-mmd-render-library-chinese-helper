
//       2017/4/29           汉化第一版





                                                                                                                      
//Ray-mmd中文材质使用说明书 由[MSPR]TerayTech 翻译制作
//特别感谢 斯大 的帮助
//                                                              基本颜色修改部分
// 0 : 使用浮点变量指定颜色
// 1 : 使用图片 (bmp, png, jpg, tga, dds) 路径添加贴图
// 2 : 使用动态图片 (gif, apng) 添加路径
// 3 : 从PMX模型中提取基础颜色
// 4 : 从PMX模型中提取环环境贴图
// 5 : 从TOON贴图中提取
// 6 : 从DummyScreen.x模型中提取颜色
// 7 : 从PMX模型中提取环境光
// 8 : 从PMX模型中提取高光颜色
// 9 : 从PMX模型中提取高光强度    仅使用与粗糙度
#define ALBEDO_MAP_FROM 3

//                                                              UV坐标翻转功能
// 1 : 水平翻转
// 2 : 垂直翻转
// 3 : 交换UV坐标
#define ALBEDO_MAP_UV_FLIP 0

// 更改const float3 albedo = 1.0;语句 修改颜色的模式
// 1 : 乘法叠加
// 2 : 指数叠加
#define ALBEDO_MAP_APPLY_SCALE 0

#define ALBEDO_MAP_APPLY_DIFFUSE 1		// 打开后将会读取PMX模型中的扩散色定义
#define ALBEDO_MAP_APPLY_MORPH_COLOR 0	// 打开后将会接受MMD控制器的约束

// 若ALBEDO_MAP_FROM 在1或2模式 你需要自定义贴图路径
// Tips : 父文件夹是 "../",  改变所有的 "\" to "/".
// 示例: 
// 若 xxx.png  material.fx 在统一文件夹内                                  #define ALBEDO_MAP_FILE "xxx.png"
// 若 xxx.png 在 material.fx的子文件夹内                                   #define ALBEDO_MAP_FILE "../xxx.png"
// 若 xxx.png 在 其他目录                                                  #define ALBEDO_MAP_FILE "../other path/xxx.png"
// 若 xxx.png 在磁盘内任意位置                                             #define ALBEDO_MAP_FILE "C:/Users/User Name/Desktop/xxx.png"
#define ALBEDO_MAP_FILE "albedo.png"

// 若ALBEDO_MAP_APPLY_SCALE 的状态为 1, 请对下面的语句赋值（范围位于0~1）  “const float3 albedo = float3(r, g, b) ”
// 
// 红色                                                                    const float3 albedo = float3(1.0, 0.0, 0.0);
// 标准RGB色 :                                                             const float3 albedo = float3(255, 0.0, 0.0) / 255.0;
// 
// 如果你是使用某软件的屏幕取色，你需要使用sRGB模式 并对所取颜色进行gamma校正
// 通常情况下 gamma值一般取2.2或1.8

// 转换格式：  当你用（0，1）集合内数值时                                  const float3 albedo = pow(float3(r, g, b), 2.2);
//             当你用（0，255）集合内数值时                                const float3 albedo = pow(float3(r, g, b) / 255.0, 2.2);
const float3 albedo = 1.0;

// 下面的数值设置贴图的UV重叠次数
const float2 albedoMapLoopNum = 1.0; // between float2(0, 0) ~ float2(inf, inf) 




//                                                              通过修改ALBEDO_SUB_ENABLE来改变叠加效果
// 0 : 无
// 1 : 贴图运算乘法
// 2 : 贴图指数运算
// 3 : 贴图加法运算
// 4 : 黑色素
// 5 : 透明混合
#define ALBEDO_SUB_ENABLE 0
#define ALBEDO_SUB_MAP_FROM 0 	 		 
#define ALBEDO_SUB_MAP_UV_FLIP 0 		 
#define ALBEDO_SUB_MAP_APPLY_SCALE 0  	 
#define ALBEDO_SUB_MAP_FILE "albedo.png" 

const float3 albedoSub = 1.0;
const float2 albedoSubMapLoopNum = 1.0;	

// alaph功能对不透明物体无影响
#define ALPHA_MAP_FROM 3	 		
#define ALPHA_MAP_UV_FLIP 0	 		
#define ALPHA_MAP_SWIZZLE 3 		//选择要读取alpha贴图的颜色通道 (R = 0, G = 1, B = 2, A = 3)
#define ALPHA_MAP_FILE "alpha.png"	

const float alpha = 1.0;
const float alphaMapLoopNum = 1.0;	// 循环次数

//                                                                                   法线贴图设定
#define NORMAL_MAP_FROM 0  
// 0 : 使用浮点变量指定颜色
// 1 : 使用图片 (bmp, png, jpg, tga, dds) 路径添加贴图
// 2 : 使用动态图片 (gif, apng) 添加路径
// 3 : 从PMX模型中提取基础颜色
// 4 : 从PMX模型中提取环环境贴图
// 5 : 从TOON贴图中提取
// 6 : 从DummyScreen.x模型中提取颜色
// 7 : 从PMX模型中提取环境光
// 8 : 从PMX模型中提取高光颜色
// 9 : 从PMX模型中提取高光强度    仅使用与粗糙度





// 空间法线
// 0 : 从RGB通道计算空间法线
// 1 : 从RG 通道计算空间法线
// 2 : 从世界空间正常灰度凹凸贴图PerturbNormalLQ 计算 此选项对小物体无影响
// 3 : 从世界空间正常灰度凹凸贴图PerturbNormalHQ. 计算 
#define NORMAL_MAP_TYPE 0
#define NORMAL_MAP_UV_FLIP 0		 
#define NORMAL_MAP_FILE "normal.png" 

const float normalMapScale = 1.0;	//  0 ~ inf
const float normalMapLoopNum = 1.0;	// 循环次数

#define NORMAL_SUB_MAP_FROM 0			 
#define NORMAL_SUB_MAP_TYPE 0	 		
#define NORMAL_SUB_MAP_UV_FLIP 0		 
#define NORMAL_SUB_MAP_FILE "normal.png" 

const float normalSubMapScale = 1.0;	// between 0 ~ inf
const float normalSubMapLoopNum = 1.0;	// see albedoMapLoopNum




//                                                                            粗糙度



 
// 默认情况下会读取PMX中的数据 并且将高光强度转化为粗糙度贴图使用
#define SMOOTHNESS_MAP_FROM 9			// 
// 0 : 使用浮点变量指定颜色
// 1 : 使用图片 (bmp, png, jpg, tga, dds) 路径添加贴图
// 2 : 使用动态图片 (gif, apng) 添加路径
// 3 : 从PMX模型中提取基础颜色
// 4 : 从PMX模型中提取环环境贴图
// 5 : 从TOON贴图中提取
// 6 : 从DummyScreen.x模型中提取颜色
// 7 : 从PMX模型中提取环境光
// 8 : 从PMX模型中提取高光颜色
// 9 : 从PMX模型中提取高光强度    仅使用与粗糙度


//                                                                            光滑度
// 粗糙度的其他参数类型
// 0 : 平滑模式 （CRENGINE 寒霜引擎算法）
// 1 : 从光滑度计算粗糙度  1.0 - Roughness ^ 0.5 ( UE4/GGX/SubstancePainter2 textures的计算方式)
// 2 : 从光滑度计算粗糙度 by 1.0 - Roughness		 ( UE4/GGX/SubstancePainter2 的线性粗糙度算法)
#define SMOOTHNESS_MAP_TYPE 0
#define SMOOTHNESS_MAP_UV_FLIP 0		
#define SMOOTHNESS_MAP_SWIZZLE 0		
#define SMOOTHNESS_MAP_APPLY_SCALE 0	
#define SMOOTHNESS_MAP_FILE "smoothness.png" 

const float smoothness = 0.0;	// between 0 ~ 1
const float smoothnessMapLoopNum = 1.0;	// 循环次数

//                                                                            金属度
#define METALNESS_MAP_FROM 0				
#define METALNESS_MAP_UV_FLIP 0				
#define METALNESS_MAP_SWIZZLE 0				
#define METALNESS_MAP_APPLY_SCALE 0			
#define METALNESS_MAP_FILE "metalness.png"	

const float metalness = 0.0;	// between 0 ~ 1
const float metalnessMapLoopNum = 1.0;	// 循环次数

//                                                                            高  光
// 描述镜面反射的最小系数
//在金属和启用ShadingMaterialID时 无效
#define SPECULAR_MAP_FROM 0 // see ALBEDO_MAP_FROM for more information.

// 其它类型高光选项
// 0 : 颜色算法1                                                               F(x) = 0.08*(x  ) (from UE4 textures)
// 1 : 颜色算法2                                                               F(x) = 0.16*(x^2) (from Frostbite textures)
// 2 : 灰度算法1                                                               F(x) = 0.08*(x  ) (from UE4 textures)
// 3 : 灰度算法2                                                               F(x) = 0.16*(x^2) (from Frostbite textures)
// 4 : 使用量 (0.04) 不是高光的 (0.5), Available when SPECULAR_MAP_FROM is 0  反正你特么试一下哪个好看不就行了吗 我哪知道该用哪个
#define SPECULAR_MAP_TYPE 0
#define SPECULAR_MAP_UV_FLIP 0		
#define SPECULAR_MAP_SWIZZLE 0		
#define SPECULAR_MAP_APPLY_SCALE 0
#define SPECULAR_MAP_FILE "specular.png"

// 默认值为 0.5
// Notice : 在现实世界，这个数值是不可能小于2%的，否则被认为是阴影
// For example: 反射系数 F(x) = (x - 1)^2 / (x + 1)^2
// 考虑入射光在折射率为1.5的透明介质上，则反射系数将是(1.5 - 1)^2 / (1.5 + 1)^2 = 0.04 (or 4%).
// 4%代表其反射光占出射光的4%的能量  也就是说96%的能量被漫反射，4%的能量被反射

// 玻璃的反射率是0.04，然后水的反射率是0.02，所以所有绝缘体的浮动都是在0.02~0.04之中的

// 如果自变量x是0.5则返回的反射系数将是0.04   反正大部分使用0.04就够了

const float3 specular = 0.5; // between 0 ~ 1
const float2 specularMapLoopNum = 1.0;	// see albedoMapLoopNum







//                                                                               环境吸收
#define OCCLUSION_MAP_FROM 0		// see ALBEDO_MAP_FROM for more information.

// 其他闭塞参数类型
//从线性颜色空间获取环境遮挡
//从sRGB颜色空间获取环境遮挡
#define OCCLUSION_MAP_TYPE 0
#define OCCLUSION_MAP_UV_FLIP 0		
#define OCCLUSION_MAP_SWIZZLE 0		
#define OCCLUSION_MAP_APPLY_SCALE 0 
#define OCCLUSION_MAP_FILE "occlusion.png" 

const float occlusion = 1.0;	// (0,1)
const float occlusionMapLoopNum = 1.0;	//叠加次数

#define PARALLAX_MAP_FROM 0	// 类型

// 视差的其他参数类型
// 0 : 计算不透明度
// 1 : 计算视差遮挡的透明度和最佳的 SSDO
#define PARALLAX_MAP_TYPE 0
#define PARALLAX_MAP_UV_FLIP 0			
#define PARALLAX_MAP_SWIZZLE 0			
#define PARALLAX_MAP_FILE "height.png"	

const float parallaxMapScale = 1.0;

// parallaxmaploopnum数量增加会导致反照率、循环 等增加    这是因为视差坐标可以从高度图计算
// 这是用来获取纹理与反照，法线，平滑，金属度，等
// 换句话说，像获取数据（反照率，法线，等）从视差坐标 (albedo, normals, etc) 算法： parallax coordinates * parallaxMapLoopNum * albedo/normal/MapLoopNum
const float parallaxMapLoopNum = 1.0;	// see albedoMapLoopNum









//                                                                               自发光



#define EMISSIVE_ENABLE 0
#define EMISSIVE_MAP_FROM 0	// 类型
#define EMISSIVE_MAP_UV_FLIP 0
#define EMISSIVE_MAP_APPLY_SCALE 0
#define EMISSIVE_MAP_APPLY_MORPH_COLOR 0
#define EMISSIVE_MAP_APPLY_MORPH_INTENSITY 0

//您可以使用以下代码设置闪烁功能
// 1 : emissiveBlink 颜色乘以频率  “const float3 emissiveBlink = float3(1.0, 2.0, 3.0);”
// 2 : 颜色与频率乘以mmd控制器的数值, 参照PointLight.pmx中的控制器
#define EMISSIVE_MAP_APPLY_BLINK 0
#define EMISSIVE_MAP_FILE "emissive.png"

const float3 emissive = 1.0;	//自发光颜色
const float3 emissiveBlink = 1.0; // 定义域（0,10）
const float  emissiveIntensity = 1.0; // 定义域（0,100）∪[100,+∞）
const float2 emissiveMapLoopNum = 1.0;	//







//                                                                               ID贴图





// 阴影材质 ID贴图
// 曲率也称为“不透明”                                                          以下这一坨我也不知道是什么玩意儿。。
// 0 : 默认            // customA = 无效,    customB = 无效
// 1 : 集成的皮肤// customA = 弯曲度,  customB = 透射色;
// 2 : 自发光的占位符  // customA = 无效,    customB = 无效

//如果你总是用toom 皮肤或 actor，SSSS可以禁用
// 3 : Toon               // customA = 分段,    customB = 阴影颜色

// You need to set alpha value of the pmx model to less then 0.999
// 4 : Glass              // customA = 弯曲度   customB = 透射色

// see paper for cloth information : http://blog.selfshadow.com/publications/s2013-shading-course/rad/s2013_pbs_rad_notes.pdf
// 5 : Cloth              // customA = sheen,      customB = Fuzz Color

// 6 : Clear Coat         // customA = smoothness, customB = 无效;
// 7 : Subsurface         // customA = 弯曲度,  customB = transmittance color;
#define CUSTOM_ENABLE 0  //开关

#define CUSTOM_A_MAP_FROM 0	
#define CUSTOM_A_MAP_UV_FLIP 0
#define CUSTOM_A_MAP_COLOR_FLIP 0
#define CUSTOM_A_MAP_SWIZZLE 0
#define CUSTOM_A_MAP_APPLY_SCALE 0
#define CUSTOM_A_MAP_FILE "custom.png"

const float customA = 0.0;
const float customAMapLoopNum = 1.0;	叠加次数

#define CUSTOM_B_MAP_FROM 0	
#define CUSTOM_B_MAP_UV_FLIP 0
#define CUSTOM_B_MAP_COLOR_FLIP 0
#define CUSTOM_B_MAP_APPLY_SCALE 0
#define CUSTOM_B_MAP_FILE "custom.png"

const float3 customB = 0.0;
const float2 customBMapLoopNum = 1.0;	叠加次数

#include "material_common_2.0.fxsub"