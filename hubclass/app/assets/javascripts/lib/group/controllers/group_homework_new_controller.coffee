angular.module('Hust:group').controller 'GroupHomeworkNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $scope.create_homework = (event) ->
    data =
      title: $('#title').val()
      content: $('#editor').html()
      expiration: $('#expireDate').val()
    return unless data.title
    api.create_homework $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')
      $(event.target).attr("disabled", "disabled")

]