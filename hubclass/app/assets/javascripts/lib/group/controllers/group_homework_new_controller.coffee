angular.module('Hust:group').controller 'GroupHomeworkNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $scope.create_homework = () ->
    data =
      title: $('#title').val()
      content: $('#editor').html()
      expiration: $('#expireDate').val()
    api.create_homework $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')
      console.log response

]