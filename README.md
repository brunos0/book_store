# Technical Test

A free implementation of some features for the application as a way to comply with the technical test.

## Getting Started

The application was developed with the aim of training the concepts of Hive, Bloc, Dependency Injection, consumption of Apis Rest from Flutter.  

## Version  

1.0 - Initial Release.

## TODO  

Save all previous books to avoid fetch list.    
Create a splash screen
Reimplement tests based on new features

## Give a try!  

https://drive.google.com/file/d/16jF24oMoTI5BNRCJq8v-_qPHSg5MIPAW/view?usp=sharing

## Screenshots  



## Important Notes

you should have the env.json to make this works, but maybe you don't have it :P
If you do, put this line in you launch.json

  "toolArgs": ["--dart-define-from-file","env.json"]

for build use the same syntax above to build apk like this:
flutter build apk --dart-define-from-file=env.json

for create the mocks you should run this command
dart run build_runner build --delete-conflicting-outputs;  