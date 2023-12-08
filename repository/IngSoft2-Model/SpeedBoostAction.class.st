"
I represent the action made by a speedBoost card.
"
Class {
	#name : #SpeedBoostAction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #applying }
SpeedBoostAction >> on: aGameInstance by: aSpaceship to: affected with: aSpeedBostCard [ 
	aGameInstance 
		boostCard: (affected at: 2)
		from: (affected at: 1)
		playedBy: aSpaceship 
		with: aSpeedBostCard 
]
