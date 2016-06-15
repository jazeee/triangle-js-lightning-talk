# meteor-chat
Ten minutes of coding that I did at the beginning of an impromptu [Lightning Talk](http://www.meetup.com/Triangle-JavaScript/events/231335330/) on [MeteorJS](https://www.meteor.com/). Thanks to [TriangleJS](http://www.meetup.com/Triangle-JavaScript/) for the great event.

I used this to briefly talk about some basic concepts in MeteorJS. Just things I find cool.

### How to run
Install MeteorJs 1.3.2 or above

Options:
* Run using `meteor --port 3030`
   * Optionally, install Mongo and set `MONGO_URL` prior to running, and use. This will persist changes if you restart meteor.
* `./start.sh`
* Then visit http://localhost:3030

### Things to try (while running the application)
Observe app in multiple tabs or between phone and computer.
#### In browser debugging console
``` JavaScript
Models.chats.findOne();
Models.chats.find().fetch();
Models.chats.insert({title: "This is a test"});
foundChat = Models.chats.findOne({title: /test/i});
// The following will be blocked by server code
Models.chats.update({_id: foundChat._id}, {title: "Another test"});
// Change server code to allow update and try again.
```

#### In Meteor REPL
* On server, in this directory, run `meteor shell` to open a REPL
* Run the same commands as above.
``` JavaScript
Models.chats.findOne();
Models.chats.find().fetch();
Models.chats.insert({title: "This is a test"});
foundChat = Models.chats.findOne({title: /test/i});
// The following will succeed on the server
Models.chats.update({_id: foundChat._id}, {title: "Another test"});
```
* Observe that all commands succeed. (Server has full control over permissions, of course.)
* Observe that the changes propagate automatically to each client and to Mongo

#### In Mongo (if you are using `MONGO_URL`)
* Open Mongo database. `mongo chat2`
* Try the following, while watching changes in browser
``` Mongo
db.chats.findOne();
db.chats.find();
db.chats.insert({title: "Test from Mongo"});
foundChat = db.chats.findOne({title: /test/i});
db.chats.update({_id: foundChat._id}, {title: "Another test from Mongo"});
```

### My thoughts
* Sass styling is the largest code in this project.
* Code statistics:
   * 17 lines of Coffeescript
   * 6 lines of Jade
   * 25 lines of Sass
* Hopefully, this demonstrates the potential of Meteor, from a few lines of code written in 10 minutes.
   * I'm using Coffeescript and Jade (soon to be `pug`), but you can use ES6, Typescript, HTML, or whatever you prefer.
   * See [tutorials](https://www.meteor.com/tutorials).
   * Can use Angular 1, React, or Blaze. Angular 2 is also available.
   * Meteor is quite modular, and you can create packages for your own use.
* This project has a few extra packages that I am not really using. (FlowRouter, Autoform, Accounts). They are worth looking at, and can significantly simplify development.
   * See https://github.com/jazeee/meteor-chat for an example chat application using these packages.
   * Heroku app example: http://jazeee-meteor-chat.herokuapp.com
