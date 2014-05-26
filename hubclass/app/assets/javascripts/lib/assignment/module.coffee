angular.module('Hust:assignment', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/all', {templateUrl: '/assignment/all', controller: 'AssignmentAllController'})
    .when('/homework/:id', {templateUrl: '/homework/:id', controller: 'HomeworkOriginController'})
    .when('/homework/:homework_id/remark/:submitter_id', {templateUrl: '/homework/:homework_id/remark/:submitter_id', controller: 'HomeworkRemarkController'})
    .when('/homework/:homework_id/submit', {templateUrl: '/homework/:homework_id/submit', controller: 'HomeworkSubmitController'})
    .otherwise(redirectTo: '/all')
  ]