angular.module('Hust:group').controller 'GroupController', ['api', '$scope', '$location', '$routeParams', (api, $scope, $location, $routeParams) ->


  $scope.group_tabs = (tab) ->
    $location.url('/' + tab)

  $scope.load_group = (group_id) ->
    $scope.group_id = group_id
    api.find_group_by_id group_id, (data)->
      $scope.group = data

]