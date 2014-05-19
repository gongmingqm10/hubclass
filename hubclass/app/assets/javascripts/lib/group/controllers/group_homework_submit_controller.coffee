angular.module('Hust:group').controller 'GroupHomeworkSubmitController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->
  api.show_submit_homework $scope.group_id, $routeParams.homeworkId, (data) ->
    console.log data
]