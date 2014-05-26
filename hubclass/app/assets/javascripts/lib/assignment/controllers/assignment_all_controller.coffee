angular.module('Hust:assignment').controller 'AssignmentAllController', ['api', '$scope', '$location', (api, $scope, $location) ->
  api.all_todo_homeworks (data) ->
    $scope.submit_homeworks = data
  api.all_created_homeworks (data) ->
    $scope.created_homeworks = data

]