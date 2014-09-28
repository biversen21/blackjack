class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @scores() > 21
      @trigger('busted', @)
    if @isDealer & @scores() < 17
      @hit()
    else
      if @isDealer
        @stand()

  stand: ->
    @trigger 'stood', @

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1 and card.get('revealed')
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce
      aceScore = score + 10
    if aceScore < 22 then aceScore else score

  checkBJ: ->
    if @.models[0].get('value') is 1 && @.models[1].get('value') is 10
      true
    if @.models[0].get('value') is 10 && @.models[1].get('value') is 1
      true

