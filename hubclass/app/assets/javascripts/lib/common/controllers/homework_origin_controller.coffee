angular.module('Hust:common').controller 'HomeworkOriginController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->
  api.show_origin_homework $scope.group_id, $routeParams.id, (data) ->
    $scope.portfolio = data
]