# resource_manager

This is a library of Flutter for resource manager works as similar as what Android does. It works with JSON file.  
使用JSON文件的类Android的Flutter资源管理库。

![alt](https://github.com/chrisfang6/uploads/blob/master/resource_manager/1.png)

## How to use
1. Use ```initBaseResources(double devicePixelRatio, String baseResourceFile)``` to init the base resources from JSON file.  
使用```initBaseResources(double devicePixelRatio, String baseResourceFile)```从指定JSON文件初始化基础资源。  
eg.,```initBaseResources(window.devicePixelRatio, 'res/values.json')```  

2. Use ```getResources(String jsonFile)``` to get resources from JSON file.   
使用```getResources(String jsonFile)```从JSON文件获取资源。  
eg., ```getResources('res/example.json')```  

3. Use ```getXXX(String name, {Resources fromResources})``` to get the resource by name.   
使用```getXXX(String name, {Resources fromResources})```获取指定名称资源。

### JSON file
The JSON file for resources has nodes named **dimens**, **colors**, **drawable**, **strings**, **integers**, **doubles**.   
资源JSON文件的节点有**dimens**, **colors**, **drawable**, **strings**, **integers**, **doubles**。   

eg.,
```
{  
    "dimens": {
        "h1_text_size": "32dp",
        "h2_text_size": "24dp",
        "h3_text_size": "19dp",
        "h4_text_size": "16dp",
        "h5_text_size": "14dp",
        "h6_text_size": "13dp"
    },
    "colors": {
        "black": "#000000",
        "FireBrick": "#B22222",
        "DeepPink": "#FF1493",
        "Gold": "#FFD700",
        "OliveDrab": "#6B8E23",
        "Lime": "#00FF00",
        "RoyalBlue": "#4169E1",
        "DarkOrchid": "#9932CC"
    },
    "drawable": {
        "logo": "graphics/FlutterDart.png"
    },
    "strings": {
        "string 1": "base string 1"
    },
    "integers": {
        "integer 1": 10,
        "integer 2": 20
    },
    "doubles": {
        "double 1": 30.3,
        "double 2": 40
    }
}
```   

Value can be a string with prefix, such __@dimen/__, __@color/__, __@drawable/__, __@string/__, __@integer/__ and __@double/__, and then refer to another resource. If the resource can't be find in the referred resources, it would keep looking for the resource in the base resources.  
值可以是有__@dimen/__, __@color/__, __@drawable/__, __@string/__, __@integer/__ 和 __@double/__ 为前缀的字符串，指向其他资源。当在指定资源文件中找不到指定名称资源时，继续在基础资源文件中寻找。

### Methods for getting resource
1. ```getDimension(String name, {Resources fromResources, Set<String> soughtNames})```
2. ```getColor(String name, {Resources fromResources, Set<String> soughtNames})```
3. ```getDrawable(String name, {Resources fromResources, Set<String> soughtNames})```
4. ```getString(String name, {Resources fromResources, Set<String> soughtNames})```
5. ```getInteger(String name, {Resources fromResources, Set<String> soughtNames})```
6. ```getDouble(String name, {Resources fromResources, Set<String> soughtNames})```

If optional parameter fromResources is ignored, then the methods would try to get resources from base resource file.   
如果忽略可选参数fromResources，则直接从基础资源文件中寻找。

Ignore optional parameter soughtNames, please.
请忽略可选参数soughtNames。


