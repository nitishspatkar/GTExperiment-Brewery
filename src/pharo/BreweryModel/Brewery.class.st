Class {
	#name : #Brewery,
	#superclass : #Object,
	#instVars : [
		'equipments',
		'inventory',
		'ingredients'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Brewery >> asElement [
	| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
		with: equipments.
	m layout tree.
	^ m
]

{ #category : #accessing }
Brewery >> asInventory [
| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
		with: inventory.
	m layout tree.
	^ m
]

{ #category : #accessing }
Brewery >> asRecipe [
	| m dropTarget equipment |
	dropTarget := nil.
	m := GtMondrian new.
	m nodes
		stencil: [ :e | 
			| element |
			element := e asElement.
			element
				addEventHandlerOn: BlClickEvent
					do: [ :f | 
					element == f target
						ifTrue: [ dropTarget
								ifNotNil: [ dropTarget border: (BlBorder paint: Color blue asBlPaint width: 5) ].
							dropTarget == f target
								ifTrue: [ dropTarget := nil.
									equipment := nil ]
								ifFalse: [ dropTarget := f target.
									equipment := e.
									dropTarget
										border: (BlBorder paint: Color red asBlPaint width: 5) ] ] ];
				yourself ];
		with: equipments.
	m nodes
		stencil: [ :e | 
			| element |
			element := e asElement.
			element
				addEventHandlerOn: BlClickEvent
					do: [ :f | 
					(element == f target and: [ dropTarget isNotNil ])
						ifTrue: [ element removeFromParent.
							dropTarget addChild: element.
							equipment addIngredients: {e}.
							"After finishing process inside equipment if ingredients are nil then remove it from UI"
							equipment ingredients isEmpty
								ifTrue: [ self inform: 'remove from UI' ] ] ];
				yourself ];
		with: ingredients.
	m layout tree.
	^ m
]

{ #category : #accessing }
Brewery >> brewMaster: master [
	brewMaster := master
]

{ #category : #accessing }
Brewery >> equipments [
	^ equipments
]

{ #category : #accessing }
Brewery >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'Brewery';
		stencil: [ self asElement ]
]

{ #category : #accessing }
Brewery >> gtLiveForInventory: aView [
	<gtView>
	^ aView explicit
		priority: 2;
		title: 'Inventory';
		stencil: [ self asInventory ]
]

{ #category : #accessing }
Brewery >> gtLiveForRecipe: aView [
	<gtView>
	^ aView explicit
		priority: 3;
		title: 'Recipe';
		stencil: [ self asRecipe ]
]

{ #category : #accessing }
Brewery >> ingredients [
	^ ingredients
]

{ #category : #accessing }
Brewery >> initialize [
	|malt1 malt2 hops1 hops2 yeast1 yeast2 mashTun1 mashTun2 kettle1 kettle2 fermenter1 fermenter2 |
	super initialize.
	equipments := OrderedCollection new.
	inventory := OrderedCollection new.
	ingredients:= OrderedCollection new.

	malt1 := MunichMalt new.
	malt2 := ViennaMalt new.
	
	hops1 := MagnumHop new.
	hops2 := ChinookHop new.
	
	yeast1 := CoopersYeast new.
	yeast2 := FermentisYeast new.
	mashTun1 := MashTun new capacity: 20.
	mashTun2 := MashTun new capacity: 50.
	kettle1 := Kettle new capacity: 20.
	kettle2 := Kettle new capacity: 50.
	fermenter1 := Fermenter new capacity: 20.
	fermenter2 := Fermenter new capacity: 50.
	
	inventory
		addAll:
			{malt1.
			malt2.
			hops1.
			hops2.
			yeast1.
			yeast2.
			mashTun1.
			mashTun2.
			kettle1.
			kettle2.
			fermenter1.
			fermenter2}
]

{ #category : #accessing }
Brewery >> inventory [
	^ inventory
]
