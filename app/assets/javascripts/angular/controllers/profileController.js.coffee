# profilesModule.controller('ProfileController', ($scope, Profile) ->
# 	$scope.profiles = [{id: 'test'}];
# 	$scope.hello = "hello!";

# 	#$scope.profiles = Profile.query();

# 	Profile.query().then( (results) ->
# 		#$scope.profiles = results
# 		$scope.profile = results[0]
# 		$scope.searching = false
# 	)

# 	$scope.updateProfile = ->
# 		$scope.profile.update()
# )

class ProfileController extends @NGController
	@register window.profilesModule

	@$inject: [
		'$scope',
		'Profile'
	]

	init: ->
		@hello = 'hello1'
		@loadProfiles()

	loadProfiles: ->
		@Profile.query().then( (results) =>
			@profile = results[0]
		)	

	update: ->
		@profile.update()
