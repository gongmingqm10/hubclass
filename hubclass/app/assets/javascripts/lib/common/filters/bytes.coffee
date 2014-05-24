angular.module('Hust:common').filter 'bytes', ->
  (bytes, precision) ->
    return '-' if isNaN(parseFloat(bytes)) ||isNaN(parseFloat(bytes)) || !isFinite(bytes)
    precision = 1 if typeof precision is 'undefined'
    units = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB']
    number = Math.floor(Math.log(bytes) / Math.log(1024))
    (bytes / Math.pow(1024, Math.floor(number))).toFixed(precision) +  ' ' + units[number]
