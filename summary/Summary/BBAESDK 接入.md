BBAESDK iOS
---

#### 独立APP接入BBAESDK V1.0.0

### 1.引入工程

##### 1.1 工程引入BBAESDK包
BBAESDK包含以下内容:
-  BBAESDK.framework
-  BBAESDKResource.bundle

##### 1.2 添加依赖库
- libsqlite3.tbd
- CoreTelephony.framework
- CFNetwork.framework
- MobileCoreServices.framework
- SystemConfiguration.framework
- libz.tbd
- libxml2.tbd
- libresolv.tbd

##### 1.3 访问权限配置
由于身份证开户需上传身份证照片，需要访问系统的“相机”和“相册”

在info.plist文件中添加以下权限配置，并添加文字说明</br>
<key>NSCameraUsageDescription</key></br><string>访问相机的文字说明</string></br><key>NSPhotoLibraryUsageDescription</key></br><string>访问相册的文字说明</string></br><key>NSPhotoLibraryAddUsageDescription</key></br><string>保存到相册的文字说明</string>

##### 1.4 更改编译设置
设置Build Seting -> Other Link Flags为-ObjC


### 2. 初始化BBAESDK
向BBAE交接人员申请项目的appkey。

使用SDK之前，必须引入头文件。

#import <BBAESDK/BBAESDK.h>

初始化功能可以在application:didFinishLaunchingWithOptions:或在使用sdk前进行。 </br>

使用[[BBAESDK sharedInstance] registerAppKey:@"appKey" options:nil]方法注册。</br>

使用[[BBAESDK sharedInstance] setDelegate:self]注册代理，当sdk内部发现sessionId过期，则会通过代理给的新sessionId刷新SDK。
</br>

使用[[BBAESDK sharedInstance] configAppWithLanguage:@"language" DebugModel:YES baseURl:@"baseUrl" appTheme:@"appTheme" showFooter:YES]配置SDK语言、主题、是否显示BBAE服务的footer相关属性

### 3. 唤起BBAE各功能模块
- [ ] 唤起开户模块 [[BBAESDK sharedInstance] createOpenAccountViewController] 
- [ ] 唤起入金模块 [[BBAESDK sharedInstance] createDepositViewController]] 
- [ ] 唤起出金模块 [[BBAESDK sharedInstance] createWithDrawViewController]] 


### 4. 其他接口说明
BBAESDKDelegate 回调方法。sessionId过期之后的回调，使用者通过代理方法传入刷新后的sessionId供sdk内部刷新。

- -(NSString *)onSessionExpired;</br>
举例：

//Session失效回调
- -(NSString *)onSessionExpired
</br>{    
    return @"newSessionId";</br>
}

### 5. SDK定制化
资源统一在BBAESDKResource.bundle里面进行管理

### 6. 兼容性说明
支持iOS8及iOS8+

### 7. 测试账号
可测试开户：

* 18354928661 123456
* 18354928662 123456
* 18354928663 123456
* 18354928664 123456
* 18354928665 123456
* 18354928666 123456
* 18354928667 123456
* 18354928668 123456
* 18354928669 123456
</br>

可测试出入金：

* 15612341232 121212

