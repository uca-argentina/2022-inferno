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
	1 to: (aCollection size + 1) do: [:spaceship |
    spaceship > (aCollection size) ifTrue: [
    		activeMods add: (Mods spaceshipMods: 'General').
	] ifFalse: [
    		activeMods add: (Mods spaceshipMods: (aCollection at: spaceship)).
	].
].

]

{ #category : #handlers }
CardsHandler >> modsAffecting: aSpaceship [ 
 | test test2 |
	activeMods do: [:mod |
		test := mod spaceshipAffected.
     (mod spaceshipAffected = aSpaceship) ifTrue: [ 
		test2 := mod modsOnSpaceship.
		^mod modsOnSpaceship.
	 ].
	].
]

{ #category : #accessing }
CardsHandler >> to: aSpaceship [ 
	^self modsAffecting: aSpaceship. 
]
