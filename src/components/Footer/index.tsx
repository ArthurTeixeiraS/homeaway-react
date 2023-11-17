import { FooterContainer } from './styles'
import playStoreIcon from '../../assets/ion_logo-google-playstore.png'
import appleStoreIcon from '../../assets/AppleStoreLogo.png'
import fbIcon from '../../assets/fb icon.png'
import twitterIcon from '../../assets/twitter icon.png'
import instagramIcon from '../../assets/insta icon.png'
import { Link } from 'react-router-dom'

export function Footer() {
  return (
    <>
      <FooterContainer>
        <div className="infoContainer">
          <h4>
            Home<span>Away</span>
          </h4>
          <p>
            Conheça nosso app para alugar rapidamente,
            <br /> na palma da sua mão!
          </p>
          <div className="buttons">
            <button>
              <img src={playStoreIcon} alt="" />
              PlayStore
            </button>
            <button>
              <img src={appleStoreIcon} alt="" />
              AppStore
            </button>
          </div>
        </div>
        <div className="companyList">
          <p>Empresa</p>
          <ul>
            <Link to="/aboutHomeaway">Sobre Nós</Link>
            <li>Informações Legais</li>
            <Link to="mailto:arthurteixeiraserafim@gmail.com">Contate-nos</Link>
            <li>Blogs</li>
          </ul>
        </div>
        <div className="helpList">
          <p>Suporte</p>
          <ul>
            <Link to="/findPlaces">Encontrar Imóveis</Link>
            <Link to="/rentalGuides">Como hospedar</Link>
            <li>Por que o HomeAway?</li>
            <li>FaQs</li>
            <Link to="/howToRental">Guias de aluguel</Link>
          </ul>
        </div>
        <div className="contactInfoList">
          <p>Informações de Contrato</p>
          <ul>
            <li>Telefone: +55 48 99999-9999</li>
            <li>Email HomeAwaySup@homeaway.com</li>
            <li>Localização Sede: Rua Henrique Lage, Içara, SC</li>
            <div className="icons">
              <img src={fbIcon} alt="" />
              <img src={twitterIcon} alt="" />
              <img src={instagramIcon} alt="" />
            </div>
          </ul>
        </div>
      </FooterContainer>
    </>
  )
}
