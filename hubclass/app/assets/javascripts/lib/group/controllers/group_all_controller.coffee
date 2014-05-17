angular.module('Hust:group').controller 'GroupAllController', ['api', '$scope', '$location', '$routeParams', (api, $scope, $location, $routeParams) ->
  $scope.current_tab = 'note'
  $scope.is_current_tab = (tab) ->
    tab is $scope.current_tab
  $scope.redirect_note_new = () ->
    $location.url('/note/new')
  $scope.redirect_homework_new = () ->
    $location.url('/homework/new')
  $scope.show_note = (note_id) ->
    $location.url('/note/show/'+note_id)
  api.index_notes $scope.group_id, (data) ->
    $scope.notes = data
]