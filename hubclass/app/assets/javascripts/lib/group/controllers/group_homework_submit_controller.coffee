angular.module('Hust:group').controller 'GroupHomeworkSubmitController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->
  api.show_submit_homework $scope.group_id, $routeParams.homework_id, (data) ->
    $scope.portfolio = data
]