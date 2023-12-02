"
I represent an action made by a speed card
"
Class {
	#name : #SpeedAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: anOverloadCard [ 
	 
	aGameInstance
			currentSpaceshipPlaysCard: anOverloadCard
			applyTo: aTargetedSpaceship
			playedBy: aSpaceship .
]
