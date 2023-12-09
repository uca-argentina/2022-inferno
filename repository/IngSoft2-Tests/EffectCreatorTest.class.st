Class {
	#name : #EffectCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
EffectCreatorTest >> should: errorBlock raise: errorClass withMessage: expectedErrorMessage [

	| errorWasRaised errorMessage |
	errorBlock
		on: errorClass
		do: [ :error | 
			errorWasRaised := true.
			errorMessage := error messageText ]
]

{ #category : #tests }
EffectCreatorTest >> test01EffectCreatorCreatesACollectionOfSpotsOfGivenSize [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 100.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: SpeedUp put: 20.
	aDictionaryWithEffectProbabilities at: Wormhole put: 20.
	aDictionaryWithEffectProbabilities at: AtomicBomb put: 2.
	aDictionaryWithEffectProbabilities at: Moonwalk put: 10.
	aDictionaryWithEffectProbabilities at: Hyperjump  put: 8.
	aDictionaryWithEffectProbabilities at: CardPicker put: 10.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	self assert: boardLayout size equals: amountOfSpots
]

{ #category : #tests }
EffectCreatorTest >> test02EffectCreatorCreatesACollectionOfSpotsFilledWithSpeedUps [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: SpeedUp put: 100.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: SpeedUp ) .
]

{ #category : #tests }
EffectCreatorTest >> test03EffectCreatorCreatesACollectionOfSpotsFilledWithAtomicBombs [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: AtomicBomb put: 100.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: AtomicBomb ) .
]

{ #category : #tests }
EffectCreatorTest >> test04EffectCreatorCreatesACollectionOfSpotsFilledWithCardPickers [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: CardPicker  put: 100.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: CardPicker  ) .
]

{ #category : #tests }
EffectCreatorTest >> test05EffectCreatorCreatesACollectionOfSpotsFilledWithWormHoles [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: Wormhole  put: 100.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: Wormhole  ) .
]

{ #category : #tests }
EffectCreatorTest >> test06EffectCreatorCreatesACollectionOfSpotsFilledWithNoEffectsIfNotGivenElse [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: NoEffect  ) .
]

{ #category : #tests }
EffectCreatorTest >> test07EffectCreatorCreatesACollectionOfSpotsFilledWithMoonwalk [

	| boardLayout amountOfSpots aDictionaryWithEffectProbabilities anEffectCreator efectoEnSpot |
	anEffectCreator := EffectCreator new.
	amountOfSpots := 20.
	aDictionaryWithEffectProbabilities := Dictionary new.
	aDictionaryWithEffectProbabilities at: Moonwalk   put: 100.

	boardLayout := anEffectCreator
		               for: amountOfSpots
		               with: aDictionaryWithEffectProbabilities.
	efectoEnSpot:=(boardLayout at: 2) effectAtSpot.
	self assert: (efectoEnSpot isKindOf: Moonwalk  ) .
]
