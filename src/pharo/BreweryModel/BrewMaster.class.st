Class {
	#name : #BrewMaster,
	#superclass : #Object,
	#category : #BreweryModel
}

{ #category : #accessing }
BrewMaster >> finishBoiling [
	| kettle theBoil |
	kettle := self setupEquipments at: 2.
	theBoil := self startBoiling.
	theBoil TOG <= 1.08
		ifTrue: [ kettle state: 'finished' ].
	^ theBoil
]

{ #category : #accessing }
BrewMaster >> finishFermenting [
	<gtExample>
	| fermenter beer |
	fermenter := self setupEquipments at: 3.
	beer := self startFermenting.
	beer TFG = 1.01
		ifTrue: [ fermenter state: 'finished' ].
	^ beer
]

{ #category : #accessing }
BrewMaster >> finishMashing [
	| mashTun wort |
	wort := self startMashing.
	mashTun := self setupEquipments at: 1.
	wort consistency = 5
		ifTrue: [ mashTun state: 'finished' ].
	^ wort
]

{ #category : #accessing }
BrewMaster >> prepareBoiling: hop1 and: hop2 [
	| wort kettle theBoil duration1 duration2 remainingDuration |
	wort := self finishMashing.
	kettle := self setupEquipments at: 2.
	duration1 := 10.
	duration2 := 50.
	remainingDuration := 10.
	^ {wort.
	hop1.
	hop2.
	duration1.
	duration2.
	remainingDuration}
]

{ #category : #accessing }
BrewMaster >> prepareFermenting: yeast [
	| theBoil fermenter duration |
	theBoil := self finishBoiling.
	fermenter := self setupEquipments at: 3.
	duration := 7.
	^ {theBoil.
	yeast.
	duration}
]

{ #category : #accessing }
BrewMaster >> prepareMashing: grains with: water [
	| mashTun aDuration |
	mashTun := self setupEquipments at: 1.
	aDuration := 60.
	^ {grains.
	water.
	aDuration}
]

{ #category : #accessing }
BrewMaster >> setupEquipments [
<gtExample>
	| mashTun kettle fermenter |
	mashTun := MashTun new.
	kettle := Kettle new.
	fermenter := Fermenter new.
	^ {mashTun.
	kettle.
	fermenter}
]

{ #category : #accessing }
BrewMaster >> startBoiling [
	| wort kettle hopes1 hopes2 duration1 duration2 remainingDuration theBoil |
	wort := self prepareBoiling at: 1.
	hopes1 := self prepareBoiling at: 2.
	hopes2 := self prepareBoiling at: 3.
	duration1 := self prepareBoiling at: 4.
	duration2 := self prepareBoiling at: 5.
	remainingDuration := self prepareBoiling at: 6.
	kettle := self setupEquipments at: 2.
	theBoil := kettle
		boil: hopes1
		at: duration1
		and: hopes2
		at: duration2
		forAnother: remainingDuration
		in: wort.
	^ theBoil
]

{ #category : #accessing }
BrewMaster >> startFermenting [
	| fermenter yeast theBoil duration beer |
	fermenter := self setupEquipments at: 3.
	theBoil := self prepareFermenting at: 1.
	yeast := self prepareFermenting at: 2.
	duration := self prepareFermenting at: 3.
	beer := fermenter add: yeast to: theBoil andWaitFor: duration.
	^ beer
]

{ #category : #accessing }
BrewMaster >> startMashing [
	| mashTun grains water aDuration wort |
	grains := self prepareMashing at: 1.
	water := self prepareMashing at: 2.
	aDuration := self prepareMashing at: 3.
	mashTun := self setupEquipments at: 1.
	wort := mashTun mash: grains with: water for: aDuration.
	^ wort
]
