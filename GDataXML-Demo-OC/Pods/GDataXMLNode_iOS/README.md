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
