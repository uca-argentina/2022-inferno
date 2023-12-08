"
Handles the cards applied on the game
"
Class {
	#name : #CardsHandler,
	#superclass : #Object,
	#instVars : [
		'activeMods'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #handlers }
CardsHandler >> manage: aCollection [

	activeMods := OrderedCollection new.
	1 to: aCollection size + 1 do: [ :spaceship | 
		spaceship > aCollection size
			ifTrue: [ activeMods add: (Mods spaceshipMods: 'General') ]
			ifFalse: [ 
			activeMods add: (Mods spaceshipMods: (aCollection at: spaceship)) ] ]
]

{ #category : #handlers }
CardsHandler >> modsAffecting: aSpaceship [

	activeMods do: [ :mod | 
		mod spaceshipAffected = aSpaceship ifTrue: [ 
			^ mod modsOnSpaceship ] ]
]

{ #category : #accessing }
CardsHandler >> to: aSpaceship [

	^ (self modsAffecting: aSpaceship)
]
