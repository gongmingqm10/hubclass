angular.module('Hust:group').controller 'GroupNoteShowController', ['api', '$scope', '$routeParams', (api, $scope, $routeParams) ->

  api.show_note $scope.group_id, $routeParams.note_id, (data) ->
    $scope.portfolio = data
]