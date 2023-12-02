"
I represent an action or play made by an acceleration card.
"
Class {
	#name : #AccelerationAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
AccelerationAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: anAccelerationCard [ 
	aGameInstance currentSpaceshipPlaysCard: anAccelerationCard playedBy: aSpaceship 
]
