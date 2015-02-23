profilesModule = angular.module('profilesModule')

profilesModule.controller("HelloController", ($scope) ->
	$scope.name = "Test!";
	#console.log('In the controller!');
)


# helloController($scope)->
# 	$scope.name = 'hello world';