"
I represent a null card. a Card that does not exists..
"
Class {
	#name : #NullCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
NullCard >> = aCard [

	^ self class = aCard class
]

{ #category : #asserting }
NullCard >> assertThatIsACard [

	^ self checkIfItIsAValidCard
]

{ #category : #assertions }
NullCard >> checkIfItIsAValidCard [

	^ false
]
