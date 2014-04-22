angular.module('Hust:group').controller 'GroupController', ['api', '$scope', '$location', '$routeParams', (api, $scope, $location, $routeParams) ->

  $scope.group_id = ""

  $scope.group_tabs = (tab) ->
    $location.url('/' + tab)

  $scope.group_id = $routeParams.groupId

  console.log $scope.group_id

]