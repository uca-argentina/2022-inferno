"
i represent a type of card: acceleration
"
Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
AccelerationCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
AccelerationCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
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
	^RedoAccelerationaction
]

{ #category : #assertions }
AccelerationCard >> effectOnPlay [

	^ 1
]
