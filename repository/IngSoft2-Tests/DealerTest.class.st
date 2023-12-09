Class {
	#name : #DealerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DealerTest >> should: errorBlock raise: errorClass withMessage: expectedErrorMessage [

	| errorWasRaised errorMessage |
	errorBlock
		on: errorClass
		do: [ :error | 
			errorWasRaised := true.
			errorMessage := error messageText ]
]

{ #category : #asserting }
DealerTest >> test01ADealerCanBeCreatedWithAtLeastOneTypeOfCard [

	| aCollectionOfTypes cardDealer |
	aCollectionOfTypes := { SpeedCard new. }.
	cardDealer := InfiniteDealer ofTypes: aCollectionOfTypes.
	self assert: (cardDealer dealOne) assertThatIsACard .
]

{ #category : #asserting }
DealerTest >> test02ADealerCannotBeCreatedWithAnEmptyArrayOfTypes [

	| aCollectionOfTypes cardDealer error errorMessage |
	aCollectionOfTypes := { SpeedCard new. }.
	cardDealer := [InfiniteDealer ofTypes: aCollectionOfTypes].
	error := Error.
	errorMessage := 'Cannot create a card dealer with no types of cards '.
	self should: cardDealer raise: error withMessage: errorMessage.
]

{ #category : #asserting }
DealerTest >> test03ADealerCannotBeCreatedWithAnArrayThatContainsAnythingButCards [

	| aCollectionOfTypes cardDealer error errorMessage |
	aCollectionOfTypes := { SpeedCard new. Die new. }.
	cardDealer := [InfiniteDealer ofTypes: aCollectionOfTypes].
	error := Error.
	errorMessage := 'Array contains an object that is not a Card '.
	self should: cardDealer raise: error withMessage: errorMessage.
]

{ #category : #asserting }
DealerTest >> test04ADealerReturnsARandomCardIfIntializedWithSeveralTypes [

	| aCollectionOfTypes cardDealer |
	aCollectionOfTypes := { SpeedCard new. OverloadCard  new. }.
	cardDealer := [InfiniteDealer ofTypes: aCollectionOfTypes].
	cardDealer := InfiniteDealer ofTypes: aCollectionOfTypes.
	self assert: (cardDealer dealOne) assertThatIsACard .
]

{ #category : #asserting }
DealerTest >> test05ADealerReturnsTwoCardsIfAskedToDealInitialHand [

	| aCollectionOfTypes cardDealer |
	aCollectionOfTypes := { SpeedCard new. OverloadCard  new. }.
	cardDealer := [InfiniteDealer ofTypes: aCollectionOfTypes].
	cardDealer := InfiniteDealer ofTypes: aCollectionOfTypes.
	self assert: (cardDealer dealInitialCards ) cardsOnHand equals: 2.
]
