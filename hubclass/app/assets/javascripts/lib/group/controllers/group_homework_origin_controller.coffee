angular.module('Hust:group').controller 'GroupHomeworkOriginController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->
  api.show_origin_homework $scope.group_id, $routeParams.id, (data) ->
    $scope.portfolio = data
]