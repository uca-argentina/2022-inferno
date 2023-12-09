"
i represent a type of card, speed
"
Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
SpeedCard class >> assertThatIsACard [ 
	^ true
]

{ #category : #assertions }
SpeedCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
SpeedCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
]

{ #category : #boosting }
SpeedCard >> boost [
	effect := effect * 2.
]

{ #category : #assertions }
SpeedCard >> checkIfItIsAValidCard [

	^ true
]

{ #category : #creating }
SpeedCard >> createOwnAction [
	^ SpeedOrOverloadAction new.
]

{ #category : #redoer }
SpeedCard >> createOwnRedoAction [
	^ RedoSpeedOrOverloadAction new.
]

{ #category : #playing }
SpeedCard >> effectOnPlay [

	^ effect.
]

{ #category : #playing }
SpeedCard >> initialize [ 
	effect := 1.
]
