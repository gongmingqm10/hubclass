angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $('#editor').wysiwyg()
  $scope.create_note = () ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
      tags: $('#tags').val().split(" ")
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')

]