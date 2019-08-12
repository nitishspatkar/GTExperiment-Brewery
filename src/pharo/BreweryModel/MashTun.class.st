Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state',
		'wort'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> addGrains: grainType [
	self assert: [ wort isNotNil ] and: [ wort contains: #water ].
	wort addGrains: grainType
]

{ #category : #accessing }
MashTun >> addWater: water [
	self assert: [ wort isNil ].
	wort := Wort new.
	wort addWater: water
]

{ #category : #accessing }
MashTun >> addWater: water ofVolume: aVolume [
	self assert: [ wort isNil ].
	wort := Wort new.
	wort addWater: water ofVolume: aVolume
]

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement editor1 editor2 calculatedSize|
	calculatedSize:= self cntrlGetCapacity.
	editor1 := self newEditor text: 'Enter grain type'.
	editor2 := self newEditor text: 'Enter duration in minutes'.
	anElement := super asElement
		layout: BlLinearLayout horizontal;
		size: calculatedSize;
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1);
		"addChild: editor1;
		addChild: editor2;"
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start mashing';
				action: [ | duration grainType|
					grainType := editor1 text asString .
					duration := editor2 text asString asNumber.
					[ (duration / 10) seconds wait.
					self cntrlStartMashing: grainType for: duration.
					self clickOnCntrl: anElement ] fork ]).
	^ anElement
]

{ #category : #accessing }
MashTun >> changeColor: anElement [
	anElement background: Color blue.
]

{ #category : #accessing }
MashTun >> clickOnCntrl: anElement [
	"if mashing is complete then change the color"
	state = 'finished'
		ifTrue: [ self changeColor: anElement ]
		ifFalse: [self inform: 'Not enough consistency'].
	^ anElement
]

{ #category : #accessing }
MashTun >> cntrlStartMashing: grainType for: aNumber [
	self mash: grainType with: 'water' for: aNumber
]

{ #category : #accessing }
MashTun >> finishMashing [
	state := 'finished'.
	^ [ wort ]
		ensure: [ wort := nil ]
]

{ #category : #accessing }
MashTun >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'MashTun';
		stencil: [ self asElement ]
]

{ #category : #accessing }
MashTun >> initialize [
	super initialize.
	state := 'start'
]

{ #category : #accessing }
MashTun >> mashWortForDuration: aDuration [
	self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ] wort
		mashWortForDuration: aDuration
]

{ #category : #accessing }
MashTun >> newEditor [
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		geometry: (BlRectangle cornerRadius: 4);
		background: Color white;
		border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
		padding: (BlInsets all: 3);
		hExact: 100;
		vFitContent;
		yourself
]

{ #category : #accessing }
MashTun >> state: aString [
	state := aString
]

{ #category : #accessing }
MashTun >> wortConsistency [
	self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ].
	^ wort consistency
]
