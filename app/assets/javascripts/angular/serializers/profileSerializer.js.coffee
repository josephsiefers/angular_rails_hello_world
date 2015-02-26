profilesModule.factory('ProfileSerializer', (railsSerializer) ->
	railsSerializer(->
		@nestedAttribute('user')
		@nestedAttribute('employmentRecords')
		@serializeWith('employmentRecords', 'EmploymentRecordSerializer')
	)
);