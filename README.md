# Ribbit

You are being given a large legacy codebase. Some of the code will be quite familiar, some less so. This is intentional as we want you to practice the very common tasks of: debugging, understanding unfamiliar code, researching documentation, and trying out new objects and frameworks.

Your job will be to fix and test all of the bugs listed below. Remember, when you fix a bug, you should not simply get rid of the issue, but address the root cause of the bug. Be sure to leave comments in your code explaining how you tracked down and fixed each bug.

To get an "exceed expectations", you will also need to add several features to the app without compromising any existing functionality or code quality. The features to be implemented are described in detail below. You will also need to implement messaging with a real backend service and update the app based on designs in the provided mockups. Comments will be essential in explaining your additions and thinking.

Happy Hunting!

Fix Bug #1:
When you first launch the app, all you will see is a blank screen. There is a story board within the project with an initial view controller which should be displayed, but it is not.

Fix Bug #2:
The login screen has an Auto Layout bug which shows up in the console log. Whenever the login screen is presented, an error is displayed that reads: "Unable to simultaneously satisfy constraints."

Fix Bug #3:
The FriendsViewController is displaying duplicate friends. Each friend should only be displayed once.

Fix Bug #4:
The EditFriendsViewController should show a checkmark next to usernames that are already friends.

Fix Bug #5:
There is a memory leak in the app, please fix it. Steps to reproduce the memory leak: Run the app on a device simulator and watch the memory report in Xcode Select the Camera tab Take a photo and then tap on "Use Photo" Hit send button As you repeat steps 1-4 a few times you will notice that the memory usage of the app keeps going up. A memory leak is when memory is allocated for an object but is not released appropriately. The object may no longer be pointing to the memory location, but the memory is still allocated. Please track down the leak and fix it. We have added a link to a helpful workshop under Project Resources for your reference.

Fix Bug #6:Remove deprecated APIs
As Apple introduces newer versions of the iOS SDK, it also introduces new APIs and retires the old ones. The APIs that are no longer supported by the new version of the SDK are known as deprecated APIs. When you build the app you will see in the issue navigator that there are yellow triangles which warn you that the APIs are no longer available. Modify the app to use the latest version of the APIs. Once you implement the newer version, the warnings will go away. Make sure that by implementing the new API you do not take away the existing functionalities.


#Extra Credit

To get an "exceeds" rating, you can expand on the project in the following ways:

Implement missing features
Implement all the missing features: sign-up, login, sending an image, deleting the image, friends selection, plus a workflow for when the user forgets their password.

Implement designs from mockups
Design the user interface for the app based on the mockups provided. Other resources like the app icon, launch and background images are provided in the starter file.

Add a backend
The starter app is like a prototype. It has all the features of a fully functional app, but without proper backend processing service, it does not actually work. The app originally worked with a service called Parse which is no longer available. There are several options you have: you can setup your own Parse server or use an alternatives like: Firebase. This looks like a monumental task but it is an extremely useful exercise and experience to have for your under your belt
