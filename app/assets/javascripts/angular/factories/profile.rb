# profilesModule = angular.module('profilesModule', ['ngResource']);

# profilesModule.factory "profile", ($resource) ->
# 	return $resource('api/v1/profiles:id', {id: @id} );

profilesModule = angular.module('profilesModule');

profilesModule.factory("Profile", ($http, RailsResource) ->
	class Profile extends RailsResource
		@configure url: '/api/v1/profiles', name: "profile"
)