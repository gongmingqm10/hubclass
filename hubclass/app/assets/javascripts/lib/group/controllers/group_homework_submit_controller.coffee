angular.module('Hust:group').controller 'GroupHomeworkSubmitController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->

  api.show_submit_homework $scope.group_id, $routeParams.homework_id, (data) ->
    $scope.portfolio = data

  $scope.submit_homework = () ->
    send_data =
      content: $('#editor').html()
      files: $scope.files if $scope.files
    api.submit_homework $scope.group_id, $routeParams.homework_id, send_data, (response) ->
      $('#message').removeClass('hide')
      console.log response
]