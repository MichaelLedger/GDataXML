# GDataXML

Support CocoaPods for GDataXML.


### Terminal Commands
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
