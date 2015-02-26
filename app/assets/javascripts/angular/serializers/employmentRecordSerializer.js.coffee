profilesModule.factory('EmploymentRecordSerializer', (railsSerializer) ->
	railsSerializer(->
		@nestedAttribute('employer')
	)
);