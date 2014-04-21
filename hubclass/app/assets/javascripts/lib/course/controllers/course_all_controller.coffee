angular.module('Hust:course').controller 'CourseAllController', ['api', '$scope', '$location', (api, $scope, $location) ->

  $scope.groups = []

  api.index_groups (data) ->
    $scope.groups = $scope.groups.concat(data)

  $scope.enter_group = (group_id) ->
    $location.url('/group/'+group_id)

]