import { Footer } from '../../components/Footer'
import { MainMenuHeader } from '../../components/Header/HeaderMenu'
import { MainMenuContainer } from './styles'

export function Home() {
  return (
    <>
      <MainMenuContainer>
        <MainMenuHeader />
        <Footer />
      </MainMenuContainer>
    </>
  )
}
