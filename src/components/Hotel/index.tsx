import { HotelCard } from './HotelCard'
import { Container, TitleContainer } from './styles'

export function HotelsComponent() {
  return (
    <Container>
      <TitleContainer>
        <h1>Aqui estão os dados do seu hotel...</h1>
      </TitleContainer>
      <div className="cardContainer">
        <HotelCard />
      </div>
    </Container>
  )
}
