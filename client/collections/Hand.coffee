class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @scores()[0] <22 # or not stand
      @add(@deck.pop()).last()
    if @scores()[0] > 21
      @trigger('busted',@)
      alert 'BUSTED! New game?'
    if @isDealer & @scores()[0] < 17
      @hit()

  #dealerHit: ->

  stand: ->
    console.log 'stand'
    # stop player hit
    # trigger dealer hit
    @trigger 'stood', @


  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]


