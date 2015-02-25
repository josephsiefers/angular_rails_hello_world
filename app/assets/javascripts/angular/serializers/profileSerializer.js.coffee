profilesModule.factory('ProfileSerializer', (railsSerializer) ->
	railsSerializer(->
		@nestedAttribute('user')
		#nestedAttribute('employment_records')
	)
);