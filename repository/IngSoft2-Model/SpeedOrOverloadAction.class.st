"
I represent an action made by a speed card
"
Class {
	#name : #SpeedOrOverloadAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedOrOverloadAction >> on: aGameInstance by: aSpaceship to: aTargetedSpaceship with: anOverloadOrSpeedCard [

	aGameInstance
		currentSpaceshipPlaysCard: anOverloadOrSpeedCard
		applyTo: aTargetedSpaceship
		playedBy: aSpaceship
]
