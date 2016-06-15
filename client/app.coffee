AutoForm.setDefaultTemplate('materialize')

FlowRouter.route "/",
	name: "home"
	action: ->
		BlazeLayout.render "home"
	subscriptions: (params) ->
		@register 'chats', Meteor.subscribe "chats"

Template.home.helpers
	chats: Models.chats.find()
