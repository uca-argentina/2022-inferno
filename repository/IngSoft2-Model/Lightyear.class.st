"
I represent a type of distance: a Lightyear
"
Class {
	#name : #Lightyear,
	#superclass : #Object,
	#instVars : [
		'distance'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Lightyear class >> assertValid: aDistance [

	aDistance >=0 ifFalse: [ 
		Error signal: 'LightYears value has to be greater or equal than zero' ].
]

{ #category : #'instance creation' }
Lightyear class >> distanceOf: aDistance [

	self assertValid: aDistance.
	^ self new initializeWith: aDistance
]

{ #category : #actions }
Lightyear >> <= aDistance [
	
	^ self distance <= aDistance distanceInLightYears .
]

{ #category : #actions }
Lightyear >> distance [

	^ distance
]

{ #category : #actions }
Lightyear >> distanceInLightYears [

	^ distance
]

{ #category : #actions }
Lightyear >> distancetInParsecs [

	^ distance / 3
]

{ #category : #initialize }
Lightyear >> initializeWith: aDistance [

	distance := aDistance
]

{ #category : #validation }
Lightyear >> isValid [
	^ distance >=0
]
