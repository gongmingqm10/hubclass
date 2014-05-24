angular.module('Hust:attachment').controller 'AttachmentController', ['api', '$scope', '$location', (api, $scope, $location) ->
  api.uploaded_attachments (data) ->
    $scope.attachments = data
]