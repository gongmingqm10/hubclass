angular.module('Hust:group').controller 'GroupController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $scope.current_tab = 'note'
  $scope.load_group = (group_id) ->
    $scope.group_id = group_id
    api.find_group_by_id group_id, (data)->
      $scope.group = data
  $scope.redirect_tab = (tab) ->
    $scope.current_tab = tab
    $location.url('/all')
]