import { FiltersNav } from './FiltersNav'
import { HotelCard } from './HotelCard/styles'
import { FindPlacesContainer } from './styles'

export function FindPlaces() {
  return (
    <FindPlacesContainer>
      <FiltersNav />
      <HotelCard />
      <HotelCard />
    </FindPlacesContainer>
  )
}
