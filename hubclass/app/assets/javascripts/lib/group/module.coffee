angular.module('Hust:group', ['Hust:common', 'ngRoute'])
.config ['$routeProvider', ($routeProvider) ->
    $routeProvider
    .when('/notes', {templateUrl: '/group/note', controller: 'GroupNoteController'})
    .when('/students',  {templateUrl: '/group/student', controller: 'GroupStudentController'})
    .when('/homeworks',  {templateUrl: '/group/homework', controller: 'GroupHomeworkController'})
    .when('/signin',  {templateUrl: '/group/signin', controller: 'GroupSigninController'})
    .otherwise(redirectTo: '/notes')
  ]