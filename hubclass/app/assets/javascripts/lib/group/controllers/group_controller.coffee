angular.module('Hust:group').controller 'GroupController', ['api', '$scope', (api, $scope) ->

  $scope.load_group = (group_id) ->
    $scope.group_id = group_id
    api.find_group_by_id group_id, (data)->
      $scope.group = data

]