"
i represent a type of card: overload
"
Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
OverloadCard class >> assertThatIsACard [
	^ true
]

{ #category : #comparing }
OverloadCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
OverloadCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
]

{ #category : #boosting }
OverloadCard >> boost [
	effect:= effect * 2.
]

{ #category : #assertions }
OverloadCard >> checkIfItIsAValidCard [

	^ true
]

{ #category : #creating }
OverloadCard >> createOwnAction [
	^ SpeedOrOverloadAction new.
]

{ #category : #redoer }
OverloadCard >> createOwnRedoAction [
	^ RedoSpeedOrOverloadAction new.
]

{ #category : #effect }
OverloadCard >> effectOnPlay [

	^ effect.
]

{ #category : #effect }
OverloadCard >> initialize [
	effect := -2.
]
