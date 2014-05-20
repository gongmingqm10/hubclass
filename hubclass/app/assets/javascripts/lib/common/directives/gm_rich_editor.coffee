angular.module('Hust:common').directive 'gmRichEditor', [ ()->
  restrict: 'AE'
  replace: 'true'
  link: (scope, element, attrs) ->
    element.wysiwyg()
]