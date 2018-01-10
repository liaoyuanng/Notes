# 读《图解 HTTP》笔记

## ARP 协议

ARP协议(`Address Resolution Protocol`)，即地址解析协议。是根据`IP`地址获取物理地址(MAC)的`TCP/IP协议`。

## TCP

`TCP`位于传输层，提供可靠的字节流(注意这里的描述**字节流**,所以 TCP 是流，而不是包)服务。为了准确无误的将数据送达目标，`TCP`协议采用三次握手(three-way handshaking) 策略:

1. 首先，发送端发送一个带 SYN 标志的数据包给接收端。
2. 接收到收到后，回传一个带有 SYN/ACK 的数据包
3. 发送端再回传一个带 ACK 标志的数据包。握手结束。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15149932337872.jpg)

HTTP请求示意图

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153084818984.jpg)



## URL 和 URI

`URL`表示资源的地点(互联网上所处的位置)。`URI` 表示字符串标识某一互联网资源。`URL`是`URI`的子集。`URI`表示互联网上某个资源，它包含`URL`和`URN`(统一资源名称)，而`URL`则表示这个资源具体的位置。比如你有一台 MAC 电脑，我也有一台 MAC 电脑，这都是`URI`，但是，怎么区分呢，继续拿这个举例子，比如你在河南郑州，那么可以简单表示为:`地址：河南/郑州/你家/MAC`，而我在上海，表示为`地址：上海/静安/我家/MAC`，这就是`URL`。因为现在`URN`已经很少见了，所以现在基本上见到的既是`URI`也是`URL`。

## 请求和响应

HTTP 协议规定：请求从`客户端`发出，`服务器`端回复响应。

### 请求

请求报文是由`请求方法`、`请求URI`、`协议版本`、`可选的请求首部字段`和`内容实体`构成的。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153061515839.jpg)


请求方法有下面几种：


| 方法 | 说明 | 协议版本 |
| :-: | :-: | :-: |
| GET | 获取资源 | 1.0、1.1  |
| POST | 传输实体主体 | 1.0、1.1 |
| PUT | 传输文件 | 1.0、1.1 |
| HEAD | 获取报文首部 | 1.0、1.1 |
| DELETE | 删除文件 | 1.0、1.1 |
| OPTIONS | 询问支持的方法 | 1.1 |
| TRACE | 追踪路径 | 1.1  |
| CONNECT | 要求用隧道协议连接代理 | 1.1 |
| LINK(已废弃) | 建立和资源之间的联系 | 1.0 |
| UNLINK(已废弃) | 断开连接关系 | 1.0 |

其中，`HEAD`方法是获得报文首部，和`GET`方法一样，只是不返回报文主体部分。用于确认 URI 的有效性及资源更新的日期时间等。`PUT`和`DELETE`方法由于不带验证机制，所以一般不使用。`OPTIONS`方法用查询针对请求URI指定资源支持的方法。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153071237018.jpg)

`TRACE`方法用来追踪请求经过的转发，在`Max-Forwards`首部字段中填入数值，每经过一个服务器端就将该数字减一，当数值刚好减到0时，就停止继续传输。这个方法不常用，而且容易被`XST（跨站追踪）`攻击。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153078439847.jpg)

`CONNECT`方法要求在与代理服务器通信时，建立隧道，实现用隧道协议进行`TCP`通信。主要使用`SSL`和`TLS`一些把通信内容加密后经网络隧道传输。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153080039011.jpg)

### 响应

响应报文基本上由`协议版本`、`状态码`（表示请求成功或失败的数字代码）、`用以解释状态码的原因短语`、`可选的响应首部字段`以及`实体主体`构成.

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153065402666.jpg)

### 请求中的<span id = "connection">持久连接</span>

在 HTTP 协议的初始版本中，每一次 HTTP 通信都要断开一次 TCP 连接，因为之前都是很小的文本传输, 所以也没有什么问题，但慢慢的，图片的需求越来越多，在一个`HTML`页面可能有多张图片，而这些图片（资源）需要单独的请求获取，就造成了没有必要的 TCP 的建立和断开。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153089067780.jpg)

为了解决这个问题，就出现了`持久连接(HTTP keep-alive)`的方法。只要任意一端没有明确提出断开连接，就会继续保持`TCP`连接状态。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153090084089.jpg)

在`HTTP/1.1`中持久连接已经是默认行为。


### Cookie

由于**HTTP是无状态协议**，它不对之前发生过的请求和响应进行管理，无法根据之前的状态进行本次的请求处理。比如一个电商页面，用户登录后，然后进行购买，但是这个时候服务器端并不知道他已经登录了，需要附加额外的参数来管理登录状态。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153141156009.jpg)

为了解决这个问题，所以引入了`Cookie`技术。

Cookie 技术通过在请求和响应报文中写入 Cookie 信息来控制客户端的状态。

1. 客户端第一次请求，这个时候没有`Cookie`信息。
2. 服务器端发送的响应报文内增加一个`Set-Cookie`的首部字段信息，告知客户端保存`Cookie`。
3. 客户端再次请求的时候，客户端会自动在报文中加入`Cookie`值发送出去。
4. 这样，服务器端就能够知道这个客户端之前的状态。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153144988830.jpg)

### HTTP 报文

用于 HTTP 协议交互的信息称为 HTTP 报文。请求端的是请求报文，响应端的是响应报文。报文大致可分为报文首部和报文主体两块，两者之间通常用空行来划分。报文主体不是必须的。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153183891618.jpg)

请求报文实例：

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153188871970.jpg)

响应报文实例

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153189070154.jpg)

### 范围请求(Range Requeset)

在下载中，如果遇到了网络中断的情况，就必须从头开始，大大影响了效率。为了解决这个问题，就产生了一种可恢复的机制，让下载可以在中断处恢复下载，即`断点续传`。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15153857888012.jpg)

我们使用首部字段`Range`来指定资源的 Byte 范围。

* 5001 ~ 10000字节：`Range:bytes = 5001-10000`
* 5001字节之后全部的：`Range:bytes = 5001-`
* 多重范围，0-3000，5000-7000：`Range:bytes = -3000, 5000-7000`

### HTTP 首部字段

HTTP 首部字段是构成 HTTP 报文的要素之一。它分为四种：

* 通用首部字段: 请求报文和响应报文两方都会使用的首部。
* 请求首部字段: 客户端发送请求报文时使用的首部。
* 响应首部字段: 服务器端返回响应报文时使用的首部。
* 实体首部字段: 针对请求报文和响应报文的实体部分使用的首部。

部分字段解释：

#### 通用首部字段

1. Cache-Control

    `Cache-Control`控制缓存的行为，指令的参数是可选的，多个指令之间通过`，`分割。
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15153996798170.jpg)
    
    ```
    Cache-Control: provate，max-age=0，no-cache
    ```
    
    缓存请求指令一览
    
    | 指令 | 参数 | 说明 |
    | :-: | :-: | :-: |
    | no-cache | - | 强制向源服务器再次验证 |
    | no-store | - | 不缓存请求或响应的任何内容 |
    | max-age=[秒] | 必须 | 响应的最大 Age 值|
    | max-stale(=[秒])| 可省略 | 接收已过期的响应 |
    | min-fresh=[秒]| 必须 | 期望在指定时间内的响应仍有效 |
    | no-transform| 无 | 代理不更改媒体类型 |
    | only-if-cached| 无 | 从缓存获取资源 |
    | cache-extension| - | 新指令标记(token) |
    
    缓存响应指令一览
    
    | 指令 | 参数 | 说明 |
    | :-: | :-: | :-: |
    | public | - | 可向任意方提供响应的缓存 |
    | private | 可省略 | 仅向特定用户返回响应 |
    | no-cache | 可省略 | 缓存前必须先确认其有效性 |
    | no-store | - | 不缓存请求或响应的任何内容 |
    | no-trnasform| -| 代理不可更改媒体类型 |
    | must-revalidate| - | 可缓存但必须向源服务器进行确认 |
    | proxy-revalidate| - | 要求中间缓存服务器对缓存的响应有效性再进行确认 |
    | max-age=[秒] | 必须 | 响应的最大 Age 值 |
    | s-maxage=[秒] | 必须 | 公共缓存服务器响应的最大 Age 值 |
    | cache-extension| - | 新指令标记(token) |
    
    * no-cache 
    
    指令的目的为了防止从缓存中返回过期的资源，而不是不缓存。

2. Connection

    `Connection`字段具有两个作用：

    * 控制不再转发给代理的首部字段
    * 管理持久连接

    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15154011047041.jpg)
    
    `HTTP/1.1`版本默认连接都是[持久连接](#connection),如果要在之前版本维持持续连接，则设值为`Keep-Alive`。客户端会在持久连接上连续发送请求，当服务器端明确要断开连接时，会指定`Connection`首部字段的值为Close。

3. Data

    `Data`表明创建`HTTP`报文的日期和时间。日期时间格式为：
    
    * HTTP/1.1 RFC1123:
    
        ```
        Data: Tue，03 Jul 2012 04:40:40 GMT
        ```
    * HTTP/1.0 RFC850:
    
        ```
        Data: Tue，03-Jul-12 02:02:02 GMT
        ```
    * Other
    
        ```
        Data: Tue Jul 02 02:02:02 2018
        ```
        
#### 请求首部字段

`请求首部字段`是从`客户端`往`服务器端`发送请求报文中所使用的字段，用于补充请求的`附加信息`、`客户端信息`、`对响应内容相关的优先级`等内容。

1. Accept

    `Accept`首部字段可告知服务器，*用户代理* 能够处理的媒体类型及媒体类型的相对优先级。
    
    ```
    Accept: text/html, application/xhtml+xml,applicaiton/xml;q=0.9,*/*;q=0.8
    ```
    
    其中，`text/html, application/xhtml+xml,applicaiton/xml`属于媒体类型，`*/*`表示任意的媒体类型。`q=0.9`表示优先级(权重)，`q`的值范围是`0~1`，如果不指定，默认是`1.0`。


2. Accept-Charset

    用来告知服务器用户代理支持的字符集及相对优先顺序。
    
    ```
    Accept-Charset: iso-8859-5,unicode-1-1;q=0.8
    ```

3. Accept-Encoding

    用来告知服务器用户代理支持的`内容编码格式`及`优先顺序`。
    
    ```
    Accept-Encoding:gzip,deflate
    ```
    编码格式有：
    
    * gzip，由文件压缩程序 gzip 生成的编码格式。
    * compress，由 UNIX 文件压缩程序 compress 生成的编码格式。
    * deflate，组成使用 zlib 格式及由 deflate 压缩算法生成的编码格式。
    * identity，不执行压缩或不会变化的默认编码格式。

4. Accept-Language

    告知服务器用户代理能够处理的自然语言集(zh、en、jp等)及优先级。
    
    ```
    Accept-Language: zh-cn,zh;q=0.7,en-us,en;q=0.3
    ```
    
    如果没有优先级高的对应的响应，就会返回低优先级的响应。

5. Host

    告知服务器，请求的资源所处的互联网主机名和端口号。**这个字段是唯一一个必须被包含在请求内的首部字段**
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15154122645933.jpg)

6. If-Match

    附带条件请求，形如`If-xxx`这种样式的请求首部字段，都可称为条件请求。服务器接收到附带条件的请求后，只有判断指定条件为真时，才会执行请求。
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15154124507946.jpg)

7. Referer

    告知服务器，请求的原始资源的`URI`.
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15155527531865.jpg)


8. TE

    告知服务器，客户端能够处理响应的`传输编码方式`及`优先级`
    
    ```
    TE: gzip,deflate;q=0.5
    ```
9. User-Agent

    告知服务器，客户端的种类。
    
    ```
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0.1
    ```

#### 响应首部字段

`响应首部字段`是由`服务器`向`客户端`返回响应报文中所使用的字段，用于补充响应的附加信息、服务器信息，以及对客户端的附加要求等。

![](http://7xsgdb.com1.z0.glb.clouddn.com/15155538481739.jpg)

1. Accpet-Ranges

    告知客户端，服务器是否能处理范围请求，以指定获取服务器端某个部分的资源。
字段的值有两种：可处理时，指定为`bytes`；不能处理时，指定为`none`.

2. Age
    
    告知客户端，源服务器在多久前创建了响应。单位为秒
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15155542983298.jpg)

3. ETag

    告知客户端，实体标识。它是一种可将资源以字符串形式做唯一性标识的方法。服务器会为每份资源分配对应的`ETag`值，当资源更新时，`ETag`值也需要更新。
    `ETag`值又分为`强ETag值`和`弱ETag值` 。
    
    * 强ETag值：无论实体发生多么细微的变化都会改变其值
    * 弱ETag值：只用于标记资源是否相同，只有资源发生了根本改变，产生差异时才会改变`ETag`值。这时，会在字段值最开始处附加`W/`：`ETag: W/"usagi-1234"`

4. Location

    可以将响应接收方(客户端)引导至某个与请求URI位置不同的资源。
    
    ![](http://7xsgdb.com1.z0.glb.clouddn.com/15155843491597.jpg)

    该字段一般会搭配`code 3xx Redirection`使用,提供重定向的`URI`
    
    
5. Retry-After

    告知客户端应该在多久之后再次发送请求，常配合状态码`503 Service Unavailable`或`3xx Redirect`响应一起使用。
    
    ```
    Retry-After:120
    // or
    Retry-After: Wed, 04 Jul 2012 06:34:24
    ```
    
6. Server

    告知客户端，当前服务器上安装的`HTTP`服务器应用程序的信息。
    
    ```
    Server:Apache/2.2.17(Unix)
    ```
    
#### 实体首部字段

实体首部字段是包含在请求报文和响应报文中的实体部分所使用的首部，用与补充内容的更新时间与实体相关的信息。 

