angular.module('Hust:group').controller 'GroupHomeworkNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $('#editor').wysiwyg()
  $scope.create_homework = () ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
      tags: $('#tags').val().split(" ")
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')

]