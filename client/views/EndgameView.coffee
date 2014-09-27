class window.EndgameView extends Backbone.View

  className: 'Endgame'

  template: _.template '<div id = "<%= results %>"></div>'

  events:
    "click": ->
      $('body').empty()
      new AppView(model: new App()).$el.appendTo 'body'

  initialize: ->
    @render()

  render: ->

    @$el.html @template(@model.attributes)
    @$el.prependTo 'body'


