angular.module('Hust:assignment').controller 'AssignmentController', ['api', '$scope', '$location', (api, $scope, $location) ->

  $scope.remark_homework = (group_id, homework_id, user_id) ->
    $scope.group_id = group_id
    $location.url("/homework/#{homework_id}/remark/#{user_id}")
  $scope.submit_homework = (group_id, homework_id) ->
    $scope.group_id = group_id
    $location.url("/homework/#{homework_id}/submit")
  $scope.show_origin_homework = (group_id, homework_id, event) ->
    event.stopPropagation
    $scope.group_id = group_id
    $location.url('/homework/' + homework_id )
  $scope.redirect_tab = (tab) ->
    $location.url('/')
]