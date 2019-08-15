Class {
	#name : #Fermenter,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state',
		'beer'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Fermenter >> asElement [
	<gtExample>
	| anElement editor1 calculatedSize |
	calculatedSize := self cntrlGetCapacity.
	editor1 := self newEditor text: 'Enter duration'.
	anElement := super asElement
		size: calculatedSize;
		layout: BlLinearLayout horizontal;
		background: Color gray veryMuchLighter;
		border: (BlBorder paint: Color gray muchLighter width: 1);
		addChild: editor1;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start fermenting';
				action: [ | duration |
					duration := editor1 text asString asNumber.
					self cntrlStartFermentingFor: duration.
					self cntrlCheckStatus: anElement ]).
	^ anElement
]

{ #category : #accessing }
Fermenter >> beerTFG: aDuration [
	| beerTFG |
	"self
		assert: [ wort isNotNil ]
		and: [ wort contains: #water ]
		and: [ wort contains: #grains ]."
	beerTFG := beer checkTFG: aDuration.
	beerTFG = 1.01
		ifTrue: [ self finishFermenting ]
]

{ #category : #accessing }
Fermenter >> clickOnCntrl: anElement [
	"if fermenting is complete then change the color"
	state = 'finished'
		ifTrue: [ self changeColor: anElement ]
		ifFalse: [self inform: 'Not enough TFG'].
	^ anElement
]

{ #category : #accessing }
Fermenter >> cntrlCheckStatus: anElement [
	"if fermenting is complete then change the color"

	state = 'finished'
		ifTrue: [ self removeIngredientsFromFermenterUI: anElement ]
		ifFalse: [ self inform: 'Not enough TFG' ].
	^ anElement
]

{ #category : #accessing }
Fermenter >> cntrlStartFermentingFor: aDuration [
	self fermentBoilFor: aDuration
]

{ #category : #accessing }
Fermenter >> fermentBoilFor: aDuration [
	self ingredients removeAll.
	aDuration seconds wait.
	self beerTFG: aDuration
]

{ #category : #accessing }
Fermenter >> finishFermenting [
	state := 'finished'.
	^ beer
]

{ #category : #accessing }
Fermenter >> initialize [
	super initialize.
	state := 'start'.
	beer := Beer new.
]

{ #category : #accessing }
Fermenter >> newEditor [
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
Fermenter >> removeIngredientsFromFermenterUI: anElement [
	"remove ingredients and replace with wort- UI specific"

	anElement removeChildAt: 3.
	anElement
		addChild:
			(BlElement new
				geometry: BlRectangle new;
				size: 100 @ 50;
				background: Color yellow;
				border: (BlBorder paint: Color black width: 1);
				yourself)
]

{ #category : #accessing }
Fermenter >> state: aString [
	state := aString
]
