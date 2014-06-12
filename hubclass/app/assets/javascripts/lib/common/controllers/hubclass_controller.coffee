angular.module('Hust:common').controller 'HubclassController', ['$scope', 'api', ($scope, api) ->
  api.show_user_info (response) ->
    $scope.current_user = response

]