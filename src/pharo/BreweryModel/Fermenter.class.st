Class {
	#name : #Fermenter,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Fermenter >> add: yeast to: theBoil andWaitFor: aDuration [
	| rawBeer |
	rawBeer := RawBeer new.
	rawBeer checkTFG: aDuration.
	rawBeer TFG = 1.01
		ifTrue: [ self finishFermenting ].
	^ rawBeer
]

{ #category : #accessing }
Fermenter >> asElement [
	<gtExample>
	| anElement editor1 editor2 |
	editor1 := self newEditor text: 'Enter  yeast type'.
	editor2 := self newEditor text: 'Enter duration'.
	anElement := super asElement
		layout: BlLinearLayout horizontal;
		background: Color gray veryMuchLighter;
		border: (BlBorder paint: Color gray muchLighter width: 1);
		addChild: editor1;
		addChild: editor2;
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start fermenting';
				action: [ | yeast duration |
					yeast := editor1 text asString.
					duration := editor2 text asString asNumber.
					[ duration seconds wait.
					self cntrlStartFermenting: yeast with: 'theBoil' for: duration.
					self clickOnCntrl: anElement ] fork ]).
	^ anElement
]

{ #category : #accessing }
Fermenter >> changeColor: anElement [
	anElement background: Color gray.
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
Fermenter >> cntrlStartFermenting: yeast with: theBoil for: duration [
	self add: yeast to: theBoil andWaitFor: duration.
]

{ #category : #accessing }
Fermenter >> finishFermenting [
	state := 'finished'
]

{ #category : #accessing }
Fermenter >> initialize [
	super initialize.
	state := 'start'
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
