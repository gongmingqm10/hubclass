angular.module('Hust:group').controller 'GroupNoteNewController', ['api', '$scope', '$location', (api, $scope, $location) ->
  $('#editor').wysiwyg()

  $scope.create_note = () ->
    data =
      title: $('#noteTitle').val()
      content: $('#editor').html()
      tags: $('#tags').val().split(" ")
    api.create_note $scope.group_id, data, (response, status) ->
      $('#message').removeClass('hide')

  $('#file').on 'change', ()->
    console.log('change event is triggered')
    upload_attachment()

]

on_updating_progress = () ->
  my_xhr = $.ajaxSettings.xhr();
  if my_xhr.upload
    my_xhr.upload.addEventListener('progress', ((evt) ->
      percent_complete = Math.floor(evt.loaded * 100 / evt.total)
      $("#bar").width(percent_complete + '%')
      $("#percent").html(percent_complete + '%')
      if percent_complete == 100
        $("#percent").html('File uploaded. Processing now...')
    ), false)
    my_xhr

upload_on_error = (data) ->
  $("#file-validation-message").text("文件上传错误，请稍后重试！")
  $("#file").val ''

upload_on_success = (data) ->
  console.log "success:" + data

on_complete = (data) ->
  $("#progress").hide()

before_send = (jqXHR) ->
  $("#progress").show()
  $("#bar").width('0%')
  $("#percent").text("0%")
  $("#file-validation-message").text ''


upload_attachment = ->
  file_data = $('#file').prop('files')[0]
  form_data = new FormData();
  form_data.append("file", file_data)
  $.ajax
    url: "/api/file-upload",
    dataType: 'json',
    cache: false,
    contentType: false,
    processData: false,
    data: form_data,
    type: 'post',
    success: upload_on_success,
    error: upload_on_error,
    complete: on_complete,
    xhr: on_updating_progress,
    beforeSend: before_send
  return