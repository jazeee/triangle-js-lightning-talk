Meteor.startup ->
	Meteor.publish "chats", ->
		Models.chats.find()
