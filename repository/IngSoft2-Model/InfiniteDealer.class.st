"
I represent a Dealer

"
Class {
	#name : #InfiniteDealer,
	#superclass : #Object,
	#instVars : [
		'typesOfCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
InfiniteDealer class >> assertValidTypes: aCollectionOfTypes [ 
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

{ #category : #initializing }
InfiniteDealer class >> ofTypes: aCollectionOfTypes [ 
	self assertValidTypes: aCollectionOfTypes.
 	^self new initializeWith: aCollectionOfTypes 
]

{ #category : #adding }
InfiniteDealer >> addToDiscardDeck: aCard [

	nil
]

{ #category : #dealing }
InfiniteDealer >> dealInitialCards [

	| randomcard1 randomcard2 |
	randomcard1 := self dealOne.
	randomcard2 := self dealOne.
	^ Hand containing: { 
			  randomcard1.
			  randomcard2 }
]

{ #category : #dealing }
InfiniteDealer >> dealOne [

	| randomcard |
	randomcard := typesOfCards atRandom.
	^ randomcard
]

{ #category : #initialization }
InfiniteDealer >> initializeWith: aCollectionOfTypes [

	typesOfCards := aCollectionOfTypes
]
