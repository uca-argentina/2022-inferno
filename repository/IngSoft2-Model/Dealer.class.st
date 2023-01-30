"
I represent a Dealer

"
Class {
	#name : #Dealer,
	#superclass : #Object,
	#instVars : [
		'typesOfCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initializing }
Dealer class >> ofCards: arrayOfTypesOfCards [

 	^self new initializeWith: arrayOfTypesOfCards 
]

{ #category : #dealing }
Dealer >> dealInitialCards [

	| randomcard1 randomcard2 |
	randomcard1 := self dealOne.
	randomcard2 := self dealOne.
	^ Hand containing: {randomcard1. randomcard2}.

]

{ #category : #dealing }
Dealer >> dealOne [

	| randomcard | 
	randomcard := typesOfCards atRandom.
	^ randomcard
]

{ #category : #initialization }
Dealer >> initializeWith: arrayOfTypes [ 

	typesOfCards := arrayOfTypes 
]
