"
I represent a SpeedBost Card
"
Class {
	#name : #SpeedBoostCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
SpeedBoostCard >> = aCard [

	^ self class = aCard class
]

{ #category : #comparing }
SpeedBoostCard >> assertThatIsACard [ 
	^ self checkIfItIsAValidCard 
]

{ #category : #comparing }
SpeedBoostCard >> checkIfItIsAValidCard [ 
	^ true 
]

{ #category : #creating }
SpeedBoostCard >> createOwnAction [
	^ SpeedBoostAction new.
]
