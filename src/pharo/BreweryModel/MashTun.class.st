Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#instVars : [
		'state'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement |
	anElement := super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1);
		addChild:
			(BrButton new
				look: BrGlamorousButtonWithLabelLook;
				label: 'Start mashing';
				action: [ self startMashingCntrl.
					self clickOnCntrl: anElement ]);
		addChild: (self getDropDown).
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
MashTun >> finishMashing [
	state:= 'finished'
]

{ #category : #accessing }
MashTun >> getDropDown [
	| dropdown |
	dropdown := BrDropdown new.
	^ dropdown
		look: BrGlamorousDropdownLook;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		toggle: [ BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousIcons add asElement;
				yourself ];
		popup: [ | editor button |
			editor := BrEditor new
				look: BrGlamorousRegularEditorLook new;
				geometry: (BlRectangle cornerRadius: 4);
				border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
				hExact: 100;
				vMatchParent;
				padding: (BlInsets all: 3);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself.
			button := BrButton new
				look: BrGlamorousButtonWithIconLook;
				margin: (BlInsets left: 10);
				icon: BrGlamorousIcons accept asElement;
				action: [ dropdown collapse ];
				yourself.
			BlElement new
				layout: BlLinearLayout horizontal;
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChild: editor;
				addChild: button;
				yourself ];
		yourself
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
MashTun >> mash: grains with: water for: aDuration [
	| wort |
	wort := Wort new.
	wort checkConsistency: aDuration.
	wort consistency = 5
		ifTrue: [ self finishMashing ].
	^ wort
]

{ #category : #accessing }
MashTun >> mashTunOperationExample [
	<gtExample>
	| mashTun grains water wort |
	mashTun := MashTun new.
	grains := Grain new.
	water := Water new.
	mashTun mash: grains with: water for: 31.
	"self decisionController."
	^ mashTun
]

{ #category : #accessing }
MashTun >> startMashingCntrl [
	self mash: 'grains' with: 'water' for: 31.
]

{ #category : #accessing }
MashTun >> testExample [
	<gtExample>
	| dropdown |
	dropdown := BrDropdown new.
	^ dropdown
		look: BrGlamorousDropdownLook;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		toggle: [ BrButton new
				look: BrGlamorousButtonWithIconLook;
				icon: BrGlamorousIcons add asElement;
				yourself ];
		popup: [ | editor button |
			editor := BrEditor new
				look: BrGlamorousRegularEditorLook new;
				geometry: (BlRectangle cornerRadius: 4);
				border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1);
				hExact: 100;
				vMatchParent;
				padding: (BlInsets all: 3);
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent ];
				yourself.
			button := BrButton new
				look: BrGlamorousButtonWithIconLook;
				margin: (BlInsets left: 10);
				icon: BrGlamorousIcons accept asElement;
				action: [ dropdown collapse.
					];
				yourself.
			BlElement new
				layout: BlLinearLayout horizontal;
				padding: (BlInsets all: 10);
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChild: editor;
				addChild: button;
				yourself ];
		yourself
]
