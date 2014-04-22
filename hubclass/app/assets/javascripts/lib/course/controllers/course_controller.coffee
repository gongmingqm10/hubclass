angular.module('Hust:course').controller 'CourseController', ['api', '$scope', '$location', (api, $scope, $location) ->

  api.index_groups (data) ->
    $scope.groups = data

]