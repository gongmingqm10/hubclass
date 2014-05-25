angular.module('Hust:assignment').controller 'AssignmentController', ['api', '$scope', '$location', (api, $scope, $location) ->
  api.all_homeworks (response) ->
    console.log response
]