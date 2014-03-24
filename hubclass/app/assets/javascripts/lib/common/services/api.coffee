angular.module('Hust:common').factory 'api', ['$cookies', '$http', ($cookies, $http) ->
  _current_user = jQuery.parseJSON($cookies.user) if $cookies.user

  current_user: ->
    _current_user || ''


]