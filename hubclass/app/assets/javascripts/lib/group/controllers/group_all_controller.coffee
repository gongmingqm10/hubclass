angular.module('Hust:group').controller 'GroupAllController', ['api', '$scope', '$location', '$window', (api, $scope, $location, $window) ->

  $scope.is_current_tab = (tab) ->
    tab is $scope.current_tab
  $scope.redirect_note_new = () ->
    $location.url('/note/new')
  $scope.redirect_homework_new = () ->
    $location.url('/homework/new')
  $scope.show_note = (note_id) ->
    $location.url('/note/show/'+note_id)
  $scope.remark_homework = (group_id, homework_id, user_id) ->
    $location.url("/homework/#{homework_id}/remark/#{user_id}")
  $scope.submit_homework = (group_id, homework_id) ->
    $location.url("/homework/#{homework_id}/submit")
  $scope.show_origin_homework = (group_id, homework_id, event) ->
    event.stopPropagation
    $location.url('/homework/' + homework_id )
  $scope.vote_student = (student_id, event) ->
    api.vote_student $scope.group_id, student_id, (response) ->
      $(event.target).parent().siblings(".vote").text(response.vote)
  $scope.absent_student = (student_id, event) ->
    api.absent_student $scope.group_id, student_id, (response) ->
      $(event.target).parent().siblings(".absence").text(response.absence)
  api.index_notes $scope.group_id, (data) ->
    $scope.notes = data
  api.index_created_homeworks $scope.group_id, (data) ->
    $scope.created_homeworks = data
  api.index_submit_homeworks $scope.group_id, (data) ->
    $scope.submit_homeworks = data
  $scope.start_session = () ->
    api.create_session $scope.group_id, (data) ->
      $window.location.href = "/course/#{$scope.group_id}/session/#{data.session_id}"
  $scope.delete_note = (note_id) ->
    api.delete_note $scope.group_id, note_id, (data)->
      remove_note_by_id(note_id)

  remove_note_by_id = (id) ->
    _.each $scope.notes, (note, index) ->
      if id is note.id
        $scope.notes.splice(index, 1)
        return
]