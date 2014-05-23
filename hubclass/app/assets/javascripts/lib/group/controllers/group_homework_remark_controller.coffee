angular.module('Hust:group').controller 'GroupHomeworkRemarkController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->
  api.show_remark_homework($scope.group_id, $routeParams.homework_id, $routeParams.submitter_id, (data) ->
    $scope.portfolio = data
  )
  $scope.remark_homework = () ->
    send_data =
      mark: $('#mark').val()
      detail: $('#detail').val()
    api.remark_homework $scope.group_id, $scope.portfolio.answer.id, send_data, (response) ->
      $('#message').removeClass('hide')
]