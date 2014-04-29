angular.module('Hust:group', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/all', {templateUrl: '/group/all', controller: 'GroupAllController'})
    .when('/note/new', {templateUrl: '/note/new', controller: 'GroupNoteNewController'})
    .when('/homework/new', {templateUrl: '/homework/new', controller: 'GroupHomeworkNewController'})
    .otherwise(redirectTo: '/all')
  ]