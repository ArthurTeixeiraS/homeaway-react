import rightArrow from '../../assets/right-arrow.png'
import { FooterContainer, NewsLatter } from './styles'
import playStoreIcon from '../../assets/ion_logo-google-playstore.png'
import appleStoreIcon from '../../assets/AppleStoreLogo.png'
import fbIcon from '../../assets/fb icon.png'
import twitterIcon from '../../assets/twitter icon.png'
import instagramIcon from '../../assets/insta icon.png'
import linkedinIcon from '../../assets/linkedin icoon.png'

export function Footer() {
  return (
    <>
      <NewsLatter>
        <div className="newslatterlabel">
          <h4>Novidades</h4>
          <p>Fique por dentro!</p>
        </div>
        <div className="emailSend">
          <form action="">
            <input type="email" placeholder="Digite seu e-mail" required />
            <button type="submit">
              <img src={rightArrow} alt="" />
            </button>
          </form>
        </div>
      </NewsLatter>
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
            <li>Sobre Nós</li>
            <li>Informações Legais</li>
            <li>Contate-nos</li>
            <li>Blogs</li>
          </ul>
        </div>
        <div className="helpList">
          <p>Suporte</p>
          <ul>
            <li>Encontrar Imóveis</li>
            <li>Como hospedar</li>
            <li>Por que o HomeAway?</li>
            <li>FaQs</li>
            <li>Guias de aluguel</li>
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
              <img src={linkedinIcon} alt="" />
            </div>
          </ul>
        </div>
      </FooterContainer>
    </>
  )
}
