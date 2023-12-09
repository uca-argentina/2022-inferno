"
I represent a deck creator, an object that creates a finite deck, given cards and its probabilities.
"
Class {
	#name : #FiniteDealer,
	#superclass : #Object,
	#instVars : [
		'deck',
		'discardDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #adding }
FiniteDealer >> addToDiscardDeck: aCard [
	discardDeck addLast: aCard.
]

{ #category : #getters }
FiniteDealer >> amountOfCardsInDeck [
	^ deck size.
]

{ #category : #getters }
FiniteDealer >> amountOfDiscarded [
	^ discardDeck size.
]

{ #category : #asserting }
FiniteDealer >> assertAmountOfCardsIsMoreThanZero: anAmountOfCards [ 
	anAmountOfCards > 0 ifFalse: [ 
		Error signal: 'Cannot create a deck with size zero or lower.' ]
]

{ #category : #asserting }
FiniteDealer >> assertCardProbabilityIsPositive: aCardProbability [ 
	aCardProbability > 0 ifFalse: [ 
		Error signal: 'Effect probability cannot be zero or lower.' ]
]

{ #category : #asserting }
FiniteDealer >> assertDeckIsNotEmpty [
	(deck isEmptyOrNil)ifTrue: [ 
		(discardDeck isEmptyOrNil)ifTrue:[
			Error signal: 'Cannot pull a card as both the deck and discard deck is empty']
		ifFalse: [ 
			deck := discardDeck shuffled.
			discardDeck := OrderedCollection new.			 
						].
		].
]

{ #category : #asserting }
FiniteDealer >> assertSumOfProbabilitiesIsOneHundred: aSumOfProbabilities [ 
		aSumOfProbabilities = 100 ifFalse: [ 
		Error signal: 'Sum of probabilities exceeds 100 percent.' ]
]

{ #category : #asserting }
FiniteDealer >> assertValidTypes: aCollectionOfTypes [ 
	aCollectionOfTypes isNotEmpty ifFalse:[ 
					Error signal:
			'Cannot create a card dealer with no types of cards ' ].
		(aCollectionOfTypes isKindOf: Array)
		ifTrue:[
			aCollectionOfTypes do: [:eachCard | 
			(eachCard assertThatIsACard) ifFalse: [
				Error signal: 'Array contains an object that is not a Card'
			]].
		]
		ifFalse:[  Error signal: 'Invalid type of entry. Should be a Dictionary or an Array of cards' ].
]

{ #category : #creation }
FiniteDealer >> createDeckOf: anAmountOfCards using: aDictionaryWithCardsAndItsProbabilities [ 

	self assertValidTypes: (aDictionaryWithCardsAndItsProbabilities keys).
	deck := OrderedCollection new: anAmountOfCards.
	discardDeck := OrderedCollection new.
	   
    aDictionaryWithCardsAndItsProbabilities associationsDo: [:association |
        | card probability numberOfCards newCard |
        card := association key.
        probability := association value.

        numberOfCards := (probability * anAmountOfCards) / 100 rounded.

        numberOfCards timesRepeat: [
            newCard := card new.
            deck addLast: newCard.
        ].
		deck shuffle.
    ].
	^ self
]

{ #category : #creation }
FiniteDealer >> createDeckOf: anAmountOfCards with: aDictionaryWithCardsAndItsProbabilities [ 
	| sumOfProbabilities |
	sumOfProbabilities := 0.
	self assertAmountOfCardsIsMoreThanZero: anAmountOfCards.
	aDictionaryWithCardsAndItsProbabilities valuesDo: [ :eachProbability | 
		self assertCardProbabilityIsPositive: eachProbability.
		sumOfProbabilities := sumOfProbabilities + eachProbability ].
	self assertSumOfProbabilitiesIsOneHundred: sumOfProbabilities.
	^ self
		  createDeckOf: anAmountOfCards
		  using: aDictionaryWithCardsAndItsProbabilities.
]

{ #category : #dealing }
FiniteDealer >> dealInitialCards [
	| randomcard1 randomcard2 |
	randomcard1 := self dealOne.
	randomcard2 := self dealOne.
	^ Hand containing: { 
			  randomcard1.
			  randomcard2 }
]

{ #category : #dealing }
FiniteDealer >> dealOne [
	self assertDeckIsNotEmpty.
	^ deck removeLast.
]
