angular.module('Hust:group', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/all', {templateUrl: '/group/all', controller: 'GroupAllController'})
    .when('/note/new', {templateUrl: '/note/new', controller: 'GroupNoteNewController'})
    .when('/note/show/:note_id', {templateUrl: '/note/show/:note_id', controller: 'GroupNoteShowController'})
    .when('/homework/new', {templateUrl: '/homework/new', controller: 'GroupHomeworkNewController'})
    .when('/homework/remark/:homework_id', {templateUrl: '/homework/remark/:homework_id', controller: 'GroupHomeworkRemarkController'})
    .when('/homework/submit/:homework_id', {templateUrl: '/homework/submit/:homework_id', controller: 'GroupHomeworkSubmitController'})
    .otherwise(redirectTo: '/all')
  ]