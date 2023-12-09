Class {
	#name : #DeckCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DeckCreatorTest >> should: errorBlock raise: errorClass withMessage: expectedErrorMessage [

	| errorWasRaised errorMessage |
	errorBlock
		on: errorClass
		do: [ :error | 
			errorWasRaised := true.
			errorMessage := error messageText ]
]

{ #category : #tests }
DeckCreatorTest >> test01AFiniteDeckOfOneCardCanBeCreated [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck testCard |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 100.
	finiteDeck := aDeckCreator createDeckOf: 1 with: aDictionaryWithCardsAndItsProbabilities.
	testCard := SpeedCard new.
	self assert: (finiteDeck dealOne) equals: testCard.
]

{ #category : #tests }
DeckCreatorTest >> test02AFiniteDeckCanDealInitialHands [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck testCard testCard2 testHand |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 50.
	aDictionaryWithCardsAndItsProbabilities at: OverloadCard put: 50.
	finiteDeck := aDeckCreator createDeckOf: 100 with: aDictionaryWithCardsAndItsProbabilities.
	testCard := SpeedCard new.
	testCard2 := OverloadCard new.
	testHand := Hand containing: { 
							testCard .
							testCard2 }.
	self assert: (finiteDeck dealInitialCards) cardsOnHand  equals:2
]
