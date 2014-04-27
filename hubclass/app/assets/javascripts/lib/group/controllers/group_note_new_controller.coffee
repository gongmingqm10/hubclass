angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $('#editor').wysiwyg()
  $scope.note_new_url = "/api/users/#{api.current_user().id}/groups/#{$scope.group_id}/notes"
  $('#noteNewForm').submit () ->
    $('#content').val $('#editor').html()
  $scope.cancel = () ->
    $location.url('/all')
  $scope.create_note = () ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')

]