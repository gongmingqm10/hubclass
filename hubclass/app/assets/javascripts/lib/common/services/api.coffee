angular.module('Hust:common').factory 'api', ['$cookieStore', '$http', ($cookieStore, $http) ->
  _current_user = $cookieStore.get('user')

  current_user: ->
    _current_user || ''

  participate_courses: (handler) ->
    $http.get('api/').success(handler)

  owner_of_courses: (handler) ->
    $http.get('api/').success(handler)

]