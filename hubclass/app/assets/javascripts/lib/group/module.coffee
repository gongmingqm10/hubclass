angular.module('Hust:group', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/all', {templateUrl: '/group/all', controller: 'GroupAllController'})
    .when('/note/new', {templateUrl: '/note/new', controller: 'GroupNoteNewController'})
    .otherwise(redirectTo: '/all')
  ]