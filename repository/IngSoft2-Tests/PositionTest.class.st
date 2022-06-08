Class {
	#name : #PositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PositionTest >> test01APositionHasLapNumberAndSpotNumber [
	| aPosition testPos |
	testPos := Array new: 2.
	testPos at: 1 put: 2.
	testPos at: 2 put: 3.
	aPosition := Position atLap: 2 andSpot: 3.
	self assert: (aPosition lapNumber) equals: (testPos at: 1) .
	self assert: (aPosition spotNumber) equals: (testPos at: 2)
]