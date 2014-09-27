class window.EndgameView extends Backbone.View

  className: 'Endgame'

  template: _.template '<div>results</div>'

  events:
    "click": ->
      $('body').empty()
      new AppView(model: new App()).$el.appendTo 'body'

  initialize: ->
    @render()

  render: ->

    @$el.html @template()
    @$el.prependTo 'body'

      #append to body

  # #todo: switch to mustache
  # template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  # initialize: ->
  #   @collection.on 'add remove change', => @render()
  #   @render()
  #   @collection.on 'bust', => console.log 'busted view'

  # render: ->
  #   @$el.children().detach()
  #   @$el.html @template @collection
  #   @$el.append @collection.map (card) ->
  #     new CardView(model: card).$el
  #   @$('.score').text @collection.scores()[0]
