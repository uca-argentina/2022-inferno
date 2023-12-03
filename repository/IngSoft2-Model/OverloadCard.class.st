"
i represent a type of card: overload
"
Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
OverloadCard >> = aCard [

	^ self class = aCard class
]

{ #category : #assertions }
OverloadCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
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

	^ -2
]
