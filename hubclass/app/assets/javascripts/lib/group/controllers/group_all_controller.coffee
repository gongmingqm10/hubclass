angular.module('Hust:group').controller 'GroupAllController', ['api', '$scope', '$location', '$routeParams', (api, $scope, $location, $routeParams) ->
  $scope.current_tab = 'note'
  $scope.redirect_note_new = () ->
    $location.url('/note/new')
]