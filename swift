
一个大体的介绍。
特别是array中自动copy的方式。
? 放在某个 optional 的 protocol 方法的括号前面，以表示询问是否可以对该方法调用。delegate?.questionViewControllerDidGetResult?(self, result)  
http://onevcat.com/2014/06/walk-in-swift/

每周一更的tips
http://swifter.tips

===========================================================
Tips的总结

 - selector
selector是objc runtime的概念，所以一个 Swift 中的 private 方法如果要使用selector，方法定义前需加上@objc。
如果方法的第一个参数有外部变量的话，在通过字符串生成 Selector 时还有一个约定，那就是在方法名和第一个外部参数之间加上 with：
func aMethod(external paramName: AnyObject!) { ... } selector中写成 let s = Selector("aMethodWithExternal:")。

 - protocol
protocol内方法不加mutating的话，enum和struct继承时不可在方法内改变成员变量，但class不受影响。

 - @autoclosure
@autoclosure把一句表达式自动地封装成一个闭包。
？？ 类似 ？： 

 - Optional Chaining
返回的也是一个optional。

 - 函数调用时参数名称约定：
对于普通方法，匿名第一个参数，并强制要求其他的参数名称；
对于初始化方法，强制要求所有参数使用命名 (除非有特殊情况或完全没有歧义的情况下可以省略名称)。
对于全局方法，不写参数名称，类似c方法调用。

 - 下标
自定义数组下标，扩展Array并实现新的subscript。

 - 实例方法的动态调用
let f = MyClass.method
let object = MyClass()
let result = f(object)(1)
等价于
let object = MyClass()
let result = object.method(1)
getter和setter不可用f方式调用。
如果类方法和实例方法同名，则上面f方式会取到类方法。

 - 命名空间
放到不同target里，比如建一个framework。
统一module下把同名class放到不同struct里，使用时带上struct名。

 - 单例
private let sharedInstance = MyManager()
class MyManager  {
    class var sharedManager : MyManager {
        return sharedInstance
    }
}
利用let保证线程安全，通过private把变量限定在当前文件内。

 - block避免循环引用
block内添加标注 [weak self] ，指明里面的值用何种方式使用。然后再
if let strongSelf = self {
        println("The name is \(strongSelf.name)")
    }



