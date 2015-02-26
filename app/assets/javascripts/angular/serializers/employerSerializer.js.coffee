profilesModule.factory('EmployerSerializer', (railsSerializer) ->
	railsSerializer(->
		@rename('name', "NAME")
	)
);