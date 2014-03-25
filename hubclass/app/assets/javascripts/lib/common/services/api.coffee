angular.module('Hust:common').factory 'api', ['$cookieStore', '$http', ($cookieStore, $http) ->
  _current_user = $cookieStore.get('user')

  current_user: ->
    _current_user || ''

  owner_of_courses: (handler) ->
    $http.get('api/').success(handler)

  index_groups: (handler) ->
    $http.get("api/users/#{_current_user.id}/groups").success(handler)

]