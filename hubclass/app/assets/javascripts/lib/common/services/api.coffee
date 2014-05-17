angular.module('Hust:common').factory 'api', ['$cookieStore', '$http', ($cookieStore, $http) ->
  _current_user = $cookieStore.get('user')

  current_user: ->
    _current_user || ''

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
]