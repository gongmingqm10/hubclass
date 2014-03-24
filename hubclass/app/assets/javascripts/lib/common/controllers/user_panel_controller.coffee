angular.module('Hust:common').controller 'UserPanelController', ['$scope', 'api', ($scope, api) ->
  $scope.display_name = api.current_user().username
]