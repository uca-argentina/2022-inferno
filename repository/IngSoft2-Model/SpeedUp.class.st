"
i represent a type of effect: speedup
"
Class {
	#name : #SpeedUp,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effectApplying }
SpeedUp >> applySpeedUpIn: aBoard to: aSpaceship [

	| speedUpNumber |
	speedUpNumber := 4.
	aBoard executeASpeedUpTo: aSpaceship of: speedUpNumber
]

{ #category : #applying }
SpeedUp >> applyTo: aBoard by: aSpaceship [

	self applySpeedUpIn: aBoard to: aSpaceship
]
