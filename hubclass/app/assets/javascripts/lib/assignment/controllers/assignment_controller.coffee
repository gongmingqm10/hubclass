angular.module('Hust:assignment').controller 'AssignmentController', ['api', '$scope', '$location', (api, $scope, $location) ->
  api.all_todo_homeworks (data) ->
    $scope.submit_homeworks = data
  api.all_created_homeworks (data) ->
    $scope.created_homeworks = data

  $scope.remark_homework = (homework_id, user_id) ->
      $location.url("/homework/#{homework_id}/remark/#{user_id}")
  $scope.submit_homework = (homework_id) ->
    $location.url("/homework/#{homework_id}/submit")
  $scope.show_origin_homework = (homework_id, event) ->
    event.stopPropagation
    $location.url('/homework/' + homework_id )

]