EventCenter
Ge Zhu

This is a script that helps making more orgnized events in Unity. It can only handle events that take no arguments and return null for now. I think it is difficult to create a clean solution that can handle all the argument and return type in C# -.- The idea comes from the implementation of EventTarget class in Cocos Creator.

Features:

Suppose you need to send many events in PLayer.cs like when the player is died, when he is leveled up, when he enters low health, etc.

Originally you need to declare and create the delegate function for each of these events in Player.cs. It is super inefficient and also makes your Player.cs very large.

Now, you can just do it by:
EventCenter.Emit(“playerdie”);
EventCenter.Emit(“playerlvlup”);
EventCenter.Emit(“playerlowhealth”);


Originally, either the player or the listener (UI for example) has to keep a reference of the other. It is not a preferred design and you need to keep adding and removing references.

Now you just keep a reference to the EventCenter for all your classes that need to get access to events.


The usage is very simple:

1.Attach the EventCenter.cs Script to an empty game object in the scene.
2.In event sender class, call
EventCenter.Emit(eventName);
To emit an event named eventName. You don’t need to initialize any event.
eventName is a string.
3.IN event linsten class, call
EventCenter.On(eventName);
When you want to start listening to the event named eventName. Usually called in onEnable().
And call
EventCenter.Off(eventName);
When you want to stop listening to the event named eventName. Usually called in onDisable().

Typo of eventName WILL lead to a failure.
