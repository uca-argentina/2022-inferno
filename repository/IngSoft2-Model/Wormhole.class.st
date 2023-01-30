"
i represent a type of effect: wormhole
"
Class {
	#name : #Wormhole,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
Wormhole >> applyTo: aBoard by: aSpaceship [

	| positionsAfterEffect  wormholeNumber |
	wormholeNumber := -4.
	positionsAfterEffect := Dictionary new: 1.
	positionsAfterEffect at: aSpaceship put: wormholeNumber.
	^positionsAfterEffect .
]
