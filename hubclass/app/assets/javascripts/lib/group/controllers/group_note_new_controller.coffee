angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', '$compile', (api, $scope, $location, $compile) ->

  $scope.type = "note"
  $scope.create_note = (event) ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
      tags: $('#tags').val().trim().split(/\s+/, 3) unless $('#tags').val().trim().length is 0
      files: $scope.files
      type: $scope.type
    return unless data.title
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')
      $(event.target).attr("disabled", "disabled")

  $scope.change_type = (type, event) ->
    return if $scope.type is type
    $('#noteType').eq(0).html($(event.target).text()+" <span class='caret'></span>")
    $scope.type = type

]

