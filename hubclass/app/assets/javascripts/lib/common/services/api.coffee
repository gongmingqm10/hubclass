angular.module('Hust:common').factory 'api', ['$cookieStore', '$http', ($cookieStore, $http) ->
  _current_user = $cookieStore.get('user')

  current_user: ->
    _current_user || ''

  index_groups: (handler) ->
    $http.get("api/users/#{_current_user.id}/groups").success(handler)

  find_group_by_id: (group_id, handler) ->
    $http.get("api/users/#{_current_user.id}/groups/#{group_id}").success(handler)

]