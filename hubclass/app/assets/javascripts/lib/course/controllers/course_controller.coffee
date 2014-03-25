angular.module('Hust:course').controller 'CourseController', ['api', '$scope', (api, $scope) ->

  api.index_groups (data) ->
    $scope.groups = data

  $scope.enter_group = (group_id) ->
    console.log group_id
]