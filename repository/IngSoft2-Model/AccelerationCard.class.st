"
i represent a type of card: acceleration
"
Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
AccelerationCard class >> assertThatIsACard [
	^ true
]

{ #category : #comparing }
AccelerationCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
AccelerationCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
]

{ #category : #boosting }
AccelerationCard >> boost [
	effect := effect *2.
]

{ #category : #assertions }
AccelerationCard >> checkIfItIsAValidCard [

	^ true
]

{ #category : #creating }
AccelerationCard >> createOwnAction [
	^ AccelerationAction new.
]

{ #category : #redoer }
AccelerationCard >> createOwnRedoAction [
	^ RedoAccelerationaction new.
]

{ #category : #assertions }
AccelerationCard >> effectOnPlay [

	^ effect.
]

{ #category : #assertions }
AccelerationCard >> initialize [ 
	effect:= 1.
]
