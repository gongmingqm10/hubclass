angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', (api, $scope, $location) ->

  $scope.create_note = () ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
      tags: $('#tags').val().trim().split(/\s+/, 3) unless $('#tags').val().trim().length is 0
      files: $scope.files
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')

]

