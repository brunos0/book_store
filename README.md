# Books Store

A free implementation of some features, like Dio, Mobx, GetIt, SharedPreferences and others stuffes for the application as
a way to comply with the technical test.

## Getting Started

The application was developed with the aim of training the some concepts to consumption of Apis Rest from Flutter.  

## Version  

1.0 - Initial Release.

## TODO  

Save all previous books to avoid fetch list.    
Create a splash screen
Reimplement tests based on new features

## Give a try!  

https://drive.google.com/file/d/16jF24oMoTI5BNRCJq8v-_qPHSg5MIPAW/view?usp=sharing

## Screenshots  

<img src="https://github.com/brunos0/book_store/assets/49425249/43549fe0-b6ab-4d87-bfb8-c2ed22d64bd1" width="260"> <img src="https://github.com/brunos0/book_store/assets/49425249/fc6b65e0-f677-40c2-8978-4b343a084967" width="260"> <img src="https://github.com/brunos0/book_store/assets/49425249/b6fc2b73-e751-461a-8c0a-3e8c4ccbd43c" width="260">

## Important Notes

you should have the env.json to make this works, but maybe you don't have it :P
If you do, put this line in you launch.json

  "toolArgs": ["--dart-define-from-file","env.json"]

for build use the same syntax above to build apk like this:
flutter build apk --dart-define-from-file=env.json

for create the mocks you should run this command
dart run build_runner build --delete-conflicting-outputs;  
