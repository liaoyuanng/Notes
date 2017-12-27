# OpenGL ES

## 名词解释

`Shader`：着色器，分`顶点着色器(vertex shader)`和`片元着色器(fragment shader)`，一个完整的着色程序，两者都应该有。

`vec`：矢量(vector)的缩写。

`mat`：矩阵(matrix)的缩写。

`纹理`：物体表面呈现凹凸不平的不规则的沟纹。

`坐标系`：OpenGL中使用的是[右手坐标系](https://baike.baidu.com/item/%E5%8F%B3%E6%89%8B%E5%9D%90%E6%A0%87%E7%B3%BB)。

## Shader

`Vertex Shader`定义了 2D 和 3D 场景中几个图形是如何处理的。每一个顶点代表图像的一个角。它设置顶点的位置，并把位置和纹理坐标发送给`Fragment Shader`.

`Fragment Shader`对对象或者图片的每一个像素上进行计算，最终计算出每个像素的最终颜色。

![Vertex and Fragment Shader](http://7xsgdb.com1.z0.glb.clouddn.com/1049769-02d541a0f2e19392.png)

## 矢量(vec)

常见的有`vec2`、`vec3`、`vec4`...，用来表示`向量`类型，表示包含特定数量的浮点数，类似一个`浮点型数组`，前面的分别表示两个浮点数(vec2)、是三个浮点数(vec3)和四个浮点数(vec4)...。它可以灵活运用在多种数据类型中。比如：

* 表示(x, y)坐标信息，可以用`vec2`表示.
* 表示颜色 R、G、B、A，用`vec4`表示。

## 矩阵(mat)

矩阵是一个浮点型数组的数组，而不是单个浮点型数组。常见的有`mat2`、`mat3`、`mat4`。前面矢量的解释中，`vec2`表示两个浮点数，`mat2`表示两个`vec2`对象的值，以此类推。其中。每个`vec`对象代表一行，每个`vec`对象代表一列。


## GLSL

GLSL: OpenGL Shading Language,是用来编写`Shader`的语言，基于`C`语言，运行在`GPU`上面。

### Shader 的三种变量类型

`Uniform`、`Attribute`、`varying`。

* Uniform: 一般用来表示变换矩阵、材质、光照参数和颜色。可以在`vertex`和`fragment`共用。
* Attribute: 只能在`vertex shader`中使用，一边用来表示一些定点的数据，如：坐标，法线，纹理坐标，顶点颜色等。
* Varying: 用于在`vertex`和`fragment`之间的数据传递。一般`vertex shader` 修改`varying`变量的值，然后`fragment shader` 使用该值。因此`varying`变量在`vertex shader`和`fragment shader`中的声明必须是一致的。

### Shader的精度

有三种精度:`lowp`、`highp`、`mediump`，分别表示`低精度`、`高精度`、`中等精度`

### 参数修饰符

1. in，作为函数的传入的参数。默认情况下是 in
2. out，作为函数的传出参数。
3. inout，即作为传入参数，又作为传出参数。

## Reference

1. [shader三种变量类型](https://www.cnblogs.com/softimagewht/p/4750847.html)

2. [一篇通俗易懂的讲解OpenGL ES的文章](https://www.cnblogs.com/salam/archive/2016/01/08/5113572.html)


