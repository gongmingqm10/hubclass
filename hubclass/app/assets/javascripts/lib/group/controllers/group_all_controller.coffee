angular.module('Hust:group').controller 'GroupAllController', ['api', '$scope', '$location', '$routeParams', (api, $scope, $location, $routeParams) ->

  $scope.is_current_tab = (tab) ->
    tab is $scope.current_tab
  $scope.redirect_note_new = () ->
    $location.url('/note/new')
  $scope.redirect_homework_new = () ->
    $location.url('/homework/new')
  $scope.show_note = (note_id) ->
    $location.url('/note/show/'+note_id)
  $scope.remark_homework = (homework_id) ->
    $location.url('/homework/remark/'+homework_id)
  $scope.submit_homework = (homework_id) ->
    $location.url('/homework/submit/'+homework_id)
  api.index_notes $scope.group_id, (data) ->
    $scope.notes = data
  api.index_created_homeworks $scope.group_id, (data) ->
    $scope.created_homeworks = data
  api.index_submit_homeworks $scope.group_id, (data) ->
    $scope.submit_homeworks = data
]