# Rover

## Run

```
git clone git@github.com:jaycanty/Rovers.git
cd Rovers
open Rovers.xcodeproj
```
and run!

## Desscription

- First screen: enter the size of the grid
- Second screen: play with the ui to route the rovers
- Third screen: show the rovers roving

## Departures from spec (time constraints)

- The rover turns and advances, it does not turn in the square as specified  
- All rovers must complete the same number of meneuvers  
-- Bug in animateKeyFrames  
-- Bug with occupying another rovers last position  
- Rovers can go in reverse

## Shortcomings

- The obvious, is lack of feedback when routing
- All logic departures from the spec
- routing reverse overwrites the previous grid symbol
- Architecture is inconsistent

## Future features

- Roving rovers change orientation
- Show all rovers' routes when plotting
