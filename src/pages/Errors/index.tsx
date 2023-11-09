import { Container } from './styles'
import homeawayLogo from '../../assets/logoHomeAway.png'

export function Error() {
  return (
    <Container>
      <img src={homeawayLogo} alt="" />
      <div>
        <h1>
          Opa! Página não <br />
          encontrada <span>=/</span>
        </h1>
        <p>
          A página que você procura parece{' '}
          <span className="notExists">não existir</span>, ou ainda pode estar em
          desenvolvimento. <br />
          Aguarde pois nossos <span className="dev">desenvolvedores</span> estão
          trabalhando duro nisso!
        </p>
      </div>
    </Container>
  )
}
