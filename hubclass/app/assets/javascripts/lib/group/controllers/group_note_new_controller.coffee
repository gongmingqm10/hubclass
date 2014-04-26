angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $('#editor').wysiwyg()
  $scope.note_new_url = "/api/users/#{api.current_user().id}/groups/#{$scope.group_id}/notes"
  $('#noteNewForm').submit () ->
    $('#content').val $('#editor').html()
  $scope.cancel = () ->
    $location.url('/all')
]