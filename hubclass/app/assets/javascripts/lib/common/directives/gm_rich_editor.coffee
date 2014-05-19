angular.module('Hust:common').directive 'gmRichEditor', [ ()->
  restrict: 'A'
  replace: 'true'
  link: (scope, element, attrs) ->
    element.wysiwyg()
]