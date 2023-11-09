import { Container } from './styles'
import hotel from '../../../assets/backgrounds/house-3.png'

export function PlaceBlock() {
  return (
    <Container>
      <div className="imgContainer">
        <img src={hotel} alt="" />
      </div>
    </Container>
  )
}
