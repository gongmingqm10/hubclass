angular.module('Hust:common').factory 'api', ['$cookieStore', '$http', ($cookieStore, $http) ->
  _current_user = $cookieStore.get('user')

  current_user: ->
    _current_user || ''

  show_user_info: (handler) ->
    $http.get("/api/users/#{_current_user.id}").success(handler)

  index_groups: (handler) ->
    $http.get("/api/users/#{_current_user.id}/groups").success(handler)

  find_group_by_id: (group_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}").success(handler)

  create_note: (group_id, data, handler) ->
    $http.post("/api/users/#{_current_user.id}/groups/#{group_id}/notes", data).success(handler)

  show_note: (group_id, id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/notes/#{id}").success(handler)

  index_notes: (group_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/notes").success(handler)

  index_created_homeworks: (group_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/create").success(handler)

  index_submit_homeworks: (group_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/submit").success(handler)

  show_submit_homework: (group_id, homework_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/#{homework_id}/submit").success(handler)

  show_origin_homework: (group_id, homework_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/#{homework_id}").success(handler)

  submit_homework: (group_id, homework_id, data, handler) ->
    $http.post("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/#{homework_id}/submit", data).success(handler)

  remark_homework: (group_id, homework_id, data, handler) ->
    $http.post("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/#{homework_id}/remark", data).success(handler)

  show_remark_homework: (group_id, homework_id, submitter_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks/#{homework_id}/remark/#{submitter_id}").success(handler)

  create_homework: (group_id, data, handler) ->
    $http.post("/api/users/#{_current_user.id}/groups/#{group_id}/homeworks", data).success(handler)

  absent_student: (group_id, student_id, handler) ->
    $http.put("/api/users/#{_current_user.id}/groups/#{group_id}/absent/#{student_id}").success(handler)

  vote_student: (group_id, student_id, handler) ->
    $http.put("/api/users/#{_current_user.id}/groups/#{group_id}/vote/#{student_id}").success(handler)

  uploaded_attachments: (handler) ->
    $http.get("/api/users/#{_current_user.id}/attachments/uploaded").success(handler)

  all_todo_homeworks: (handler) ->
    $http.get("/api/users/#{_current_user.id}/homeworks/todo").success(handler)

  all_created_homeworks: (handler) ->
    $http.get("/api/users/#{_current_user.id}/homeworks/created").success(handler)

  create_session: (group_id, handler) ->
    $http.get("/api/users/#{_current_user.id}/groups/#{group_id}/create_session").success(handler)
]