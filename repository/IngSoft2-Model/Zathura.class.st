"
i represent a Zathura: Inferno game.
"
Class {
	#name : #Zathura,
	#superclass : #Object,
	#instVars : [
		'board',
		'dice',
		'gameIsFinished',
		'turnController',
		'spaceshipHands',
		'cardsBeingApplied',
		'lastCardPlayed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Zathura class >> assertAmountOfSpaceshipOn: aBoard matchesAmountOf: handsOfCards [

	handsOfCards size = aBoard spaceshipPositions size ifFalse: [ 
		Error signal:
			'Can not play with amount of hands different than amount of spaceships' ]
]

{ #category : #'class initialization' }
Zathura class >> playWith: aDiceCup over: aBoard dealing: aCollectionOfHands [

	self
		assertAmountOfSpaceshipOn: aBoard
		matchesAmountOf: aCollectionOfHands.
	self selfAssertEachPlayerHasTwoCardsAtTheBegining: aCollectionOfHands.
	^ self new
		  initializeWith: aDiceCup
		  over: aBoard
		  dealing: aCollectionOfHands
]

{ #category : #'class initialization' }
Zathura class >> selfAssertEachPlayerHasTwoCardsAtTheBegining: aCollectionOfHands [

	aCollectionOfHands do: [ :hand | 
		hand cardsOnHand = 2 ifFalse: [ 
			Error signal: 'All players should start with 2 cards' ] ]
]

{ #category : #assertions }
Zathura >> assert: aCard isBeingAppliedTo: aSpaceship [

	((cardsBeingApplied to: aSpaceship) includes: aCard) ifFalse: [ 
		Error signal:
			'there is no card of that type being applied to that spaceship' ]
]

{ #category : #assertions }
Zathura >> assertGameIsFinished [

	gameIsFinished ifTrue: [ 
		Error signal: 'Game is finished! You cannot keep playing this game.' ]
]

{ #category : #assertions }
Zathura >> assertItIsThatSpaceshipsTurn: aSpaceship [

	aSpaceship == turnController activeSpaceship ifFalse: [ 
		Error signal: 'Cannot play turn if it is not that spaceship turn.' ]
]

{ #category : #assertions }
Zathura >> assertSpaceshipCanPlayCard: aSpaceship [

	aSpaceship = turnController activeSpaceship ifFalse: [ 
		Error signal: 'Cannot play this card when it is not your turn' ]
]

{ #category : #cardApplying }
Zathura >> cancelCard: aCard from: aSpaceship playedBy: anotherSpaceship with: aCancelCard [

	| test1 test2 |
	self assert: aCard isBeingAppliedTo: aSpaceship.
	(spaceshipHands at: anotherSpaceship) play: aCancelCard.
	test1 := cardsBeingApplied to: aSpaceship.
	(cardsBeingApplied to: aSpaceship) remove: aCard.
	test2 := cardsBeingApplied to: aSpaceship.
	lastCardPlayed := aCancelCard
]

{ #category : #cardApplying }
Zathura >> cardApplicator [

	| cardsAffectingRoll cardsAffectingAllRolls addToRoll |
	cardsAffectingRoll := cardsBeingApplied to:
	                      turnController activeSpaceship.
	cardsAffectingAllRolls := cardsBeingApplied to: 'General'.
	cardsAffectingRoll addAllLast: cardsAffectingAllRolls.
	addToRoll := 0.
	cardsAffectingRoll do: [ :card | 
		addToRoll := addToRoll + card effectOnPlay ].
	^ addToRoll
]

{ #category : #getters }
Zathura >> cardsBeingAppliedOn: aSpaceship [

	^ cardsBeingApplied to: aSpaceship.
]

{ #category : #cardApplying }
Zathura >> currentSpaceshipPlaysCard: aPermanentCard applyTo: aSpaceship playedBy: anotherSpaceship [

	| cardToApply |
	self assertSpaceshipCanPlayCard: anotherSpaceship.
	cardToApply := (spaceshipHands at: anotherSpaceship) play:
		               aPermanentCard.
	(cardsBeingApplied to: aSpaceship) addLast: aPermanentCard.
	lastCardPlayed := cardToApply
]

{ #category : #cardApplying }
Zathura >> currentSpaceshipPlaysCard: anAcceleratorCard playedBy: aSpaceship [

	| cardToApply |
	self assertSpaceshipCanPlayCard: aSpaceship.
	cardToApply := (spaceshipHands at: aSpaceship) play:
		               anAcceleratorCard.
	(cardsBeingApplied to: 'General') addLast: anAcceleratorCard.
	lastCardPlayed := cardToApply
]

{ #category : #getters }
Zathura >> handOf: aSpaceship [

	^ spaceshipHands at: aSpaceship
]

{ #category : #getters }
Zathura >> hasGameFinished [

	^ gameIsFinished
]

{ #category : #assertions }
Zathura >> hasItReachedTheFinishLine: currentSpaceship [

	(board positionOf: currentSpaceship) spotNumber
	>= board lengthInSpots
	&
	((board positionOf: currentSpaceship) lapNumber >= board amountOfLaps) 
		ifTrue: [ gameIsFinished := true ]
]

{ #category : #initialization }
Zathura >> initializeWith: aDiceCup over: aBoard dealing: handsOfCards [

	| spaceshipKeys |
	board := aBoard.
	dice := aDiceCup.
	gameIsFinished := false.
	turnController := TurnController with: aBoard spaceshipPositions.
	lastCardPlayed := CancellationCard new.
	spaceshipHands := Dictionary new: aBoard spaceshipPositions size.
	spaceshipKeys := aBoard spaceshipPositions keys.
	1 to: aBoard spaceshipPositions size do: [ :spaceship | 
		spaceshipHands
			at: (spaceshipKeys at: spaceship)
			put: (handsOfCards at: spaceship) ].

	cardsBeingApplied := CardsHandler new.
	cardsBeingApplied manage: spaceshipKeys
]

{ #category : #accessing }
Zathura >> lastCardPlayed [
	^ lastCardPlayed
]

{ #category : #playing }
Zathura >> play: aCard by: aSpaceship affecting: affected [

	| action |
	action := aCard createOwnAction.
	action
		on: self
		by: aSpaceship
		to: affected
		with: aCard
]

{ #category : #playing }
Zathura >> playNextTurn [

	| currentSpaceship |
	self assertGameIsFinished.
	currentSpaceship := turnController activeSpaceship.
	self playTurn: currentSpaceship
]

{ #category : #playing }
Zathura >> playTurn: aSpaceship [

	| positionBeforeRoll rollNumber cardsEffectsOnRoll pickedCard |
	self assertItIsThatSpaceshipsTurn: aSpaceship.
	positionBeforeRoll := board positionOf: aSpaceship.
	rollNumber := dice roll.
	cardsEffectsOnRoll := self cardApplicator.
	pickedCard := board
		              move: aSpaceship
		              from: positionBeforeRoll
		              to: rollNumber + cardsEffectsOnRoll.
	(spaceshipHands at: aSpaceship) addPickedCardToHand: pickedCard.
	self hasItReachedTheFinishLine: aSpaceship.
	turnController nextSpaceshipInLine
]

{ #category : #getters }
Zathura >> positionOf: aSpaceship [

	^ board positionOf: aSpaceship
]

{ #category : #getters }
Zathura >> rankingOfSpaceships [

	^ board rankingOfSpaceships
]

{ #category : #cardApplying }
Zathura >> redoCancelationCard: aCard from: aSpaceship PlayedBy: anotherSpaceship with: aRedoCard [

	| aCancelCard |
	(spaceshipHands at: anotherSpaceship) play: aRedoCard.
	(spaceshipHands at: anotherSpaceship) addPickedCardToHand:
		lastCardPlayed.
	aCancelCard := lastCardPlayed.
	self
		cancelCard: aCard
		from: aSpaceship
		playedBy: anotherSpaceship
		with: aCancelCard
]

{ #category : #cardApplying }
Zathura >> redoLastCardPlayedBy: aSpaceship applyTo: anotherSpaceship with: aRedoCard [


	(spaceshipHands at: anotherSpaceship) play: aRedoCard.
	self assertSpaceshipCanPlayCard: aSpaceship.
	(spaceshipHands at: anotherSpaceship) addPickedCardToHand: lastCardPlayed.
	self
		currentSpaceshipPlaysCard: lastCardPlayed
		applyTo: anotherSpaceship
		playedBy: aSpaceship
]

{ #category : #cardApplying }
Zathura >> redoLastCardPlayedBy: aSpaceship with: aRedoCard [

	(spaceshipHands at: aSpaceship) play: aRedoCard.
	self assertSpaceshipCanPlayCard: aSpaceship.
	(spaceshipHands at: aSpaceship) addPickedCardToHand: lastCardPlayed.
	self currentSpaceshipPlaysCard: lastCardPlayed playedBy: aSpaceship
]

{ #category : #cardApplying }
Zathura >> redoRepeatCardPlayedBy: aSpaceship applyTo: anotherSpaceship with: aRedoCard [

	(spaceshipHands at: aSpaceship) play: aRedoCard.
	(spaceshipHands at: aSpaceship) addPickedCardToHand: lastCardPlayed.
	self
		repeatEffectCardPlayedBy: aSpaceship
		applyTo: anotherSpaceship
		with: lastCardPlayed
]

{ #category : #cardApplying }
Zathura >> repeatEffectCardPlayedBy: aSpaceship applyTo: anotherSpaceship with: aRepeatCard [

	| cardPicked |
	(spaceshipHands at: anotherSpaceship) play: aRepeatCard.
	cardPicked := board applyLastEffectTo: anotherSpaceship.
	(spaceshipHands at: anotherSpaceship) addPickedCardToHand: cardPicked.
	lastCardPlayed := aRepeatCard
]

{ #category : #getters }
Zathura >> showCardsOnHandFor: aSpaceship [

	^ (spaceshipHands at: aSpaceship) deck
]
