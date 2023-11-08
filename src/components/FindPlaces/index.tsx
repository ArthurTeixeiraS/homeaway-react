import { FiltersNav } from './FiltersNav'
import { PlaceBlock } from './PlaceBlock'
import { FindPlacesContainer } from './styles'

export function FindPlaces() {
  return (
    <FindPlacesContainer>
      <FiltersNav />
      <div className="roomBlocksContainer">
        <PlaceBlock />
        <PlaceBlock />
        <PlaceBlock />
      </div>
    </FindPlacesContainer>
  )
}
