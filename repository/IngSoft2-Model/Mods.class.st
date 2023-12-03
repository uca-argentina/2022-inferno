"
Manages applied cards moddifying spaceships rolls
"
Class {
	#name : #Mods,
	#superclass : #Object,
	#instVars : [
		'affected',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Mods class >> spaceshipMods: aSpaceship [
	^self new modFor: aSpaceship.
]

{ #category : #'as yet unclassified' }
Mods >> modFor: aSpaceship [ 
	affected := aSpaceship.
	cards := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Mods >> modsOnSpaceship [
	^ cards.
]

{ #category : #'as yet unclassified' }
Mods >> spaceshipAffected [
	^ affected.
]
