"
i represent a type of card, speed
"
Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #assertions }
SpeedCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
SpeedCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
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

	^ 1
]
