self = @

self.Models =
	chats: new Mongo.Collection "chats"

self.Models.chats.allow
	insert: -> true
