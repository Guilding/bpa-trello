expect = require('chai').expect
_un = require("underscore")
app = require('../app')
helpers = require('./test-helpers.js')
q = require('q')

CR = new app.CardRecorder(helpers.ordermockfile, helpers.board)

describe 'CardRecorder', ->
  describe.skip '.createOrders', ->
    it 'will take a yaml file of orders and create cards for every order', ->
      CR.createOrders(mockfile)
      expect(trelloCards).to.include.members(helpers.testCards)
      return
    return

  describe.skip '.createCard', ->
    it 'will create an individual card on trello', ->
      CR.createCard(helpers.mockOrder)
      expect(trelloCards).to.include.members(helpers.testCard)
      return
    return

  describe '.descriptionMaker', ->
    it 'will create a description for a new card given bpa order details object', ->
      description = CR.descriptionMaker(helpers.mockOrder)
      expect(description).to.equal("Project: FedRamp Dashboard\nAgency: General Services Administration\nSubAgency: OCSIT\nTrello Board: https://trello.com/b/nmYlvlhu/bpa-test-dashboard")
      return
    return

  describe.skip '.addComment', ->
    it 'adds a comment to a board', ->
      CR.addComment("test message", helpers.testCardID)
      CR.t.get "/1/cards/"+helpers.testCardID+"/actions", {filter: commentCard}, (err, data) ->
        if err
          throw err
        _un.find
        expect(trelloTestCard.comment).to.include("test message\n")
        return
      return
    return

  describe '.calculateDateDifference', ->
    it 'calculates the difference between when the card was moved and the expected time', ->
      difference = CR.calculateDateDifference(10, "2016-04-05", "2016-07-27")
      expect(difference).to.eql [71,81]
      return
    return

  describe.skip '.findLastMoves', ->
    it 'finds when the last time a card was moved and returns a date', ->
      CR.findLastMove(helpers.testCardID).then (lastMove) ->
        expect(lastMove).to.equal ['2016-02-16', '2016-02-16']
        return
      return
    return

  describe.skip '.buildCurrentComment', ->
    it 'adds a comment for the current phase of the project', ->
      return
    return

  describe '.buildComment', ->
    it 'generates a comment \i87\]ased off of date entry fields', ->
      msg = CR.buildComment(103, 10, "2016-04-05T10:40:26.100Z", "2016-07-27T10:40:26.100Z", "Workshop", 113)
      expect(msg).to.eql("**Workshop Stage:** `+103 days`. *04/05/2016 - 07/27/2016*.\n Expected days: 10 days. Actual Days spent: 113.")
      return
    return
