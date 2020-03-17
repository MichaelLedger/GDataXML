# GDataXML
*Support CocoaPods for GDataXML, create XML with automatic line breaks and CDATA format.*

```
<?xml version="1.0" encoding="UTF-8"?>
<PEOPLE ID="123456">
  <TEST><![CDATA[You will see this in the document and can use reserved characters like < > & ""]]></TEST>
  <NAME>张三</NAME>
  <AGE>18</AGE>
  <SEX>MAN</SEX>
</PEOPLE>
```

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like GDataXMLNode_iOS in your projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required to build GDataXMLNode_iOS 3.1.0+.

#### Podfile

To integrate GDataXMLNode_iOS into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '6.0'

target 'TargetName' do
pod 'GDataXMLNode_iOS', '~> 3.1.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## Support CDATA format quickly

You could just replace following define options in `GDataXMLNode.m` to support CDATA format:
```
// static const int kGDataXMLParseOptions = (XML_PARSE_NOCDATA | XML_PARSE_NOBLANKS);
static const int kGDataXMLParseOptions = (XML_PARSE_NOBLANKS);
```

## Terminal Commands
```
$ pod spec create GDataXMLNode
$ pod lib lint --allow-warnings
$ git config --list
$ git config remote.origin.url https://MichaelLedger@github.com/MichaelLedger/GDataXML.git

# new tag version equal to podspec spec.version 
$ git tag 1.0.0
$ git push origin 1.0.0
```
Add /Users/user/.ssh/id_rsa.pub to Github->Settings->SSH and GPG keys to solve:git@github.com: Permission denied (publickey) and use following command to verify:
```
$ ssh git@github.com
```
`$ pod trunk push GDataXMLNode.podspec`

Validating podspec
 -> GDataXMLNode (1.0.0)
    - NOTE  | xcodebuild:  note: Using new build system
    - NOTE  | [iOS] xcodebuild:  note: Planning build
    - NOTE  | [iOS] xcodebuild:  note: Constructing build description
    - NOTE  | [iOS] xcodebuild:  warning: Skipping code signing because the target does not have an Info.plist file and one is not being generated automatically. (in target 'App' from project 'App')

[!] Authentication token is invalid or unverified. Either verify it with the email that was sent or register a new session.

```
$ pod trunk register 'MichaelLedger@163.com' 'MichaelLedger' --description='mac pro'
[!] Please verify the session by clicking the link in the verification email that has been sent to MichaelLedger@163.com
```

```
$ pod trunk push GDataXMLNode.podspec
[!] You (michaelledger@163.com) are not allowed to push new versions for this pod. The owners of this pod are unclaimed-pods@cocoapods.org.
```

```
$ pod trunk push GDataXMLNode_iOS.podspec
/Users/mxr/.rvm/gems/ruby-2.0.0-p643/gems/cocoapods-1.7.4/lib/cocoapods/executable.rb:93: warning: Insecure world writable dir /Users/mxr in PATH, mode 040777
Updating spec repo `master`

CocoaPods 1.9.1 is available.
To update use: `gem install cocoapods`

For more information, see https://blog.cocoapods.org and the CHANGELOG for this version at https://github.com/CocoaPods/CocoaPods/releases/tag/1.9.1

Validating podspec
 -> GDataXMLNode_iOS (1.1.0)
    - NOTE  | xcodebuild:  note: Using new build system
    - NOTE  | [iOS] xcodebuild:  note: Planning build
    - NOTE  | [iOS] xcodebuild:  note: Constructing build description
    - NOTE  | [iOS] xcodebuild:  warning: Skipping code signing because the target does not have an Info.plist file and one is not being generated automatically. (in target 'App' from project 'App')

Updating spec repo `master`

CocoaPods 1.9.1 is available.
To update use: `gem install cocoapods`

For more information, see https://blog.cocoapods.org and the CHANGELOG for this version at https://github.com/CocoaPods/CocoaPods/releases/tag/1.9.1


--------------------------------------------------------------------------------
 🎉  Congrats

 🚀  GDataXMLNode_iOS (1.1.0) successfully published
 📅  March 10th, 01:31
 🌎  https://cocoapods.org/pods/GDataXMLNode_iOS
 👍  Tell your friends!
--------------------------------------------------------------------------------
```
```
$ pod search GDataXMLNode_iOS
[!] Unable to find a pod with name, author, summary, or description matching `GDataXMLNode_iOS`
```
```
$ rm ~/Library/Caches/CocoaPods/search_index.json
$ pod search GDataXMLNode_iOS

-> GDataXMLNode_iOS (1.1.0)
Support CocoaPods for GDataXML.
pod 'GDataXMLNode_iOS', '~> 1.1.0'
- Homepage: https://github.com/MichaelLedger/GDataXML
- Source:   https://github.com/MichaelLedger/GDataXML.git
- Versions: 1.1.0 [master repo]
```

```
$ pod search GDataXMLNode_iOS
/Users/mxr/.rvm/gems/ruby-2.0.0-p643/gems/cocoapods-1.7.4/lib/cocoapods/executable.rb:93: warning: Insecure world writable dir /Users/mxr in PATH, mode 040777
Creating search index for spec repo 'aliyun'.. Done!
Creating search index for spec repo 'aliyun-1'.. Done!
Creating search index for spec repo 'master'..
```
这是因为你的主文件夹只能被你写入，不能被其他人写入，这里存在一个权限问题，和gem有关，解决办法是：
```
$ sudo chmod go-w /Users/mxr
````
这里的/Users/mxr要和警告中保持一致，博主在网上看到很多人都写的/usr/lcoal,这样是没用的，已踩坑，遇到需谨慎。
```
$ pod search GDataXMLNode_iOS
Creating search index for spec repo 'aliyun'.. Done!
Creating search index for spec repo 'aliyun-1'.. Done!
Creating search index for spec repo 'master'..

```
