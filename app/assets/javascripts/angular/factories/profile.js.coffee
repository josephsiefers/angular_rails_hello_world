# profilesModule.factory "profile", ($resource) ->
# 	return $resource('api/v1/profiles:id', {id: @id} );

profilesModule.factory("Profile", (RailsResource) ->
	class Profile extends RailsResource
		@configure url: '/api/v1/profiles', name: "profile"
)