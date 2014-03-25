angular.module('Hust:course', ['Hust:common', 'ngRoute'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/all', {templateUrl: 'course/all', controller: 'CourseAllController'})
      .when('/show/:group_id',  {templateUrl: 'group', controller: 'GroupController'})
      .otherwise(redirectTo: '/all')
]