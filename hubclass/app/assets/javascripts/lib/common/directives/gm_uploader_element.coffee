angular.module('Hust:common').directive 'gmUploaderElement', ['$compile', ($compile)->
  restrict: 'A'
  replace: false
  template: '<label for="file">附件</label>'+
            '<span class="text-danger" id="file-validation-message"></span>'+
            '<input type="file" id="file" name="file">'+
            '<div class="progress progress-striped" id="progress">'+
              '<div class="progress-bar progress-bar-info" id="bar" role="progressbar" aria-valuemin="0" aria-valuemax="100">'+
                 '<span id="percent">0%</span>'+
              '</div>'+
            '</div>'+
            '<div id="file-container"></div>'
  link: (scope, element, attrs) ->

    input_file = element.find('#file')
    file_container = element.find('#file-container')
    scope.files = []

    upload_on_success = (data) ->
      file_container.append('<a class="link" target="_blank" href="' + data.url + '"><span class="icon icon-attach"></span> ' + data.filename + '</a>')
      scope.files.push(data.id)

    upload_on_error = (data) ->
      element.find("#file-validation-message").text("文件上传错误，请稍后重试！")

    on_complete = (data) ->
      element.find("#progress").hide()
      input_file.val ''

    before_send = (jqXHR) ->
      element.find("#progress").show()
      element.find("#bar").width('0%')
      element.find("#percent").text("0%")
      element.find("#file-validation-message").text ''

    on_updating_progress = () ->
      my_xhr = $.ajaxSettings.xhr();
      if my_xhr.upload
        my_xhr.upload.addEventListener('progress', ((evt) ->
          percent_complete = Math.floor(evt.loaded * 100 / evt.total)
          element.find("#bar").width(percent_complete + '%')
          element.find("#percent").html(percent_complete + '%')
          if percent_complete == 100
            element.find("#percent").html('File uploaded. Processing now...')
        ), false)
        my_xhr

    input_file.on 'change', ()->
      file_data = input_file.prop('files')[0]
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

]
