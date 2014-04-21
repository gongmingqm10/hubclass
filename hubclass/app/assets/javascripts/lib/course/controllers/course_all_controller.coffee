angular.module('Hust:course').controller 'CourseAllController', ['api', '$scope', '$location', (api, $scope, $location) ->

  api.index_groups (data) ->
    $scope.groups = data
  $scope.enter_group = (group_id) ->
    $location.url('/group/'+group_id)
]