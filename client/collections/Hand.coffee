class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @scores()[0] < 22 # or not stand
      @add(@deck.pop()).last()
    if @scores()[0] > 21
      @trigger('busted', @)
    else
      if @isDealer & @scores()[0] < 17
        @hit()
      else
        if @isDealer
          @trigger('stood', @)

  stand: ->
    @trigger 'stood', @

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]


