angular.module('Hust:group', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/all', {templateUrl: '/group/all', controller: 'GroupAllController'})
    .when('/note/new', {templateUrl: '/note/new', controller: 'GroupNoteNewController'})
    .when('/note/show/:note_id', {templateUrl: '/note/show/:note_id', controller: 'GroupNoteShowController'})
    .when('/homework/new', {templateUrl: '/homework/new', controller: 'GroupHomeworkNewController'})
    .when('/homework/:id', {templateUrl: '/homework/:id', controller: 'HomeworkOriginController'})
    .when('/homework/:homework_id/remark/:submitter_id', {templateUrl: '/homework/:homework_id/remark/:submitter_id', controller: 'HomeworkRemarkController'})
    .when('/homework/:homework_id/submit', {templateUrl: '/homework/:homework_id/submit', controller: 'HomeworkSubmitController'})
    .otherwise(redirectTo: '/all')
  ]