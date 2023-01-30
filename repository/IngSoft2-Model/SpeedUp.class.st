"
i represent a type of effect: speedup
"
Class {
	#name : #SpeedUp,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedUp >> applyTo: aBoard by: aSpaceship [

	| speedUpNumber positionsAfterEffect |
	speedUpNumber := 4.
	positionsAfterEffect := Dictionary new: 1.
	positionsAfterEffect at: aSpaceship put: speedUpNumber.
	^positionsAfterEffect .
]
