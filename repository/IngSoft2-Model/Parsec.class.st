"
I represent a type of distance: a Parsec
"
Class {
	#name : #Parsec,
	#superclass : #Object,
	#instVars : [
		'distance'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance cre' }
Parsec class >> assertValid: aTotalDistance [

	aTotalDistance >=0 ifFalse: [ 
		Error signal: 'Parsecs value has to be greater or equal than zero' ]
]

{ #category : #'instance cre' }
Parsec class >> distanceOf: aDistance [

	self assertValid: aDistance.
	^ self new initializeWith: aDistance
]

{ #category : #actions }
Parsec >> <= aDistance [

	^ self distancetInParsecs <= aDistance distancetInParsecs
]

{ #category : #accessing }
Parsec >> distance [

	^ distance
]

{ #category : #actions }
Parsec >> distanceInLightYears [

	^ distance * 3
]

{ #category : #actions }
Parsec >> distancetInParsecs [

	^ distance
]

{ #category : #initialization }
Parsec >> initializeWith: aDistance [

	distance := aDistance
]

{ #category : #validation }
Parsec >> isValid [

	^ distance >= 0
]
