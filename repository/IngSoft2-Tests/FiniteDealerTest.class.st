Class {
	#name : #FiniteDealerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
FiniteDealerTest >> should: errorBlock raise: errorClass withMessage: expectedErrorMessage [

	| errorWasRaised errorMessage |
	errorBlock
		on: errorClass
		do: [ :error | 
			errorWasRaised := true.
			errorMessage := error messageText ]
]

{ #category : #tests }
FiniteDealerTest >> test01AFiniteDeckOfOneCardCanBeCreated [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck testCard |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 100.
	finiteDeck := aDeckCreator createDeckOf: 1 with: aDictionaryWithCardsAndItsProbabilities.
	testCard := SpeedCard new.
	self assert: (finiteDeck dealOne) equals: testCard.
]

{ #category : #tests }
FiniteDealerTest >> test02AFiniteDeckCanDealInitialHands [

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

{ #category : #tests }
FiniteDealerTest >> test03AFiniteDeckCannotDealACardIfItIsEmpty [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck    errorBlock errorMessage error |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 50.
	aDictionaryWithCardsAndItsProbabilities at: OverloadCard put: 50.
	finiteDeck := aDeckCreator createDeckOf: 1 with: aDictionaryWithCardsAndItsProbabilities.
	errorBlock := [finiteDeck dealInitialCards].
	errorMessage := 'Cannot pull a card as the deck is empty'.
	error := Error.
	self should:  errorBlock raise: error  withMessage: errorMessage .
]

{ #category : #tests }
FiniteDealerTest >> test04AFiniteDeckCannotBeCreatedWithAmountZeroOrLower [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck    errorBlock errorMessage error |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 50.
	aDictionaryWithCardsAndItsProbabilities at: OverloadCard put: 50.

	errorBlock := 	[finiteDeck := aDeckCreator createDeckOf: 0 with: aDictionaryWithCardsAndItsProbabilities.].
	errorMessage := 'Cannot pull a card as the deck is empty'.
	error := Error.
	self should:  errorBlock raise: error  withMessage: errorMessage .
]

{ #category : #tests }
FiniteDealerTest >> test05AFiniteDeckCannotBeCreatedWIfProbabilitiesDoNotAddTo100 [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck    errorBlock errorMessage error |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 49.
	aDictionaryWithCardsAndItsProbabilities at: OverloadCard put: 50.

	errorBlock := 	[finiteDeck := aDeckCreator createDeckOf: 0 with: aDictionaryWithCardsAndItsProbabilities.].
	errorMessage := 'Probabilities do not add to 100 percent'.
	error := Error.
	self should:  errorBlock raise: error  withMessage: errorMessage .
]

{ #category : #tests }
FiniteDealerTest >> test06AFiniteDeckCannotBeCreatedWIfProbabilitiesAreNegative [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck    errorBlock errorMessage error |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 100.
	aDictionaryWithCardsAndItsProbabilities at: OverloadCard put: -1.

	errorBlock := 	[finiteDeck := aDeckCreator createDeckOf: 0 with: aDictionaryWithCardsAndItsProbabilities.].
	errorMessage := 'Probabilities must be positive'.
	error := Error.
	self should:  errorBlock raise: error  withMessage: errorMessage .
]

{ #category : #tests }
FiniteDealerTest >> test07AFiniteDeckDecreasesInAmountOfCardsIfDealingThem [

	| aDeckCreator aDictionaryWithCardsAndItsProbabilities finiteDeck aHand |
	aDeckCreator := FiniteDealer new.
	aDictionaryWithCardsAndItsProbabilities := Dictionary new.
	aDictionaryWithCardsAndItsProbabilities at: SpeedCard put: 100.

	finiteDeck := aDeckCreator createDeckOf: 10 with: aDictionaryWithCardsAndItsProbabilities.
	aHand := finiteDeck dealInitialCards .
	self assert: (finiteDeck amountOfCardsInDeck ) equals: 8.

]
