profilesModule = angular.module('profilesModule', ['rails']);

# profilesModule.factory "Profile", ($resource) ->
# 	return $resource('/api/v1/profiles:id', {id: @id} );

profilesModule.factory("Profile", ($http, RailsResource) ->
	class Profile extends RailsResource
		@configure url: '/api/v1/profiles', name: "profile"
)

profilesModule.controller('ProfileController', ($scope, Profile) ->
	$scope.profiles = [{id: 'test'}];
	$scope.hello = "hello!";

	#$scope.profiles = Profile.query();

	Profile.query().then( (results) ->
		$scope.profiles = results
		$scope.searching = false
	)
)

